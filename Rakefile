mp = "#{ Dir.pwd }/modules"
sp = "#{ Dir.pwd }/scripts"

ENV['FACTER_pp_scripts_path'] = sp
args = "--modulepath #{mp} -v"

desc 'Apply'
task :apply do
  sh "puppet apply #{args} manifests/site.pp"
end

desc 'Apply file'
task 'apply:file' do
  sh "puppet apply #{args} #{ENV['FILE']}"
end

desc 'Noop'
task :noop do
  sh "puppet apply --noop #{args} manifests/site.pp"
end

desc 'Noop file'
task 'noop:file' do
  sh "puppet apply --noop #{args} #{ENV['FILE']}"
end

desc 'Check'
task :check do
  sh "find -name '*.pp' | xargs -n 1 -t puppet parser validate"
end

desc 'Sync'
task :sync do
  to = '~/tmp/vagrant/puppet/shared/napp-puppet'
  sh "rsync -av --progress ./ #{to}/"
end
