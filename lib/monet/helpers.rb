require 'sprockets/sass_functions'

module Sprockets
  module SassFunctions

    # to please Websterites
    # alias_method :monet_color, :monet_colour

    Sass::Script::Functions.declare(:monet, [:section, :reference], var_kwargs: true)

    def monet(section, ordinal, filters = {})
      Monet::Engine.new(
        sass_context: self,
        colour_scheme: Monet::Config::colour_scheme,
        section: section,
        reference: reference,
        filters: filters
        ).colour
    end

  end
end
