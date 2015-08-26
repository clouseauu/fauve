module Monet

  module Parsers

    class ReferenceParser

      def self.parse(original_reference)
        new(original_reference).reference
      end

      def initialize(original_reference)
        @original_reference = original_reference.to_s
      end

      def reference
        case
        when is_digit?
          original_reference.to_i
        when is_valid_string?
          original_reference.to_s
        else
          raise Monet::InvalidReferenceError.new("Reference isn't a valid index or key")
        end
      end

      private

      attr_reader :original_reference

      def is_digit?
        /^[0-9]*$/ === original_reference
      end

      def is_valid_string?
        /^[a-z]+[a-zA-Z0-9\-_]+$/ === original_reference
      end

    end
  end
end