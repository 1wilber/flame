require_relative "base"

module Flame
  class TestingGenerator < Generators::Base
    def install_rspec
      generate("rspec:install")
    end

    def import_spec_support
      inject_into_file(
        "spec/rails_helper.rb",
        "Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }\n",
        before: "RSpec.configure do |config|\n"
      )
    end

    def support_template
      template("spec/support/shoulda_matchers.rb")
      template("spec/support/factory_bot.rb")
      template("spec/support/database_cleaner.rb")
      #TODO: Move this
      template(".rubocop.yml")
      template(".solargraph.yml" )
    end
  end
end
