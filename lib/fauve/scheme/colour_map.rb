module Fauve
  module Scheme

    # Representation of a colour map as part of a wider scheme.
    # Holds the colour map hash as defined in the options yaml file

    class ColourMap

      attr_reader :map

      def initialize(map)
        @map = map
      end

      private
    end
  end
end