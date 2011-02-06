class php5 {
    package { [
            "php5-cgi", "php-apc", "php-pear", "php5-cli",
            "php5-suhosin", "php5-xdebug", "php5-pgsql",
	]:
        ensure => installed,
    }
    
    package { php5-mongo:
        provider => dpkg,
        ensure => latest,
        source => "${rootdir}/puppet/modules/php5/files/php5-mongo_1.1.3-1_amd64.deb",
        require => Package["php5-cgi"],
    }
}
