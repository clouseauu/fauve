require 'spec_helper'

# TODO: This is a bit meh. We need something like combustion to properly test
# the gem inside a rails application.

module Fauve
  module Rails
    describe Railtie do

      let(:config_file)   { File.expand_path("./spec/fixtures/fauve.yml") }

      subject { described_class }

      context 'config' do
        it 'ties to Rails config' do
          expect(subject.config.fauve).to be_a ActiveSupport::OrderedOptions
        end
      end
    end
  end
end

