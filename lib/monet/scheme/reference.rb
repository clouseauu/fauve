module Monet
  module Scheme

      # Representation of a reference as part of a wider scheme.
      # Holds a reference, which can be an integer, a string or a
      # reference to another section[ref] as a string in the form
      # "scheme[1]" or "buttons[main_text]"
      # depending on how the config yaml file has been defined.

    class Reference

      def initialize(reference_name)
        @reference_name = reference_name.to_s
      end

      def key
        case
        when reference_is_digit?
          reference_name.to_i
        when reference_is_valid_string?
          reference_name.to_s
        else
          raise Monet::InvalidReferenceError.new("Reference isn't a valid index or key")
        end
      end

      private

      DIGIT_KEY_REGEX         = /^[0-9]*$/
      ALPHANUMERIC_KEY_REGEX  = /^[a-z]+[a-zA-Z0-9\-_]+$/

      attr_reader :reference_name

      def reference_is_digit?
        DIGIT_KEY_REGEX === reference_name
      end

      def reference_is_valid_string?
        ALPHANUMERIC_KEY_REGEX === reference_name
      end
    end
  end
end