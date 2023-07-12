require_relative "lib/flame/version"

Gem::Specification.new do |s|
  s.name = "flamerb"
  s.version = Flame::VERSION
  s.authors = ["n0tbot"]
  s.email = ["wilber.garcia@outlook.es"]
  s.summary = "Generate a Rails app with best practices"
  s.description = "Flame is a powerful Ruby gem designed to simplify and streamline application development by providing a comprehensive set of tools and functionalities."
  s.license = "MIT"
  s.homepage = "https://github.com/notb0t/flame"

  s.files = Dir[".ruby-version", "bin/flame", "{lib,templates}/**/*", "LICENSE", "*.md"]
  s.executables = ["flamerb"]
  s.require_paths = ["lib"]
  s.add_dependency "rails", Flame::RAILS_VERSION
  s.add_development_dependency "rspec", "~> 3.12"
  s.add_development_dependency "standard", "~> 1.29"
end
