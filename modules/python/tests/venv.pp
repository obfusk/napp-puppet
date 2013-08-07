import '../../../manifests/path.pp'

python::venv { "/home/$id/__TEST__/src/venv":
  bin => "/home/$id/__TEST__/bin/venv",
}
