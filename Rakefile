unless File.directory?("vendor/rails") && File.directory?("vendor/arel")
  raise <<-MESSAGE
You need to clone the rails and arel git repositories into ./vendor
before you can use any of the rake tasks.

    git clone git://github.com/rails/arel.git  vendor/arel
    git clone git://github.com/rails/rails.git vendor/rails

MESSAGE
end
require "bundler"
Bundler.setup
Bundler::GemHelper.install_tasks

require 'rake'
require 'yaml'

require 'rake/rdoctask'
require 'rspec'
require 'rspec/core/rake_task'
require 'cucumber/rake/task'

RSpec::Core::RakeTask.new(:spec)
class Cucumber::Rake::Task::ForkedCucumberRunner
  # When cucumber shells out, we still need it to run in the context of our
  # bundle.
  def run
    sh "bundle exec #{RUBY} " + args.join(" ")
  end
end
Cucumber::Rake::Task.new(:cucumber)

namespace :generate do
  desc "generate a fresh app with rspec installed"
  task :app do |t|
    unless File.directory?('./tmp/example_app')
      sh "bundle exec rails new ./tmp/example_app"
      sh "cp ./templates/Gemfile ./tmp/example_app/"
      sh "cp ./specs.watchr ./tmp/example_app/"
    end
  end

  desc "generate a bunch of stuff with generators"
  task :stuff do
    Dir.chdir("./tmp/example_app/") do
      sh "rake rails:template LOCATION='../../templates/generate_stuff.rb'"
    end
  end
end

namespace :db do
  task :migrate do
    Dir.chdir("./tmp/example_app/") do
      sh "rake db:migrate"
    end
  end

  namespace :test do
    task :prepare do
      Dir.chdir("./tmp/example_app/") do
        sh "rake db:test:prepare"
      end
    end
  end
end

desc "run a variety of specs against the generated app"
task :smoke do
  Dir.chdir("./tmp/example_app/") do
    sh "rake rails:template LOCATION='../../templates/run_specs.rb'"
  end
end

desc 'clobber generated files'
task :clobber do
  rm_rf "pkg"
  rm_rf "tmp"
  rm    "Gemfile.lock" if File.exist?("Gemfile.lock")
end

namespace :clobber do
  desc "clobber the generated app"
  task :app do
    rm_rf "tmp/example_app"
  end
end

task :default => [:spec, "clobber:app", "generate:app", "generate:stuff", :cucumber, :smoke]

