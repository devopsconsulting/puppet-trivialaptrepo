class trivialaptrepo::install {
    if (!defined(Package['nginx'])) {
        package {'nginx':
            ensure => latest
        }
    }
    package {['incron', 'gzip', 'dpkg-dev']:
        ensure => latest
    }
}