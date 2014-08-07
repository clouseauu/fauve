module Monet

  class Engine

    attr_reader :colour

    def initialize options
      @sass_context     = options[:sass_context]          || Sass::Script::Functions::EvaluationContext.new {}
      @filters          = options[:filters]               || {}
      @raw_colour       = options[:raw_colour]
      @colour           = sass_colour
      run_filters
    end

    private

    attr_reader :filters, :sass_context, :raw_colour

    def sass_colour
      Sass::Script::Color.new to_rgb(raw_colour)
    end

    def to_rgb hex_colour
      hex_colour.scan(/^#(..?)(..?)(..?)$/).first.map {|num| num.ljust(2, num).to_i(16)}
    end

    def run_filters
      filters.keys.each do |filter|
        @colour = sass_context.send filter.to_sym, colour, filters[filter]
      end
    end

  end

end
