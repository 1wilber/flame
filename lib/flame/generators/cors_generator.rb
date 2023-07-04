require_relative "base"

module Flame
  class CorsGenerator < Generators::Base
    CONFIG = <<~RUBY
      Rails.application.config.middleware.insert_before 0, Rack::Cors do
        allow do
          origins "localhost:5100", "127.0.0.1:5100" # Change this to your client URL.
          resource "*",
            headers: %w[Authorization],
            methods: :any,
            expose: %w[Authorization],
            max_age: 600,
            credentials: true
        end
      end
    RUBY

    def create_cors_file
      create_file("config/initializers/cors.rb", CONFIG)
    end

    def install_gem
      gem "rack-cors"
    end
  end
end
