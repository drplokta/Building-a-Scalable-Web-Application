class postgresql {
    package { ["postgresql-9.0", "postgresql-client-9.0"]:
        ensure  => installed,
		require => File["/etc/apt-preferences.d/apt.postrgresql"],
    }
    
    file { "/etc/ufw/applications.d/postgresql-server":
        source => "puppet:///modules/ufw/postgresql-server",
        notify => Service["ufw"],
    }

    file { "/etc/apt-preferences.d/apt.postrgresql":
        source => "puppet:///modules/postgresql/apt.postgresql",
    }

    exec { "allow-postgresql":
        command => "/usr/sbin/ufw allow PostgreSQL",
        unless  => "/usr/sbin/ufw status | grep \"PostgreSQL.*ALLOW.*Anywhere\\|Status: inactive\"",
        require => [Exec["enable-firewall"], File["/etc/ufw/applications.d/postgresql-server"]],
    }
    
}