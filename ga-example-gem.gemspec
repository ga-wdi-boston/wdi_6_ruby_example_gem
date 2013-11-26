# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ga_example_gem/version'

Gem::Specification.new do |spec|
  spec.name          = "ga_example_gem"
  spec.version       = GaExampleGem::VERSION
  spec.authors       = ["David Fisher"]
  spec.email         = ["tibbon@gmail.com"]
  spec.description   = %q{An example gem}
  spec.summary       = %q{Makes requests to APIs and has tests.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "httparty"
end
