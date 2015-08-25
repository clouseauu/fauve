require 'monet/version'
require 'monet/errors'
require 'monet/config'

if defined? Rails
  require 'monet/engine'
  require 'monet/parsers/section_parser'
  require 'monet/parsers/reference_parser'
  require 'monet/parsers/scheme_parser'
  require 'monet/railtie'
  require 'monet/helpers'
end

module Monet
  module Rails
  end
end

