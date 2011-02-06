class postgresql {
    package { ["postgresql-8.4", "postgresql-client"]:
        ensure => installed,
    }
}