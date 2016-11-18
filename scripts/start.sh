#!/bin/sh

exec distccd --no-detach --log-stderr --daemon --allow "$ALLOW" "$DISTCCD_OPTS"
