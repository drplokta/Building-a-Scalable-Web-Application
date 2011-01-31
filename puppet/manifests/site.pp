import "classes.pp"

# disable IPV6
file {	"/etc/default/grub":
	source => "/root/Building-a-Scalable-Web-Application/puppet/files/grub",
	owner => root,
	group => adm,
}

exec {	"/usr/sbin/update-grub":
	subscribe => File["/etc/default/grub"],
	refreshonly => true,
}

#Fix sshd config
file { "/etc/ssh/sshd_config":
	source => "/root/Building-a-Scalable-Web-Application/puppet/files/sshd_config",
	owner => root,
	group => root,
}

service { "ssh":
	enable => true,
	ensure => running,
	subscribe => File["/etc/ssh/sshd_config"],
}

#set authorized_keys for mikes
file { "/home/mikes/.ssh/authorized_keys":
	source => "/root/Building-a-Scalable-Web-Application/puppet/files/mikes/authorized_keys",
	owner => mikes,
	group => mikes,
}

#Set default editor
exec { "update-alternatives --set editor /usr/bin/vim.basic":
	path => "/bin:/sbin:/usr/bin:/usr/sbin",
	unless => "test /etc/alternatives/editor -ef /usr/bin/vim.basic",
}

#Set sources for apt
file 	{ "/etc/apt/sources.list":
	source => "/root/Building-a-Scalable-Web-Application/puppet/files/sources.list",
	owner => root,
	group => root,
}

#Apply changes every five minutes
file 	{ "/root/puppet-update.sh":
	source => "/root/Building-a-Scalable-Web-Application/puppet/files/puppet-update.sh",
	owner => root,
	group => root,
	mode => 755,
}

cron { puppet-apply:
	command => "/root/puppet-update.sh",
	user => root,
	minute => [0,5,10,15,20,25,30,35,40,45,50,55],
}

#Define nodes
node 	"dev1.localdomain" {
	include standard
}

