require_relative "base"

module Flame
  class HamlGenerator < Generators::Base
    def convert_erb_to_haml
      run("HAML_RAILS_DELETE_ERB=true rails haml:erb2haml")
    end
  end
end
