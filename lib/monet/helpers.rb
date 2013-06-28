require 'sprockets/sass_functions'

module Sprockets
  module SassFunctions

    # to please Websterites
    # alias_method :monet_color, :monet_colour

    Sass::Script::Functions.declare(:monet, [:section, :ordinal], var_kwargs: true)

    def monet(section, ordinal, filters = {})
      Monet::Utils.new(
        sass_context: self,
        colour_scheme: Monet::Config::colour_scheme,
        section: section,
        ordinal: ordinal,
        filters: filters
        ).colour
    end

  end
end
