class spawn-fcgi {
    package { spawn-fcgi:
        ensure => installed,
    }
    
    package { php-fastcgi:
        provider => dpkg,
        ensure => latest,
        source => "puppet:///modules/files/php-fastcgi_0.1-1_all.deb",
        require => Package["spawn-fcgi","php5-cgi"],
    }
}
