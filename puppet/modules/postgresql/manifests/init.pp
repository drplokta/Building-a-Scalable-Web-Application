class postgresql {
    package { ["postgresql-8.4", "postgresql-client"]:
        ensure => installed,
    }
    
    file { "/etc/ufw/applications.d/postgresql-server":
        source => "puppet:///modules/ufw/postgresql-server",
        owner => root,
        group => root,
        notify => Service["ufw"],
    }

    exec { "allow-postgreql":
        command => "/usr/sbin/ufw allow PostgreSQL",
        unless => "/usr/sbin/ufw status | grep \"PostgreSQL.*ALLOW.*Anywhere\\|Status: inactive\"",
        require => Exec["enable-firewall"],
    }
    
}