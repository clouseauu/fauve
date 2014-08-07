module Monet

  class Utils

    attr_reader :colour

    def initialize options
      @colour_scheme  = options[:colour_scheme]         || Monet::Config::colour_scheme
      @sass_context   = options[:sass_context]          || Sass::Script::Functions::EvaluationContext.new {}
      @section        = options[:section].to_sym        || :app
      @reference      = options[:reference].to_s.to_sym || :primary
      @filters        = options[:filters]               || {}

      validate_input
      @colour  = raw_colour
      run_filters
    end

    private

    attr_reader :colour_scheme, :section, :reference, :filters, :ordinals, :sass_context

    def validate_input
      case
      when !section_exists?
        raise Monet::UndefinedSectionError
      when !ordinal_exists?
        raise Monet::UndefinedOrdinalError
      end
    end

    def raw_colour
      Sass::Script::Color.new rgb_raw_colour
    end

    def rgb_raw_colour
      to_rgb( colour_scheme[ section ][ ordinal_to_int reference ] )
    end

    def to_rgb str
      str.scan(/^#(..?)(..?)(..?)$/).first.map {|num| num.ljust(2, num).to_i(16)}
    end

    def run_filters
      filters.keys.each do |key|
        @colour = sass_context.send key.to_sym, colour, filters[key]
      end
    end

    def section_exists?
      colour_scheme.has_key? section
    end

    def ordinal_exists?
      ordinals.include? reference
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
