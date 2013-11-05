define trivialaptrepo::repo() {
    $splitrepos = split($title, '/')
    
    $repo = $splitrepos[0]
    $subrepo = $splitrepos[1]
    
    Class['trivialaptrepo::config'] -> Trivialaptrepo::Repo["${title}"]

    file {"${trivialaptrepo::params::reporoot}/${repo}":
        ensure => 'directory'
    } ->
    file {"${trivialaptrepo::params::reporoot}/${repo}/${subrepo}":
        ensure => 'directory'
    }
    
    file {"/etc/incron.d/${repo}${subrepo}":
        ensure => 'present',
        content => template('trivialaptrepo/repowatch.erb')
    }
}
