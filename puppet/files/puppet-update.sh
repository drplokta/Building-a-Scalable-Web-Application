#!/bin/bash
/usr/bin/git --git-dir=/root/Building-a-Scalable-Web-Application/.git pull origin master
/usr/bin/puppet apply /root/Building-a-Scalable-Web-Application/puppet/manifests/site.pp
