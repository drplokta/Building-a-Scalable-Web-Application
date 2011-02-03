class apt {
    #Set sources for apt
    file { "/etc/apt/sources.list":
        source => "puppet:///modules/apt/sources.list",
        owner => root,
        group => root,
    }
}

