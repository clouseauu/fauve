module Fauve

  module Config

    def self.colour_map
      Fauve::Scheme::ColourMap.new(YAML.load_file(self.config_file))
    end

    private

    def self.config_file
      Fauve::Rails::Railtie.config.fauve.config_file
    end

  end

end

