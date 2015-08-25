module Monet

  class SchemeParser

    attr_accessor :colour
    alias_method :to_s, :colour

    ORDINALS = [ 'primary', 'secondary', 'tertiary', 'quaternary', 'quinary', 'senary', 'septenary', 'octonary', 'nonary', 'denary' ]

    def initialize(colour_scheme: Monet::Config::colour_scheme, section: :app, reference: 0)
      @section        = colour_scheme[section.to_s] rescue Monet::UndefinedSectionError.new("Monet section doesn't exist")
      @reference      = reference.to_s
      @colour         = parse_colour
    end

    private

    attr_reader :section, :reference

    def parse_colour
      case
        when reference_is_digit_and_exists?
            section[ reference_index ]
        when reference_is_ordinal_and_exists?
          section[ ordinal ]
        when section_contains_key?
            section[reference]
        else
          raise Monet::UndefinedReferenceError.new "Reference isn't a valid index, ordinal or key"
        end
    end

    def reference_is_digit_and_exists?
      reference_is_digit? && section_contains_index?( reference_index )
    end

    def reference_is_ordinal_and_exists?
      reference_is_ordinal? && section_contains_index?( ordinal )
    end

    def reference_is_ordinal?
      ORDINALS.include? reference
    end

    def reference_is_digit?
      /^[0-9]*$/ =~ reference
    end

    def section_contains_key?
      section.is_a?(Hash) && section.has_key?(reference)
    end

    def section_contains_index?(index)
      !section[ index ].nil?
    end

    def ordinal
      ORDINALS.index(reference)
    end

    def reference_index
      reference.to_i - 1
    end

  end

end
