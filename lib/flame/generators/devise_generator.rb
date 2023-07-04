require_relative "base"

module Flame
  class DeviseGenerator < Generators::Base
    def install
      generate("devise:install")
      generate("devise", "User")
    end
  end
end
