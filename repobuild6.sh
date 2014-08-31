#!/bin/bash

repodir=/repos
channels="\
rhel-6-server-openstack-5.0-rpms \
rhel-6-server-openstack-foreman-rpms \
rhel-6-server-rpms \
rhel-ha-for-rhel-6-server-rpms \
rhel-lb-for-rhel-6-server-rpms \
rhel-6-server-rh-common-rpms \
rhel-6-server-optional-rpms \
rhs-2.1-for-rhel-6-server-rpms \
rhel-6-server-eus-rpms \
rhel-sfs-for-rhel-6-server-eus-rpms \
"

which reposync > /dev/null 2>&1 || yum install -y yum-utils
which createrepo > /dev/null 2>&1 || yum install -y createrepo

prev_dir=$(pwd)
cd ${repodir}
for chan in ${channels}; do
	echo "[${chan}]"
	reposync -n --repoid=${chan}
	createrepo ${chan}
done

chcon -R -u system_u -t httpd_sys_content_t ${repodir}
cd ${prev_dir}
