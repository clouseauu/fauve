module Monet
  module Scheme
    class Section

      attr_reader :name

      def initialize(colour_map, name)
        @colour_map = colour_map
        @name       = name.to_s
      end

      def to_h
        colour_map.map[name]
      end

      private

      attr_reader :colour_map

    end
  end
end