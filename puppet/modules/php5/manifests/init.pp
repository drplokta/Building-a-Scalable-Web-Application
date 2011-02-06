class php5 {
    package { [
            "php5-cgi", "php-apc", "php-pear", "php5-cli",
            "php5-suhosin", "php5-xdebug", 
	]:
        ensure => installed,
    }
}
