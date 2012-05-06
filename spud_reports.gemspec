$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "spud_reports/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "spud_reports"
  s.version     = Spud::Reports::VERSION
  s.authors     = ["David Estes"]
  s.email       = ["destes@redwindsw.com"]
  s.homepage    = "http://www.redwindsw.com"
  s.summary     = "Reporting engine for RGhost with Spud"
  s.description = "Allows management of RGhost reports as well as remote print jobs."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.2"
  s.add_dependency "spud_core", ">= 0.8.0","< 0.9.0"
  s.add_dependency "paperclip"
  s.add_dependency "rabl"
  s.add_dependency "rghost"
  s.add_dependency "rghost_barcode"
  s.add_dependency "rghost_rails"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "mysql2"
end
