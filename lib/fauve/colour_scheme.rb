module Fauve

  # Representation of a colour_scheme.
  # Holds the current section, reference and colour

  class ColourScheme

    attr_accessor :colour
    alias_method :to_s, :colour

    def initialize(section_name: :app, reference_name: 0)
      @section          = Fauve::Scheme::Section.new(section_name)
      @reference        = Fauve::Scheme::Reference.new(reference_name)
      @colour           = Fauve::Scheme::Colour.new(section, reference).colour
    end

    private

    attr_reader :section, :reference

  end
end
