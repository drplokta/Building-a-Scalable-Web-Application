class postgresql {
    package { netatalk:
        ensure => installed,
    }
    
    file { "/etc/ufw/applications.d/postgresql-server":
        source => "puppet:///modules/ufw/netatalk",
        owner  => "root",
        group  => "root",
        notify => Service["ufw"],
    }

    exec { "allow-netatalk":
        command => "/usr/sbin/ufw allow netatalk",
        unless  => "/usr/sbin/ufw status | grep \"netatalk.*ALLOW.*Anywhere\\|Status: inactive\"",
        require => [Exec["enable-firewall"], File["/etc/ufw/applications.d/netatalk"]],
    }
    
}