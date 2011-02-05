class php5 {
    package { [
            "php5-cgi", "php-apc", "php-pear", "php5-cli",
            "php5-dev", "php5-suhosin", "php5-xdebug", 
            "php5-mysql", "php5-common", "libonig2",
            "libqdbm14", "libmysqlclient16", "phpapi-20090626"]:
        ensure => installed,
    }
}