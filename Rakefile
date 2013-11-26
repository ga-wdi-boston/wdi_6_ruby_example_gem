# Gives me a few helper tasks: 

# `rake build` 
# is 
# gem build ga-example-gem.gemspec

# `rake release`
# is
# gem push ga-example-gem-0.0.3.gem

require 'bundler'
Bundler::GemHelper.install_tasks

# Pulls in equiv of 'rspec spec' to be 'rake spec'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

# If you just run 'rake', it will run 'rake spec'
task test: :spec
task default: :spec