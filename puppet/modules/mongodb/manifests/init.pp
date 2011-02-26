class mongodb {
    package { "mongodb-stable":
        ensure  => installed,
		require => File["/etc/sources.list.d/apt.mongodb"],		
    }
    
    file { "/etc/ufw/applications.d/mongodb-server":
        source => "puppet:///modules/ufw/mongodb-server",
        owner  => "root",
        group  => "root",
        notify => Service["ufw"],
    }

    exec { "allow-mongodb-server":
        command => "/usr/sbin/ufw allow \"MongoDB Server\"",
        unless  => "/usr/sbin/ufw status | grep \"MongoDB Server.*ALLOW.*Anywhere\\|Status: inactive\"",
        require => [Exec["enable-firewall"], File["/etc/ufw/applications.d/mongodb-server"]],
    }

	file { "/etc/sources.list.d/apt.mongodb":
	    source => "puppet:///modules/mongodb/files/apt.mongodb",
	}
}

class mongodb::dev {
    file { "/etc/ufw/applications.d/mongodb-stats":
        source => "puppet:///modules/ufw/mongodb-stats",
        owner  => "root",
        group  => "root",
        notify => Service["ufw"],
    }

    exec { "allow-mongodb-stats":
        command => "/usr/sbin/ufw allow \"MongoDB Stats\"",
        unless  => "/usr/sbin/ufw status | grep \"MongoDB Stats.*ALLOW.*Anywhere\\|Status: inactive\"",
        require => [Exec["enable-firewall"], File["/etc/ufw/applications.d/mongodb-stats"]],
    }
}