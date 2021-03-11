#!/usr/bin/env bash

(echo "password"; echo "password";) | /etc/init.d/oracle-xe-18c configure
usermod -a -G vagrant oracle

