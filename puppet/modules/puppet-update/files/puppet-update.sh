#!/bin/bash
cd /root/Building-a-Scalable-Web-Application
/usr/bin/git pull origin master
/usr/bin/puppet apply --confdir=/home/mikes/Building-a-Scalable-Web-Application/puppet /home/mikes/Building-a-Scalable-Web-Application/puppet/manifests/site.pp

