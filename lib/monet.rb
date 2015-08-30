require 'monet/version'
require 'monet/errors'
require 'monet/config'

if defined? Rails
  require 'sprockets/railtie'
  require 'monet/engine'
  require 'monet/scheme/colour_map'
  require 'monet/scheme/section'
  require 'monet/scheme/reference'
  require 'monet/scheme/colour'
  require 'monet/colour_scheme'
  require 'monet/railtie'
  require 'monet/helpers'
end

module Monet
  module Rails
  end
end

