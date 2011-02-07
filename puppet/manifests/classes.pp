class standard {
	include packages
    include grub
    include ssh
    include apt
	include puppet-update
	include users
	include users::people
	include users::admin
	include vim
    include exim4
    include ufw
    include git
    
    # Add mongodb.org apt key
    apt::key { "7F0CEB10":
        keyid => 7F0CEB10,
        ensure => present,
    }
}

class webserver {
    include nginx
    include spawn-fcgi
    include php5
    include beanstalkd
    include memcached
}

class mongodbserver {
    include mongodb
}

class postgresqlserver {
    include postgresql
}

class dev {
    include puppet-dev
    include php5-dev
    include mongodb::dev
}

class integrationserver {
    include cruisecontrol
    include java
}