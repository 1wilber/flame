require_relative "lib/torus/version"

Gem::Specification.new do |s|
  s.name = "torus"
  s.required_ruby_version = ">= #{Torus::RUBY_VERSION}"
  s.version = Torus::VERSION
  s.authors = ["n0tbot"]
  s.email = ["wilber.garcia@outlook.es"]
  s.summary = "Generate a Rails app with Garage Labs practices"
  s.description = "Torus is a powerful Ruby gem designed to simplify and streamline application development by providing a comprehensive set of tools and functionalities."
  s.license = "MIT"
  s.homepage = "https://github.com/notb0t/torus"

  # s.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  # s.metadata["homepage_uri"] = spec.homepage
  # s.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # s.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  s.add_dependency "rails", Torus::RAILS_VERSION
  s.files = Dir[".ruby-version", "bin/torus", "{lib,templates}/**/*", "LICENSE", "*.md"]
  s.executables = ["torus"]
  s.require_paths = ["lib"]
  s.add_development_dependency "rspec", "~> 3.12"
  s.add_development_dependency "standard", "~> 1.29"
end
