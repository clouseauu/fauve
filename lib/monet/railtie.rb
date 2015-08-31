module Monet::Rails

  # Tie Monet options to Rails.

  class Railtie < ::Rails::Railtie
    config.monet = ActiveSupport::OrderedOptions.new

    initializer :monet_setup do |app|
      config.monet.config_file = File.join(Rails.root, 'config/monet.yml') unless config.monet.config_file
    end

  end

end