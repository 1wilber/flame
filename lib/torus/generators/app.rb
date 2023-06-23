require "rails/generators"
require "rails/generators/rails/app/app_generator"

module Torus
  module Generators
    class App < Rails::Generators::AppGenerator
      protected

      def get_builder_class
        Torus::AppBuilder
      end
    end
  end
end
