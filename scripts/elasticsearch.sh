#!/usr/bin/env bash

rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch

if [[ ! -f "/etc/yum.repos.d/elasticsearch.repo" ]]; then
    touch /etc/yum.repos.d/elasticsearch.repo

    echo "[elasticsearch-7.x]
name=Elasticsearch repository for 7.x packages
baseurl=https://artifacts.elastic.co/packages/7.x/yum
gpgcheck=1
gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
enabled=1
autorefresh=1
type=rpm-md" >> /etc/yum.repos.d/elasticsearch.repo

fi

yum -y install elasticsearch
