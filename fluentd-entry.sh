#!/bin/bash

TIMEOUT=2

export AZ=$(curl -s -m ${TIMEOUT} http://169.254.169.254/latest/meta-data/placement/availability-zone)
export SECURITY_GROUP=$(curl -s -m ${TIMEOUT} http://169.254.169.254/latest/meta-data/security-groups)
export INSTANCE_ID=$(curl -s -m ${TIMEOUT} http://169.254.169.254/latest/meta-data/instance-id)
export INSTANCE_TYPE=$(curl -s -m ${TIMEOUT} http://169.254.169.254/latest/meta-data/instance-type)
export INSTANCE_IP=$(curl -s -m ${TIMEOUT} http://169.254.169.254/latest/meta-data/local-ipv4)

# Expand template:
eval "echo \"$(cat /fluentd/etc/fluent.conf)\"" \
	> /tmp/fluent.conf
mv -f /tmp/fluent.conf /fluentd/etc/fluent.conf

# Start service:
fluentd -c /fluentd/etc/fluent.conf

