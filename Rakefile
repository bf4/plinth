#!/usr/bin/env rake
require "bundler/gem_tasks"

desc "Push Style Guide"
task :push_it do
  sh "bundle exec middleman build"
  sh "mv build /tmp/"
  sh "git checkout gh-pages"
  sh "git rm -rf ."
  sh "cp -r /tmp/build/* ."
  sh "git add ."
  sh "git commit -am 'Pushing Style Guide on #{Time.new.strftime("%d-%m-%Y")}'"
  sh "rm -rf /tmp/build"
  sh "git push"
  sh "git checkout develop"
end
