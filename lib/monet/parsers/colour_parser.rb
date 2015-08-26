module Monet

  module Parsers

    class SchemeParser

      attr_accessor :colour
      alias_method :to_s, :colour

      def initialize(colour_map: Monet::Config::colour_map, section: :app, reference: 0)
        @colour_map     = colour_map
        @section        = SectionParser.parse(colour_map, section)
        @reference      = ReferenceParser.parse(reference)
        @colour         = parse_colour
      end

      private

      attr_reader :section, :reference, :colour_map

      def parse_colour
        if section_contains_reference?
          section[reference]
        else
          raise Monet::UndefinedReferenceError.new("Reference isn't a valid index or key")
        end
      rescue
        raise Monet::UndefinedReferenceError.new("Reference isn't a valid index or key")
      end

      def section_contains_reference?
        !!section[ reference ]
      end

    end
  end
end
