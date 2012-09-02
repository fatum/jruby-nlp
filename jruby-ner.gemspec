$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ner/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "jruby-ner"
  s.version     = Ner::VERSION
  s.authors     = ["Maxim Filippovich"]
  s.email       = ["fatumka@gmail.com"]
  s.homepage    = "http://twitter.com/mfilippovich"
  s.summary     = "JRuby NamedEntity extractor"
  s.description = "JRuby wrapper for Stanford Named Entity Tagger"

  s.files = Dir["{lib}/**/*"] + ["Gemfile", "Rakefile", "README.md"]

  s.add_dependency "rake"
  s.add_dependency "nokogiri"
end
