require_relative "base"

module Flame
  class TestingGenerator < Generators::Base
    def install_rspec
      generate("rspec:install")
    end

    def install_gems
    end
  end
end
