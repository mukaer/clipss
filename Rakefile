# rspec
require 'rspec/core/rake_task'
desc 'spec test'
RSpec::Core::RakeTask.new(:spec)

# rubocop
# https://github.com/bbatsov/rubocop
require 'rubocop/rake_task'
desc 'rubocop'
Rubocop::RakeTask.new(:rubocop) do |task|
  task.patterns = ['**/*.rb', 'Gemfile', 'Rakefile']
  task.fail_on_error = false
end

# task default: :spec
task default: [:rubocop, :spec]
