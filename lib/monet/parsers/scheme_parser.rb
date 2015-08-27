module Monet

  module Parsers

    class SchemeParser

      attr_accessor :colour
      alias_method :to_s, :colour

      def initialize(map: Monet::Config::colour_map, section_name: :app, reference_name: 0)
        @colour_map       = Monet::Scheme::ColourMap.new(map)
        @section          = Monet::Scheme::Section.new(colour_map, section_name)
        @reference        = Monet::Scheme::Reference.new(reference_name)
        @colour           = Monet::Scheme::Colour.new(colour_map, section, reference).colour
      end

      private

      attr_reader :section, :reference, :colour_map

    end
  end
end
