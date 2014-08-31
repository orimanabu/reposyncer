#!/bin/bash

repodir=/repos
channels="\
rhel-7-server-rpms \
rhel-7-server-openstack-5.0-rpms \
rhel-7-server-rh-common-rpms \
rhel-7-server-optional-rpms \
"

which reposync > /dev/null 2>&1 || yum install -y yum-utils
which createrepo > /dev/null 2>&1 || yum install -y createrepo

prev_dir=$(pwd)
cd ${repodir}
for chan in ${channels}; do
	echo "[${chan}]"
	reposync -n --repoid=${chan}
	createrepo ${chan}
	chcon -R -u system_u -t httpd_sys_content_t ${chan}
done

cd ${prev_dir}
