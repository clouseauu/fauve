require 'sprockets/sass_functions'

module Sprockets
  module SassFunctions

    Sass::Script::Functions.declare(:monet, [:section, :reference], var_kwargs: true)

    def raw_colour(section, reference)
      Monet::SchemeParser.new(
        colour_map: Monet::Config::colour_map,
        section: section,
        reference: reference
      ).to_s
    end

    def monet(section, reference, filters = {})
      Monet::Engine.new(
        sass_context: self,
        raw_colour: raw_colour(section, reference),
        filters: filters
      ).colour
    end

  end
end
