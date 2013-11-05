define trivialaptrepo::repo() {
    $splitrepos = split($title)
    
    $repo = $splitrepos[0]
    $subrepo = $splitrepos[1]
    
    Class['trivialaptrepo::config'] -> Trivialaptrepo::Repo["${title}"]

    class {'trivialaptrepo::params':} ->
    
    file {"${trivialaptrepo::params::reporoot}/${repo}/${subrepo}":}
    
    file {'/etc/incron.d/${title}':
        ensure => 'present',
        content => template('trivialaptrepo/repowatch.erb')
    }
}
