module Sass
  module Script
    module Functions

      declare(:fauve, [:section, :reference], var_kwargs: true)

      def fauve(section, reference, filters = {})
        @fauve_section   = section
        @fauve_reference = reference
        @fauve_filters   = filters
        engine_colour
      end

      private

      attr_reader :fauve_section, :fauve_reference, :fauve_filters

      def raw_colour
        Fauve::ColourScheme.new(
          map: Fauve::Config::colour_map,
          section_name: fauve_section,
          reference_name: fauve_reference
        ).to_s
      end

      def engine_colour
        Fauve::Engine.new(
          context: self,
          raw_colour: raw_colour,
          filters: fauve_filters
        ).colour
      end
    end
  end
end
