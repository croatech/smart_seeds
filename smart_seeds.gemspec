$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "smart_seeds/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "smart_seeds"
  s.version     = SmartSeeds::VERSION
  s.authors     = ["Vitaliy Fry"]
  s.email       = ["vitaliy.fry@gmail.com"]
  s.homepage    = "http://frylock.me"
  s.summary     = "Gem for smart auto generating of new records with random values for your ruby app."
  s.description = "It determines types of fields(attributes) of an ActiveRecord model and creates records with random values for each of these attributes."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails"
  s.add_dependency "faker"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "faker"
end
