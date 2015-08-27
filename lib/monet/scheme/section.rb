module Monet
  module Scheme
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