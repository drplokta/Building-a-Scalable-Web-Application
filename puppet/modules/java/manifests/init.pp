class java {
    package { sun-java6-jre:
        ensure => installed,
        require => [File["/etc/apt/sources.list"],File["/var/cache/debconf/jre6.seeds"]],
        responsefile => "/var/cache/debconf/jre6.seeds",
    }
    
    file { "/var/cache/debconf/jre5.seeds":
        source => "puppet:///modules/java/jre6.seeds",
        ensure => present,
    }
}