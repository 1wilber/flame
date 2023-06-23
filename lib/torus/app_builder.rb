module Torus
  class AppBuilder < Rails::AppBuilder
    def gemfile
      template "Gemfile.erb", "Gemfile"
    end
  end
end
