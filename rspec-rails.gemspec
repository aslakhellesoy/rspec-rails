# -*- encoding: utf-8 -*-
require "rspec/rails/version"
require "rspec/core/version"

Gem::Specification.new do |s|
  s.name        = "rspec-rails"
  s.version     = RSpec::Rails::Version::STRING
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["David Chelimsky", "Chad Humphries"]
  s.email       = "dchelimsky@gmail.com;chad.humphries@gmail.com"
  s.homepage    = "http://github.com/rspec/rspec-rails"
  s.summary     = "rspec-rails-#{RSpec::Rails::Version::STRING}"
  s.description = "RSpec-2 for Rails-3"

  s.rubygems_version   = "1.3.7"
  s.rubyforge_project  = "rspec"

  s.files            = `git ls-files`.split("\n")
  s.test_files       = `git ls-files -- {spec,features}/*`.split("\n")
  s.executables      = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.extra_rdoc_files = [ "README.markdown" ]
  s.rdoc_options     = ["--charset=UTF-8"]
  s.require_path     = "lib"

  s.post_install_message = %Q{**************************************************

  Thank you for installing #{s.summary}!

  This version of rspec-rails only works with versions of rails >= 3.0.0.beta.4.

  To configure your app to use rspec-rails, add a declaration to your Gemfile.
  If you are using Bundler's grouping feature in your Gemfile, be sure to include
  rspec-rails in the :development group as well as the :test group so that you
  can access its generators and rake tasks.

    group :development, :test do
      gem "rspec-rails", ">= #{RSpec::Rails::Version::STRING}"
    end

  Be sure to run the following command in each of your Rails apps if you're
  upgrading:

    script/rails generate rspec:install

  Even if you've run it before, this ensures that you have the latest updates
  to spec/spec_helper.rb and any other support files.

  Previous versions of rspec-rails-2.0.0.beta installed files that are no
  longer being used, so please remove these files if you have them:

    lib/tasks/rspec.rake
    config/initializers/rspec_generator.rb

  Lastly, be sure to look at Upgrade.markdown to see what might have changed
  since the last release.

**************************************************
}

  s.add_runtime_dependency "rspec", RSpec::Core::Version::STRING

  s.add_development_dependency "rake",               ">= 0.8.7"
  s.add_development_dependency "cucumber",           ">= 0.9.1"
  s.add_development_dependency "aruba",              ">= 0.2.3"
  s.add_development_dependency "webrat",             ">= 0.7.2.beta.1"
  s.add_development_dependency "sqlite3-ruby",       ">= 1.3.1"
  s.add_development_dependency "autotest",           ">= 4.4.1"
end

