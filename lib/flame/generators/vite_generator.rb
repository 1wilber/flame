require_relative "base"

module Flame
  class ViteGenerator < Generators::Base
    def install
      run("bundle exec vite install")
    end

    def import_vite
      gsub_file "app/views/layouts/application.html.erb", /<%= vite_javascript_tag 'application' %>\n/,
        "<%= vite_javascript_tag 'application.jsx' %>"
      gsub_file "app/views/layouts/application.html.erb", /<%= stylesheet_link_tag 'application', media: 'all' %>\n/, ""
    end

    def install_packages
      run("yarn add vite react react-dom formik yup axios")
    end

    def generate_home
      generate("controller", "pages", "index", "--skip-routes", "--no-test-framework")
      run("echo '' > app/views/pages/index.html.haml")
      inject_into_file "app/views/pages/index.html.haml", "%div#root\n"
    end

    def generate_root_route
      route("root to: 'pages#index'")
    end
  end
end
