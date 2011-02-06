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
}