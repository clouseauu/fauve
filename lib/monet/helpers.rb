module Sass
  module Script
    module Functions

      declare(:monet, [:section, :reference], var_kwargs: true)

      def raw_colour(section, reference)
        Monet::ColourScheme.new(
          map: Monet::Config::colour_map,
          section_name: section,
          reference_name: reference
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
end
