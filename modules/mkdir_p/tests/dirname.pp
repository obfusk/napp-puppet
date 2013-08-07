import '../../../manifests/path.pp'

mkdir_p::dirname { "/home/$id/__TEST__/other/dir/file": }
