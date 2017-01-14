$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "autoseed/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "autoseed"
  s.version     = Autoseed::VERSION
  s.authors     = ["Vitaliy Fry"]
  s.email       = ["vitaliy.fry@gmail.com"]
  s.homepage    = "http://"
  s.summary     = "Summary of Autoseed."
  s.description = "Description of Autoseed."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.1"

  s.add_development_dependency "sqlite3"
end
