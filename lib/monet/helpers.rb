require 'sprockets/sass_functions'

module Sprockets
  module SassFunctions

    # to please Websterites
    # alias_method :monet_color, :monet_colour

    def monet_colour(section, ordinal)
      Sass::Script::String.new "#{::Monet::Config.new.settings}"
    end

  end
end