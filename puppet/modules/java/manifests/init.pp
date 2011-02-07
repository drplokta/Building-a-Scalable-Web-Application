class java {
    package { sun-java6-jre:
        ensure => installed,
        require => File["/etc/apt/sources.list"],
    }
}