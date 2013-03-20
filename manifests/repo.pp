define aptrepo::repo() {
    $splitrepos = split($title)
    
    $repo = $splitrepos[0]
    $subrepo = $splitrepos[1]
    
    Class['aptrepo::config'] -> Aptrepo::Repo["${title}"]
    
    file {"${aptrepo::params::reporoot}/${repo}/${subrepo}":}
    
    file {'/etc/incron.d/${title}':
        ensure => 'present',
        content => template('aptrepo/repowatch.erb')
    }
}