#!/bin/bash
cd /root/Building-a-Scalable-Web-Application
/usr/bin/git pull origin master
/usr/bin/puppet apply --confdir=/root/Building-a-Scalable-Web-Application/puppet /root/Building-a-Scalable-Web-Application/puppet/manifests/site.pp

