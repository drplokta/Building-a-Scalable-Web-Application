class standard {
	package { ["puppet","git","sudo","screen","vim",
	"unzip"]:
		ensure => installed,
	}
}

