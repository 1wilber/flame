require "rails/generators"
require "rails/generators/rails/app/app_generator"

module Flame
  module Generators
    class App < Rails::Generators::AppGenerator
      hide!
      def finish_template
        invoke :custom_template
        invoke :generators
        super
      end

      def custom_template
        build :configure_generators
      end

      def generators
        run("spring stop > /dev/null 2>&1 || true")
        run("bundle install")
        invoke "flame:haml"
        rails_command "db:create"

        invoke "flame:testing"
        invoke "flame:cors"
        invoke "flame:devise"
        invoke "flame:vite"

        generate("annotate:install")
        run("bundle exec standardrb --fix-unsafely")
        run("bundle exec haml-lint app/views -A -a")
        welcome_message

        exit 0
      end

      protected

      def welcome_message
        say "Flame app successfully created!", :green
        say "Run `foreman start -f Procfile.dev` to start the server", :green
        say "please run in rails console the default credentials", :green
        say "\tUser.create(email: 'admin@example.com', password: 'admin123', password_confirmation: 'admin123')"
      end

      def get_builder_class
        Flame::AppBuilder
      end
    end
  end
end
