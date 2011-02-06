class mongodb {
    package { mongodb-stable:
        ensure => installed,
        require => Apt::Key["7F0CEB10"],
    }
}