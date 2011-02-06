class beanstalkd {
    package { beanstalkd:
        ensure => installed,
    }
    
    file { "/etc/default/beanstalkd":
        source => "puppet:///modules/beanstalkd/beanstalkd",
        owner => root,
        group => root,
    }
    
    file { "/etc/ufw/applications.d/beanstalkd":
        source => "puppet:///modules/ufw/beanstalkd",
        owner => root,
        group => root,
    }

    exec { "allow-beanstalkd":
        command => "/usr/sbin/ufw allow beanstalkd",
        unless => "/usr/sbin/ufw status | grep \"beanstalkd.*ALLOW.*Anywhere\\|Status: inactive\"",
        require => Exec["enable-firewall"],
    }
    
    service { beanstalkd:
        ensure => running,
        subscribe => File["/etc/default/beanstalkd"],
        hasstatus => true,
        hasrestart => true,
    }
}