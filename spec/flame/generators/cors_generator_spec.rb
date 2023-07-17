require "bundler/setup"
require "generator_spec"

Bundler.require(:default, :test)

describe Flame::CorsGenerator, type: :generator do
  destination File.expand_path("../../../tmp", __FILE__)

  before(:all) do
    prepare_destination
    run_generator
  end

  it "creates a cors.rb initializer" do
    assert_file "config/initializers/cors.rb"
  end

  it "creates a cors.rb initializer with the correct content" do
    assert_file "config/initializers/cors.rb", <<~RUBY
      Rails.application.config.middleware.insert_before 0, Rack::Cors do
        allow do
          origins Rails.env.development? ? ["localhost:5100", "127.0.0.1:5100"] : ENV["FRONTEND_URL"]
          resource "*",
            headers: %w[Authorization],
            methods: :any,
            expose: %w[Authorization],
            max_age: 600,
            credentials: true
        end
      end
    RUBY
  end
end
