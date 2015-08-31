# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fauve/version'

Gem::Specification.new do |s|
  s.name          = 'fauve'
  s.version       = Fauve::VERSION
  s.authors       = ['Daniel Angel-Bradford', 'Timothy Dang']
  s.email         = ['locusdelicti@gmail.com', 'timothyqd@gmail.com']
  s.description   = %q{Fauve lets you manage your app's colour scheme}
  s.summary       = %q{Fauve lets you manage your app's colour scheme}
  s.homepage      = ''
  s.license       = 'MIT'

  s.files                 = `git ls-files`.split($/)
  s.executables           = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files            = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths         = ['lib']
  s.required_ruby_version = '~> 2'

  s.add_dependency 'sass',            '>= 3.1.10'
  s.add_dependency 'rails',           '>= 4.1'
  s.add_dependency 'slim'
  s.add_dependency 'railties'
  s.add_dependency 'sprockets-rails', '>= 2.1'
  s.add_dependency 'trollop'

  s.add_development_dependency 'bundler',     '~> 1.3'
  s.add_development_dependency 'rspec-rails', '>= 3.1'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'awesome_print'

end
