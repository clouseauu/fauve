module Monet

  module Config

    def self.colour_scheme
      YAML.load_file Monet::Rails::Railtie.config.monet.config_file
    end

  end

end

