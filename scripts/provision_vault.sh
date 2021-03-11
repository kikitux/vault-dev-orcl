#!/usr/bin/env bash

cp /vagrant/sw/hosts /etc/hosts
echo 'vault.test' > /etc/hostname
hostname vault.test
