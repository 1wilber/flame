require_relative "base"

module Flame
  class DeviseGenerator < Generators::Base
    def install
      generate("devise:install")
      generate("devise", "User")
    end

    def custom_user_model
      template("app/models/user.rb", force: true)
    end

    def generate_session_controller
      template("app/controllers/sessions_controller.rb", force: true)
    end

    def modify_session_route
      template("config/routes.rb", force: true)
    end

    def modify_app_controller
      template("app/controllers/application_controller.rb", force: true)
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
