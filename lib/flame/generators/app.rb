require "rails/generators"
require "rails/generators/rails/app/app_generator"
require "byebug"

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
        invoke "flame:truco"
        exit 0
      end

      def setup_db
        run("bundle exec rails db:setup")
      end

      def install_vite
        run("bundle exec vite install")
      end

      def install_annotate
        generate("annotate:install")
      end

      # def install_responders
      #   generate("responders:install")
      # end

      def install_rspec
        generate("rspec:install")
      end

      def install_devise
        generate("devise:install")
        generate("devise", "User")
      end

      def install_devise_jwt
        generate("model", "JwtDenylist", "jit:string:index")
        inject_into_class(
          "app/models/jwt_denylist.rb",
          "JwtDenylist",
          <<~RUBY
            include Devise::JWT::RevocationStrategies::Denylist
          RUBY
        )
        run("bundle exec rails db:migrate")
        gsub_file(
          "app/models/user.rb",
          /^\s*devise\s*:[a-z_]+(?:,\s*:[a-z_]+)*\s*$/,
          "  devise :database_authenticatable, :registerable, :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist"
        )
        create_file(
          "app/controllers/sessions_controller.rb",
          <<~RUBY
            class SessionsController < Devise::SessionsController
              respond_to :json
            
              private
            
              def respond_with(resource, _opts = {})
                render json: resource
              end
            
              def respond_to_on_destroy
                head :no_content
              end
            end
          RUBY
        )
        gsub_file(
          "config/routes.rb",
          /devise_for\s*:\s*users/,
          '  devise_for :users, defaults: {format: :json}, controllers: {sessions: "sessions"}'
        )
        inject_into_class(
          "app/controllers/application_controller.rb",
          "ApplicationController",
          <<~RUBY
            protect_from_forgery with: :exception, unless: :json_request?

            private

            def json_request?
              request.format.json?
            end
          RUBY
        )
      end

      def install_cors
        config = <<~RUBY
          Rails.application.config.middleware.insert_before 0, Rack::Cors do
            allow do
              origins "http://localhost:5173" # Change this to your client URL.
              resource "*",
                headers: %w[Authorization],
                methods: :any,
                expose: %w[Authorization],
                max_age: 600,
                credentials: true
            end
          end
        RUBY
        create_file("config/initializers/cors.rb", config)
      end

      def run_standard
        run("bundle exec standardrb --fix-unsafely")
      end

      protected

      def get_builder_class
        Flame::AppBuilder
      end
    end
  end
end
