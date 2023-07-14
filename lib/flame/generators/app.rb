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
        rails_command("db:migrate") if yes?("\nDo you want to run migrations? [y/n]")
        rails_command("db:seed") if yes?("\nDo you want to run seed? [y/n]")
        welcome_message

        exit 0
      end

      protected

      def welcome_message
        say "Flame app successfully created!", :green
        say "Run `foreman start -f Procfile.dev` to start the server", :green
      end

      def get_builder_class
        Flame::AppBuilder
      end
    end
  end
end
