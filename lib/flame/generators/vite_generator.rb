require_relative "base"

module Flame
  class ViteGenerator < Generators::Base
    source_root File.expand_path("../../../templates", __dir__)

    def install
      run("rm -rf ./package.lock")
      run("yarn init -y")

      run("bundle exec vite install")

      run("rm -rf ./package-lock.json")
      run("rm -rf ./yarn.lock")
      run("rm -rf ./node_modules")
    end

    def import_vite
      insert_into_file "app/views/layouts/application.html.haml", "  = vite_client_tag\n", before: "%body\n"
      insert_into_file "app/views/layouts/application.html.haml", "    = vite_react_refresh_tag\n", before: "%body\n"
      insert_into_file "app/views/layouts/application.html.haml", "    = vite_javascript_tag 'application.jsx'\n", before: "%body\n"
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
        @mui/styled-engine-sc
        styled-components
      ]
      yarn_install(packages)
    end

    def install_dev_packages
      packages = %w[
        standard
        @vitejs/plugin-react-swc
      ]

      yarn_install_dev(packages)
    end

    def copy_templates
      remove_file "vite.config.js"
      template("vite.config.js", "vite.config.js")
      template("jsconfig.json", "jsconfig.json")
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
