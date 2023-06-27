require "rails/generators"
require "rails/generators/base"

module Flame
  class TrucoGenerator < Rails::Generators::Base
    source_root File.expand_path("../../../../templates", __FILE__)

    def create_any
      puts "====================="
      puts "Hola"
      puts "====================="
    end
  end
end
