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
}
