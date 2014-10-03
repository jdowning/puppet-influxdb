require 'bundler'
Bundler.require(:rake)

require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-lint/tasks/puppet-lint'
require 'puppet_blacksmith/rake_tasks'

Rake::Task[:lint].clear
PuppetLint::RakeTask.new :lint do |config|
  config.ignore_paths = ["pkg/**/**/*.pp"]
  config.log_format = '%{path}:%{linenumber}:%{KIND}: %{message}'
  config.disable_checks = [ "80chars" ]
end

task :default => [:spec, :lint]

