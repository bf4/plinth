#!/usr/bin/env rake
require "bundler/gem_tasks"

desc "Push Plinth"
task :push_it do
  abort "This feature has been disbaled for now."
end

#
# Start server
#

desc "Start Plinth Server \[port 3001\]"
task :start do
  puts ''
  puts ''
  puts '=============================='
  puts '   STARTING PLINTH'
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

require File.expand_path('../config/application', __FILE__)
Plinth::Application.load_tasks
