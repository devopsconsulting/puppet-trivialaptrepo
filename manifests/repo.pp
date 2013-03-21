define trivialaptrepo::repo() {
    $splitrepos = split($title)
    
    $repo = $splitrepos[0]
    $subrepo = $splitrepos[1]
    
    Class['trivialaptrepo::config'] -> Trivialaptrepo::Repo["${title}"]
    
    file {"${trivialaptrepo::params::reporoot}/${repo}/${subrepo}":}
    
    file {'/etc/incron.d/${title}':
        ensure => 'present',
        content => template('trivialaptrepo/repowatch.erb')
    }
}