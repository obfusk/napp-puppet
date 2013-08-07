import '../../../manifests/path.pp'

@package { 'git': ensure => 'installed' }

python::venv { "/home/$id/__TEST__/src/venv":
  bin => "/home/$id/__TEST__/bin/venv",
}
