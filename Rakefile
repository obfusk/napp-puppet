desc 'Apply'
task :apply do
  mp = "#{ Dir.pwd }/modules"
  sp = "#{ Dir.pwd }/scripts"
  ENV['FACTER_pp_scripts_path'] = sp
  sh "puppet apply --modulepath #{mp} -v manifests/site.pp"
end
