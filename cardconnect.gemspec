# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cardconnect/version'

Gem::Specification.new do |spec|
  spec.name          = "cardconnect"
  spec.version       = CardConnect::VERSION
  spec.authors       = ["Jason Taylor"]
  spec.email         = ["jason@mobilecause.com"]
  spec.summary       = %q{CardConnect API Ruby Wrapper}
  spec.description   = %q{CardConnect API Ruby Wrapper}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'minitest', '~> 5.4'

  spec.add_dependency 'faraday', '~> 0.9.0'
end
