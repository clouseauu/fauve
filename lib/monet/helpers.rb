require 'sprockets/sass_functions'

module Sprockets
  module SassFunctions

    # to please Websterites
    alias_method :monet_color, :monet_colour

    def monet_colour(section, ordinal, filters = {})
      Sass::Script::String.new(sprockets_context.asset_path(path.value), :string)
    end

  end
end