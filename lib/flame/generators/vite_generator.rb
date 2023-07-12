require_relative "base"

module Flame
  class ViteGenerator < Generators::Base
    def install
      run("rm -rf ./package.lock")
      run("yarn init -y")

      run("bundle exec vite install")

      run("rm -rf ./package-lock.json")
      run("rm -rf ./yarn.lock")
      run("rm -rf ./node_modules")
    end

    def install_packages
      packages = %w[
        react
        react-dom
        formik
        yup
        axios
        @reduxjs/toolkit
        react-redux
        react-router-dom
        @mui/material
        @mui/icons-material
        @emotion/react
        @emotion/styled
        react-toastify
        styled-components
        sass
      ]
      yarn_install(packages)
    end

    def install_dev_packages
      packages = %w[
        standard
        @vitejs/plugin-react-swc
        eslint-plugin-react
      ]

      yarn_install_dev(packages)
    end

    def copy_templates
      remove_file "vite.config.js"
      remove_file "vite.config.ts"
      template("vite.config.js", "vite.config.js")
      template("jsconfig.json", "jsconfig.json")
      run("rm -rf app/frontend")
      run("rm -rf db/seeds.rb")
      run("rm app/views/layouts/application.html.haml")
      directory("frontend", "app/frontend")
      template("app/views/layouts/application.html.haml", "app/views/layouts/application.html.haml")
      template("db/seeds.rb", "db/seeds.rb")
    end

    def install_standardjs
      template("eslintrc.js", ".eslintrc.js")
    end

    def generate_home
      generate("controller", "pages", "index", "--skip-routes", "--no-test-framework")
      run("echo '' > app/views/pages/index.html.haml")
      append_to_file("app/views/pages/index.html.haml", "#root\n")
    end

    def generate_root_route
      route("root to: 'pages#index'")
    end
  end
end
