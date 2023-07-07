require "rails/generators"
require "rails/generators/base"

module Flame
  module Generators
    class Base < Rails::Generators::Base
      source_root File.expand_path("../../../templates", __dir__)

      private

      # @param [Array] packages
      # @return [void]
      # @example
      #  yarn_install(["vite", "react", "react-dom"])
      def yarn_install(packages)
        run("yarn add #{packages.join(" ")} --silent")
      end

      # @param [Array] packages
      # @return [void]
      # @example
      # yarn_install_dev(["vite", "react", "react-dom"])
      def yarn_install_dev(packages)
        run("yarn add -D #{packages.join(" ")} --silent")
      end
    end
  end
end
