require 'sprockets/sass_functions'

module Sprockets
  module SassFunctions

    # to please Websterites
    # alias_method :monet_color, :monet_colour

    # 1. Load colour scheme
    # 2. verify section and ordinal against colour scheme
    # 3. parse any filters
    # 4. return a sass colour

    def monet_colour(section, ordinal, filters = {})

        Sass::Script::Color.new( MonetUtils.new(section, ordinal).process )

        # Sass::Script::String.new( "#{Monet::Config::colour_scheme}" )
        # lighten(Sass::Script::Color.new([255,128,128]), Sass::Script::Number.new(20) )
    end


    class MonetUtils

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
        to_rgb( colour_scheme[ section ][ ordinal_to_int ordinal ] ) if valid?
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
end