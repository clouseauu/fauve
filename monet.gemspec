# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'monet/version'

Gem::Specification.new do |spec|
  spec.name          = "monet"
  spec.version       = Monet::VERSION
  spec.authors       = ["Daniel Angel-Bradford", "Timothy Dang"]
  spec.email         = ["locusdelicti@gmail.com", "timothyqd@gmail.com"]
  spec.description   = %q{Monet lets you manage your app's colour scheme}
  spec.summary       = %q{Monet lets you manage your app's colour scheme}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "awesome_print"

end
