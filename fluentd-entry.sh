#!/bin/bash

# Expand template:
eval "echo \"$(cat /fluentd/etc/fluent.conf)\"" \
	> /tmp/fluent.conf


cat /tmp/fluent.conf
#fluentd -c /fluentd/etc/fluentd.conf

