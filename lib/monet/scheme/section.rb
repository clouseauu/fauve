module Monet
  module Scheme

    # Representation of a section key as part of a wider scheme.
    # Holds a section name, which points to a top-level key within
    # a colour scheme.
    # Takes a Monet::Scheme::ColourMap and a section name (string)

    class Section

      attr_reader :name

      def initialize(colour_map, name)
        @colour_map = colour_map
        @name       = name.to_s
      end

      def to_h
        return colour_map.map[name] if section_exists?
        raise Monet::UndefinedSectionError.new('Section is not referenced in config')
      end

      private

      attr_reader :colour_map

      def section_exists?
        !!colour_map.map[name]
      end

    end
  end
end