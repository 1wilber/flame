module Flame
  class AppBuilder < Rails::AppBuilder
    def gemfile
      template "Gemfile.erb", "Gemfile"
    end

    def configure_generators
      config = <<-RUBY
    config.generators do |generate|
      generate.helper false
      generate.javascripts false
      generate.controller_specs false
      generate.request_specs true
      generate.routing_specs false
      generate.stylesheets false
      generate.test_framework :rspec
      generate.view_specs false
      generate.template_engine :haml
    end

      RUBY

      inject_into_class "config/application.rb", "Application", config
    end
  end
end
