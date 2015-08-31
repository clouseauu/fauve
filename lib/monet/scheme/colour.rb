module Monet
  module Scheme

    # Representation of a colour as part of a wider scheme.
    # Holds a raw colour and a colour with filters applied.
    # Requires Monet::Scheme::ColourMap, Monet::Scheme::Section
    # and Monet::Scheme::Reference

    class Colour

      @@candidates = []

      attr_reader :filters, :raw_colour

      def initialize(colour_map, section, reference)
        @colour_map = colour_map
        @section    = section
        @reference  = reference
        @candidate  = operations.shift
        @filters    = operations
        @raw_colour = determine_raw_colour
      end

      def colour
        raw_colour
      end

      private

      HEX_COLOUR_REGEX     = /^#(?:[0-9a-fA-F]{3}){1,2}$/
      REFERENCE_REGEX      = /\[([a-z_]|[0-9])+\]/
      SECTION_NAME_REGEX   = /[^\[]+/
      REFERENCE_NAME_REGEX = /\[(.*?)\]/

      attr_reader :colour_map, :section, :reference, :operations, :candidate

      def determine_raw_colour
        return candidate if is_valid_hex_colour?
        while references_another_section? do
          resolve(candidate)
        end
        @@candidates = []
        candidate
      end

      def resolve(colour)
        raise Monet::CircularReferenceError.new('Circular reference detected') if @@candidates.include?(colour)
        @@candidates << colour
        @candidate = recursed(colour).raw_colour
      end

      def recursed(colour)
        self.class.new(colour_map, source_section(colour), source_reference(colour))
      end

      def source_section(key)
        section.class.new(colour_map, key[SECTION_NAME_REGEX])
      end

      def source_reference(key)
        reference.class.new(key.match(REFERENCE_NAME_REGEX)[1])
      end

      def operations
        @operations ||= section.to_h[reference.key].split(',').collect{ |element| element.strip }
      rescue
        raise Monet::UndefinedReferenceError.new("Reference isn't a valid index or key")
      end

      def is_valid_hex_colour?
        HEX_COLOUR_REGEX === candidate
      end

      def references_another_section?
        REFERENCE_REGEX === candidate
      end
    end
  end
end