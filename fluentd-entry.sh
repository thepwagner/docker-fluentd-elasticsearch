#!/bin/bash

# Expand template:
eval "echo \"$(cat /fluentd/etc/fluent.conf)\"" \
	> /tmp/fluent.conf
mv -f /tmp/fluent.conf /fluentd/etc/fluent.conf

# Start service:
fluentd -c /fluentd/etc/fluent.conf

