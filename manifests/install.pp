class aptrepo::install {
    package {['nginx', 'incron', 'gzip', 'dpkg-dev']:
        ensure => latest
    }
}