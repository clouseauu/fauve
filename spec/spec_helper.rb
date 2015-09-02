require 'codeclimate-test-reporter'
CodeClimate::TestReporter.start

require 'pry'
require 'sass'
require 'yaml'
require 'sprockets/railtie'
require 'fauve/railtie'
require 'fauve/errors'
require 'fauve/engine'
require 'fauve/scheme/colour_map'
require 'fauve/scheme/section'
require 'fauve/scheme/reference'
require 'fauve/scheme/colour'
require 'fauve/colour_scheme'
require 'fauve/helpers'

Fauve::Scheme::ColourMap.instance.map = YAML.load_file(File.expand_path("./spec/fixtures/fauve.yml"))
