import "classes.pp"

# disable IPV6
file {	"/etc/default/grub":
	source => "puppet:///files/grub",
	owner => root,
	group => root,
}

exec {	"/usr/sbin/update-grub":
	subscribe => File["/etc/default/grub"],
	refreshonly => true,
}

#Fix sshd config
file { "/etc/ssh/sshd_config":
	source => "puppet:///files/sshd_config",
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
	source => "puppet:///files/mikes/authorized_keys",
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
	source => "puppet:///files/sources.list:,
	owner => root,
	group => root,
}

#Define nodes
node 	{ "dev1.localdomain":
	include standard
}

