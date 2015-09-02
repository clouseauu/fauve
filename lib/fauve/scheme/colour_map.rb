module Fauve
  module Scheme

    # Representation of a colour map as part of a wider scheme.
    # Holds the colour map hash as defined in the fauve.yaml file

    class ColourMap

      include Singleton

      attr_accessor :map

    end
  end
end