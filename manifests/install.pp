class trivialaptrepo::install {
    package {['nginx', 'incron', 'gzip', 'dpkg-dev']:
        ensure => latest
    }
}