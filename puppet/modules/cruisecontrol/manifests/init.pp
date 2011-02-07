class cruisecontrol {
    exec { "unzip $rootdir/puppet/modules/cruisecontrol/files/cruisecontrol-bin-2.8.4.zip":
        cwd     => "/opt",
        creates => "/opt/cruisecontrol-bin-2.8.4",
        path    => ["/usr/bin"],
        require => Package["unzip"],
    }
}