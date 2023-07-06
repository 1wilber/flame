require_relative "base"

module Flame
  class DeviseGenerator < Generators::Base
    APP_CONTROLLER = <<~RUBY
      protect_from_forgery with: :exception, unless: :json_request?

        private

        def json_request?
          request.format.json?
        end
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

    def install
      generate("devise:install")
      generate("devise", "User")
    end

    def add_timeoutable
      gsub_file(
        "app/models/user.rb",
        /^\s*devise\s*:[a-z_]+(?:,\s*:[a-z_]+)*\s*$/,
        "  devise :database_authenticatable, :registerable, :timeoutable, timeout_in: 1.day"
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

    def insert_secret_key
      inject_into_file(
        "config/initializers/devise.rb",
        "  config.secret_key = Rails.application.credentials.secret_key_base\n",
        after: "Devise.setup do |config|\n"
      )
    end
  end
end
