module Fauve

  # Interface for Fauve to talk to Sass.
  # Applies filters and returns Sass-Object colours
  # Requires Fauve::Scheme::ColourMap, Fauve::Scheme::Section
  # and Fauve::Scheme::Reference

  class Engine

    attr_reader :colour

    def initialize(context: Sass::Script::Functions::EvaluationContext.new({}), raw_colour: raw_colour, filters: {})
      @sass_context     = context
      @filters          = filters
      @raw_colour       = raw_colour
      @colour           = sass_colour
      run_filters
    end

    private

    attr_reader :filters, :sass_context, :raw_colour

    def sass_colour
      Sass::Script::Color.new to_rgb
    end

    def to_rgb
      raw_colour.scan(/^#(..?)(..?)(..?)$/).first.map {|num| num.ljust(2, num).to_i(16)}
    end

    def run_filters
      # binding.pry
      filters.keys.each do |filter|
        @colour = sass_context.send filter.to_sym, colour, filters[filter]
      end
    end

  end

end
