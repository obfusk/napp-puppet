import '../../../manifests/path.pp'

nodejs { "/home/$id/__TEST__/pkg/node":
  bin => "/home/$id/__TEST__/bin/node",
  npm => "/home/$id/__TEST__/bin/npm",
}
