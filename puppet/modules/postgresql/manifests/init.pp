class postgresql {
    package { ["postgresql-9.0", "postgresql-client-9.0"]:
        ensure => installed,
    }
    
    file { "/etc/ufw/applications.d/postgresql-server":
        source => "puppet:///modules/ufw/postgresql-server",
        owner  => "root",
        group  => "root",
        notify => Service["ufw"],
    }

    exec { "allow-postgresql":
        command => "/usr/sbin/ufw allow PostgreSQL",
        unless  => "/usr/sbin/ufw status | grep \"PostgreSQL.*ALLOW.*Anywhere\\|Status: inactive\"",
        require => [Exec["enable-firewall"], File["/etc/ufw/applications.d/postgresql-server"]],
    }
    
}