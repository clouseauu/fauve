module Monet

  module Parsers

    class SectionParser

      def self.parse(colour_map, section_name)
        new(colour_map, section_name).section
      end

      def initialize(colour_map, section_name)
        @colour_map   = colour_map
        @section_name = section_name.to_s
      end

      def section
        return colour_map[section_name] if section_exists?
        raise Monet::UndefinedSectionError.new("Monet section doesn't exist")
      end

      private

      attr_reader :colour_map, :section_name

      def section_exists?
        !colour_map[section_name].nil?
      end
    end
  end
end