module Fauve::Rails

  # Tie Fauve options to Rails.

  class Railtie < ::Rails::Railtie
    config.fauve = ActiveSupport::OrderedOptions.new

    initializer :fauve_setup do |app|
      config.fauve.config_file = File.join(Rails.root, 'config/fauve.yml') unless config.fauve.config_file
      Fauve::Scheme::ColourMap.instance.map = YAML.load_file(Fauve::Rails::Railtie.config.fauve.config_file)
    end

  end

end