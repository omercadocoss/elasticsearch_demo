#!/usr/bin/env bash

yum -y install kibana
service kibana start
chkconfig --add kibana
service kibana start
