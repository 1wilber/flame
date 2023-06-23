require "rails/generators"
require "rails/generators/rails/app/app_generator"

module Torus
  module Generators
    class App < Rails::Generators::AppGenerator
      def finish_template
        invoke :torus_custom
        super
      end

      def torus_custom
        invoke :setup_config
      end

      def setup_config
        build :configure_generators
      end

      protected

      def get_builder_class
        Torus::AppBuilder
      end
    end
  end
end
