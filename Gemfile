source :rubygems

gems = %w[rspec-core rspec-expectations rspec-mocks rspec-rails rspec]
gems.each do |g|
  $LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__) + "/../#{g}/lib")
end
gemspec
gems.each do |g|
  @dependencies.reject!{|dep| dep.name == g}
  gem g, :path => "../#{g}"
end

unless RUBY_PLATFORM == "java"
  case RUBY_VERSION
  when /^1.9.2/
    gem "ruby-debug19"
  when /^1.8/
    gem "ruby-debug"
    gem "rcov"
  end
end

gem 'arel', :path => "./vendor/arel"
gem 'rails', :path => "./vendor/rails"
