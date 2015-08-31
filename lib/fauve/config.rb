module Fauve

  module Config

    def self.colour_map
      YAML.load_file Fauve::Rails::Railtie.config.fauve.config_file
    end

  end

end

