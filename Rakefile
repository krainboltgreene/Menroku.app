# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require "motion/project/template/osx"
require "rspec/core/rake_task"
require "menroku"


begin
  require "bundler"
  Bundler.require
rescue LoadError
end

Rake::Task["spec"].clear
desc "Run all the tests in spec"
RSpec::Core::RakeTask.new(:spec)

Motion::Project::App.setup do |app|
  app.name = "Menroku"
  app.info_plist["LSUIElement"] = true
  app.icon = "Icon.png"
  app.version = Menroku::VERSION
  app.short_version = app.version.split(".").first
end

MotionBundler.setup
