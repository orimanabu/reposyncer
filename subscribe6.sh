#!/bin/sh

for channel in \
rhel-6-server-openstack-foreman-rpms \
rhel-6-server-openstack-5.0-rpms \
rhel-6-server-rhev-agent-rpms \
rhel-server-rhscl-6-rpms \
; do
	subscription-manager repos --enable=${channel}
done

for channel in \
rhel-6-server-aus-rpms \
rhel-6-server-eus-rpms \
rhel-6-server-grid-rpms \
rhel-6-server-htb-rpms \
rhel-6-server-realtime-rpms \
rhel-6.2-scalefs-server-for-rhs-2.0-rpms \
rhel-6.2-server-for-rhs-2.0-rpms \
rhel-ha-for-rhel-6-server-aus-rpms \
rhel-ha-for-rhel-6-server-eus-rpms \
rhel-hpn-for-rhel-6-server-rpms \
rhel-lb-for-rhel-6-server-aus-rpms \
rhel-lb-for-rhel-6-server-eus-rpms \
rhel-rs-for-rhel-6-server-aus-rpms \
rhel-rs-for-rhel-6-server-eus-rpms \
rhel-rs-for-rhel-6-server-rpms \
rhel-sap-for-rhel-6-server-rpms \
rhel-sap-hana-for-rhel-6-server-rpms \
rhel-scalefs-for-rhel-6-server-rpms \
rhel-server-6-rhds-9-rpms \
rhel-server-dts-6-eus-rpms \
rhel-server-dts-6-rpms \
rhel-server-dts2-6-eus-rpms \
rhel-server-dts2-6-rpms \
rhel-sfs-for-rhel-6-server-aus-rpms \
rhel-sfs-for-rhel-6-server-eus-rpms \
rhel-sjis-for-rhel-6-server-rpms \
rhs-2.0-for-rhel-6-server-rpms \
rhsc-2.0-for-rhel-6-server-rpms \
; do
	subscription-manager repos --disable=${channel}
done
