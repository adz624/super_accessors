# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'super_accessors/version'

Gem::Specification.new do |spec|
  spec.name          = "super_accessors"
  spec.version       = SuperAccessors::VERSION
  spec.authors       = ["eddie"]
  spec.email         = ["eddie@visionbundles.com"]
  spec.description   = %q{Make activerecord support split datetime attributes, store specific datatypes (Integer, String, Boolean)}
  spec.summary       = %q{activerecord datetime split, store specific datatype (Integer, String, Boolean) }
  spec.homepage      = "https://github.com/afunction/super_accessors"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "activerecord"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "rails"
end
