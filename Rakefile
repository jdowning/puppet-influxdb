require 'bundler'
Bundler.require(:rake)

require 'rubygems'
require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-lint/tasks/puppet-lint'

Rake::Task[:lint].clear
PuppetLint::RakeTask.new :lint do |config|
  config.ignore_paths = ["modules/**/**/*.pp","pkg/**/**/*.pp"]
  config.log_format = '%{path}:%{linenumber}:%{KIND}: %{message}'
  config.disable_checks = [ "80chars", 'autoloader_layout', 'class_inherits_from_params_class']
end

task :default => [:spec, :lint]
