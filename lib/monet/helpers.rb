module Sass
  module Script
    module Functions

      declare(:monet, [:section, :reference], var_kwargs: true)

      def monet(section, reference, filters = {})
        @monet_section   = section
        @monet_reference = reference
        @monet_filters   = filters
        engine_colour
      end

      private

      attr_reader :monet_section, :monet_reference, :monet_filters

      def raw_colour
        Monet::ColourScheme.new(
          map: Monet::Config::colour_map,
          section_name: monet_section,
          reference_name: monet_reference
        ).to_s
      end

      def engine_colour
        Monet::Engine.new(
          context: self,
          raw_colour: raw_colour,
          filters: monet_filters
        ).colour
      end
    end
  end
end
