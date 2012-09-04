#!/usr/bin/env rake
require "bundler/gem_tasks"

desc "Push Style Guide"
task :push_it do
  abort "This feature has been disbaled for now."
end

#
# Start server
#

desc "Start Styleguide Server \[port 3001\]"
task :start do
  puts ''
  puts ''
  puts '=============================='
  puts '   STARTING THE STYLEGUIDE'
  puts '=============================='
  puts ''
 system 'bundle exec rails s -p 3001'
end


begin
  require 'jasmine'
  load 'jasmine/tasks/jasmine.rake'
rescue LoadError
  task :jasmine do
    abort "Jasmine is not available. In order to run jasmine, you must: (sudo) gem install jasmine"
  end
end
