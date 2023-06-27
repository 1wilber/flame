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
        build :configure_generators
      end

      def generate_default
        run("spring stop > /dev/null 2>&1 || true")
        generate("rspec:install")
        generate("annotate:install")
        generate("responders:install")
        run("bundle exec vite install")
      end

      def install_devise
        generate("devise:install")
        generate("devise", "User")
      end

      def install_devise_jwt
        generate("migration", "JwtDenylist", "jit:string:index")
        gsub_file(
          "app/models/user.rb",
          /^\s*devise\s*:[a-z_]+(?:,\s*:[a-z_]+)*\s*$/,
          "  devise :database_authenticatable, :registerable, :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist"
        )
      end

      protected

      def get_builder_class
        Torus::AppBuilder
      end
    end
  end
end
