module Fauve

    # Representation of a colour_scheme.
    # Holds a raw colour map as well as the current section,
    # reference and colour

  class ColourScheme

    attr_accessor :colour
    alias_method :to_s, :colour

    def initialize(section_name: :app, reference_name: 0, colour_map: Fauve::Config::colour_map)
      @colour_map       = colour_map
      @section          = Fauve::Scheme::Section.new(colour_map, section_name)
      @reference        = Fauve::Scheme::Reference.new(reference_name)
      @colour           = Fauve::Scheme::Colour.new(colour_map, section, reference).colour
    end

    private

    attr_reader :section, :reference, :colour_map

  end
end
