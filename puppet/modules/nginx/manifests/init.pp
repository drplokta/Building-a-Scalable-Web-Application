class nginx {
    package { nginx:
        ensure => installed,
    }

    file { "/etc/nginx/sites-available/default":
        source => "puppet:///modules/nginx/default",
        owner => root,
        group => root,
    }

    service { nginx:
        ensure => running,
        hasrestart => true,
        hasstatus => true,
        subscribe => File["/etc/nginx/sites-available/default"],
    }
    
    file { "/etc/ufw/applications.d/nginx-server":
        source => "puppet:///modules/ufw/nginx-server",
        owner => root,
        group => root,
    }

    exec { "allow-http":
        command => "/usr/sbin/ufw allow Apache Full",
        unless => "/usr/sbin/ufw status | grep \"Apache\\ Full.*ALLOW.*Anywhere\\|Status: inactive\"",
        require => Exec["enable-firewall"],
    }
}
