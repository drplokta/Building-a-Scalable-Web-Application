class ssh {
    package { openssh-server:
        ensure => installed
    }

    #Fix sshd config
    file { "/etc/ssh/sshd_config":
        source => "puppet:///modules/ssh/sshd_config",
        owner => root,
        group => root,
    }

    service { "ssh":
        enable => true,
        ensure => running,
        subscribe => File["/etc/ssh/sshd_config"],
    }
}

