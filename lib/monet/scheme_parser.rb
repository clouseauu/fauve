module Monet

  class SchemeParser

    attr_accessor :colour
    alias_method :to_s, :colour

    def initialize(colour_map: Monet::Config::colour_map, section: :app, reference: 0)
      @colour_map     = colour_map
      @section        = colour_map[section.to_s] rescue Monet::UndefinedSectionError.new("Monet section doesn't exist")
      @reference      = reference.to_s
      @colour         = parse_colour
    end

    private

    attr_reader :section, :reference, :colour_map

    def parse_colour
      case
        when reference_is_key?
          section[reference]
        when reference_is_digit_and_exists?
          section[reference.to_i]
        else
          raise Monet::UndefinedReferenceError.new("Reference isn't a valid index or key")
        end
    end

    def reference_is_digit_and_exists?
      reference_is_digit? && section_contains_index?
    end

    def reference_is_digit?
      /^[0-9]*$/ =~ reference
    end

    def reference_is_key?
      section.is_a?(Hash) && section.has_key?(reference)
    end

    def section_contains_index?
      !section[ reference.to_i ].nil?
    end

  end

end
