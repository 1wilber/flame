require "rails/generators"
require "rails/generators/rails/app/app_generator"

module Torus
  module Generators
    class App < Rails::Generators::AppGenerator
      def finish_template
        invoke :custom_template
        super
      end

      def custom_template
        invoke :setup_config
      end

      def setup_config
        build :configure_generators
      end

      def generate_default
        run("spring stop > /dev/null 2>&1 || true")
        generate("rspec:install")
        generate("annotate:install")
        generate("responders:install")
        run("bundle exec vite install")
      end

      protected

      def get_builder_class
        Torus::AppBuilder
      end
    end
  end
end
