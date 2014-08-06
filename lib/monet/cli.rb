require 'trollop'
require 'awesome_print'
require 'rails'

module Monet

  #monet -o x/y/x.html [rails/public] -i x/y/z.yml [rails/config/monet.xml] -v [variations default true]

  module CLI

    def run
      ap options
    end
    module_function :run

    def options
      Trollop::options do
        opt :output, "Output",  :type => :string, :default => ( defined?(Rails) ? Rails.public_path.to_s : "./" )
        opt :input, "Input",    :type => :string, :default => ( defined?(Rails) ? "#{Rails.root}/config" : "./" )
        opt :skip_variations, "Skip variations", :short => "-v"
      end
    end
    module_function :options


  end

end