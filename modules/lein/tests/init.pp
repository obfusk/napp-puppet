import '../../../manifests/path.pp'

@package { 'curl': ensure => 'installed' }

lein { "/home/$id/__TEST__/bin/lein": }
