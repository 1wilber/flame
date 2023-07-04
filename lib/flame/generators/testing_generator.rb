require_relative "base"

module Flame
  class TestingGenerator < Generators::Base
    def install_rspec
      generate("rspec:install")
    end

    def install_gems
      gem_group :development, :test do
        gem "byebug", platforms: %i[mri mingw x64_mingw]
        gem "factory_bot_rails", "~> 6.2"
        gem "ffaker", "~> 2.21"
        gem "rspec-rails", "~> 6.0.0"
        gem "shoulda-matchers", "~> 5.0"
      end

      gem_group :test do
        gem "database_cleaner-active_record", "2.1"
      end
    end
  end
end
