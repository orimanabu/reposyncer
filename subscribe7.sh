#!/bin/sh

for channel in \
rhel-7-server-openstack-6.0-rpms \
rhel-7-server-openstack-6.0-installer-rpms \
rhel-7-server-openstack-5.0-rpms \
rhel-7-server-rh-common-rpms \
rhel-7-server-optional-rpms \
rhel-7-server-rpms \
rhel-7-server-supplementary-rpms \
rhel-7-server-v2vwin-1-rpms \
; do
	subscription-manager repos --enable=${channel}
done

for channel in \
rhel-7-server-htb-rpms \
rhel-ha-for-rhel-7-server-htb-rpms \
rhel-ha-for-rhel-7-server-rpms \
rhel-lb-for-rhel-7-server-htb-rpms \
rhel-rs-for-rhel-7-server-htb-rpms \
rhel-rs-for-rhel-7-server-rpms \
rhel-sap-for-rhel-7-server-rpms \
; do
	subscription-manager repos --disable=${channel}
done
