require 'monet/version'
require 'monet/errors'
require 'monet/config'

if defined? Rails
  require 'monet/railtie'
  require 'monet/helpers'
end

module Monet
  module Rails
  end
end

