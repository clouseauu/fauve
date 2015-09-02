require 'fauve/version'
require 'fauve/errors'

if defined? Rails
  require 'sprockets/railtie'
  require 'fauve/engine'
  require 'fauve/scheme/colour_map'
  require 'fauve/scheme/section'
  require 'fauve/scheme/reference'
  require 'fauve/scheme/colour'
  require 'fauve/colour_scheme'
  require 'fauve/railtie'
  require 'fauve/helpers'
end


module Fauve
  module Rails
  end
end