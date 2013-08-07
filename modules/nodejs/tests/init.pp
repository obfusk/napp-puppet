import '../../../manifests/path.pp'

package { 'curl': ensure => 'installed' }

nodejs { "/home/$id/__TEST__/pkg/node":
  bin => "/home/$id/__TEST__/bin/node",
  npm => "/home/$id/__TEST__/bin/npm",
}
