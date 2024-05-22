require 'rake/testtask'

desc 'Run tests'
task :test do
  sh 'bundle exec ruby tests/app_test.rb'
end

desc 'Reset database'
task :reset_data do
  sh 'dropdb bookshelf --if-exists'
  sh 'createdb bookshelf'
  sh 'psql -d bookshelf < lib/schema.sql'
  sh 'psql -d bookshelf < lib/mockdata.sql'
end

desc 'Do all tasks'
task default: [:reset_data, :test]