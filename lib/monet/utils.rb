module Monet

  class Utils

    attr_accessor :colour_scheme, :section, :ordinal

    def initialize section, ordinal
      @colour_scheme = Monet::Config::colour_scheme
      @section = section.to_s
      @ordinal = ordinal.to_s.to_sym
    end

    def valid?
      section_exists? and ordinal_exists?
    end

    def process
        case
        when !section_exists?
          raise Monet::UndefinedSectionError
        when !ordinal_exists?
          raise Monet::UndefinedOrdinalError
        else
          to_rgb( colour_scheme[ section ][ ordinal_to_int ordinal ] )
        end
    end

    private

    attr_accessor :ordinals, :ordinal

    def to_rgb str
      str.scan(/^#(..?)(..?)(..?)$/).first.map {|num| num.ljust(2, num).to_i(16)}
    end

    def section_exists?
      colour_scheme.has_key? section
    end

    def ordinal_exists?
      ordinals.include? ordinal
    end

    def int_to_ordinal int
      ordinals[ int-1 ]
    end

    def ordinal_to_int ord
      ordinals.index ord
    end

    def ordinals
      [:primary, :secondary, :tertiary, :quaternary, :quinary, :senary]
    end

  end

end