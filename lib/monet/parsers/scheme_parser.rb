module Monet

  module Parsers

    class SchemeParser

      @@visited_sections = []

      attr_accessor :colour
      alias_method :to_s, :colour

      def initialize(map: Monet::Config::colour_map, section_name: :app, reference_name: 0)
        @colour_map       = Monet::Scheme::ColourMap.new(map)
        @section          = colour_map.section(section_name)
        @reference        = Monet::Scheme::Reference.new(reference_name)
        # @colour           = Monet::Scheme::Colour.new(colour_map, section, reference)
        @filters          = extract_filters
        @colour_candidate = filters.shift
        fetch_colour
      end

      private

      attr_reader :section, :reference, :colour_map, :filters, :colour_candidate

      def extract_filters
        section[reference.key].split(',').collect{ |element| element.strip }
      rescue
        raise Monet::UndefinedReferenceError.new("Reference isn't a valid index or key")
      end

      def fetch_colour
        if is_valid_hex_colour?(colour_candidate)
          @colour = colour_candidate
        else
          while references_another_section?(colour_candidate) do
            recurse_and_parse_colour(colour_candidate)
          end
        end
      end

      def recurse_and_parse_colour(colour)
        new_section       = colour[/[^\[]+/]
        new_reference     = colour.match(/\[(.*?)\]/)[1]
        raise Monet::CircularReferenceError.new('errrorrr') if @@visited_sections.include?([new_section, new_reference])
        @@visited_sections << [new_section, new_reference]
        @colour_candidate = self.class.new(map: colour_map.map, section_name: new_section, reference_name: new_reference).colour
        @colour           = colour_candidate
      end

      def references_another_section?(colour)
        /\[([a-z_]|[0-9])+\]/ === colour
      end

      def is_valid_hex_colour?(colour)
        /^#(?:[0-9a-fA-F]{3}){1,2}$/ === colour
      end

    end
  end
end
