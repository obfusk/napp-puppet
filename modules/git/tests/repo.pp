import '../../../manifests/path.pp'

@package { 'git': ensure => 'installed' }

git::repo { "/home/$id/__TEST__/napp-puppet-1":
  source  => 'https://github.com/obfusk/napp-puppet.git',
  branch  => 'dev',
}

git::repo { "/home/$id/__TEST__/napp-puppet-2":
  source  => 'https://github.com/obfusk/napp-puppet.git',
  branch  => 'dev',
  pull    => true,
}

git::repo { "/home/$id/__TEST__/napp-puppet-3":
  source    => 'https://github.com/obfusk/napp-puppet.git',
  checkout  => ['foo', '5321cbf'],
}
