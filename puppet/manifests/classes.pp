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
}

