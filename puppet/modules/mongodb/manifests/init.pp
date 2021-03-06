class mongodb {
    package { "mongodb-stable":
        ensure  => installed,
		require => File["/etc/apt/sources.list.d/mongodb.list"],		
    }
    
    file { "/etc/ufw/applications.d/mongodb-server":
        source  => "puppet:///modules/ufw/mongodb-server",
		require => Package["ufw"],
        owner   => "root",
        group   => "root",
    }

    exec { "allow-mongodb-server":
        command => "/usr/sbin/ufw allow \"MongoDB Server\"",
        unless  => "/usr/sbin/ufw status | grep \"MongoDB Server.*ALLOW.*Anywhere\\|Status: inactive\"",
        require => [Exec["enable-firewall"], File["/etc/ufw/applications.d/mongodb-server"]],
    }

	file { "/etc/apt/sources.list.d/mongodb.list":
    	source  => "puppet:///modules/mongodb/mongodb.list",
        owner   => "root",
        group   => "root",
		notify  => Exec["apt-get update"], 
	}
}

class mongodb::dev {
    file { "/etc/ufw/applications.d/mongodb-stats":
        source  => "puppet:///modules/ufw/mongodb-stats",
		require => Package["ufw"],
        owner   => "root",
        group   => "root",
    }

    exec { "allow-mongodb-stats":
        command => "/usr/sbin/ufw allow \"MongoDB Stats\"",
        unless  => "/usr/sbin/ufw status | grep \"MongoDB Stats.*ALLOW.*Anywhere\\|Status: inactive\"",
        require => [Exec["enable-firewall"], File["/etc/ufw/applications.d/mongodb-stats"]],
    }
}