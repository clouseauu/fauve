require 'sprockets/sass_functions'

module Sprockets
  module SassFunctions

    # to please Websterites
    # alias_method :monet_color, :monet_colour

    Sass::Script::Functions.declare(:monet_colour, [:section, :ordinal], var_kwargs: true)

    def monet_colour(section, ordinal, filters = {})
        Monet::Utils.new(self, section, ordinal, filters).colour
    end

  end
end