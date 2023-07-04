require_relative "base"

module Flame
  class DeviseJwtGenerator < Generators::Base
    APP_CONTROLLER = <<~RUBY
      protect_from_forgery with: :exception, unless: :json_request?

        private

        def json_request?
          request.format.json?
        end
    RUBY
    JWT_DENYLIST = <<~RUBY
      include Devise::JWT::RevocationStrategies::Denylist
    RUBY

    SESSION_CONTROLLER = <<~RUBY
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

    def generate_jwt_denylist
      generate("model", "JwtDenylist", "jit:string:index")
      inject_into_class(
        "app/models/jwt_denylist.rb",
        "JwtDenylist",
        JWT_DENYLIST
      )
    end

    def run_migration
      run("bundle exec rails db:migrate")
    end

    def add_jwt_denylist_to_user
      gsub_file(
        "app/models/user.rb",
        /^\s*devise\s*:[a-z_]+(?:,\s*:[a-z_]+)*\s*$/,
        "  devise :database_authenticatable, :registerable, :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist"
      )
    end

    def generate_session_controller
      create_file(
        "app/controllers/sessions_controller.rb",
        SESSION_CONTROLLER
      )
    end

    def modify_session_route
      gsub_file(
        "config/routes.rb",
        /devise_for\s*:\s*users/,
        '  devise_for :users, defaults: {format: :json}, controllers: {sessions: "sessions"}'
      )
    end

    def modify_app_controller
      inject_into_class(
        "app/controllers/application_controller.rb",
        "ApplicationController",
        APP_CONTROLLER
      )
    end
  end
end
