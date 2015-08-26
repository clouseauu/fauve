module Monet
  module Scheme
    class ColourMap

      attr_reader :map

      def initialize(map)
        @map = map
      end

      def section(section_name)
        map[section_name.to_s]
      end

      private
    end
  end
end