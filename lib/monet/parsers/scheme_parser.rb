module Monet

  module Parsers

    class SchemeParser

      attr_accessor :colour
      alias_method :to_s, :colour

      def initialize(colour_map: Monet::Config::colour_map, section: :app, reference: 0)
        @colour_map       = colour_map
        @section          = SectionParser.parse(colour_map, section)
        @reference        = ReferenceParser.parse(reference)
        @filters          = extract_filters
        @colour_candidate = filters.shift
        fetch_colour
      end

      private

      attr_reader :section, :reference, :colour_map, :filters, :colour_candidate

      def extract_filters
        section[reference].split(',').collect{ |element| element.strip }
      rescue
        raise Monet::UndefinedReferenceError.new("Reference isn't a valid index or key")
      end

      def fetch_colour
        if is_valid_hex_colour?
          @colour = colour_candidate
        else
          while references_another_section? do
            new_section       = colour_candidate[/[^\[]+/]
            new_reference     = colour_candidate.match(/\[(.*?)\]/)[1]
            @colour_candidate = self.class.new(colour_map: colour_map, section: new_section, reference: new_reference).colour
            @colour           = colour_candidate
          end
        end
      end

      def references_another_section?
        /\[([a-z]|[0-9])+\]/ === colour_candidate
      end

      def is_valid_hex_colour?
        /^#(?:[0-9a-fA-F]{3}){1,2}$/ === colour_candidate
      end

    end
  end
end
