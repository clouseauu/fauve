module Monet

  class Config

    attr_accessor :settings

    def initialize
      @settings = YAML.load_file Monet::Rails::Railtie.config.monet.config_file
    end

  end

end

