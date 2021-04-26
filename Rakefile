require 'rubocop/rake_task'
require 'rake/testtask'

desc 'lint and run tests'
task default: %w[lint test]

RuboCop::RakeTask.new(:lint) do |task|
  task.patterns = ['lib/**/*.rb', 'test/**/*.rb']
  task.fail_on_error = false
end

Rake::TestTask.new do |t|
  t.libs << 'test'
end

task :run do
  ruby 'lib/game.rb'
end
