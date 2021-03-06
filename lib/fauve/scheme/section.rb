module Fauve
  module Scheme

    # Representation of a section key as part of a wider scheme.
    # Holds a section name, which points to a top-level key within
    # a colour scheme.
    # Takes a section name (string)

    class Section

      attr_reader :name

      def initialize(name)
        @name       = name.to_s
        @colour_map = ColourMap.instance
      end

      def to_h
        return colour_map.map[name] if section_exists?
        raise Fauve::UndefinedSectionError.new('Section is not referenced in config')
      end

      private

      attr_reader :colour_map

      def section_exists?
        !!colour_map.map[name]
      end

    end
  end
end