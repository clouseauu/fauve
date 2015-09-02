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

      context 'configuration loading' do
        it 'loads an initializer' do
          expect(described_class.instance.initializers.first.name).to eq :fauve_setup
          expect(described_class.instance.railtie_name).to eq 'fauve_rails_railtie'
        end
      end

      context 'ColourMap configuration' do

        it 'sets up a ColourMap object with a hash from fauve.yml' do
          expect(Scheme::ColourMap.instance.map).to be_a Hash
        end

        it 'loads the right hash' do
          an_identifying_key = Scheme::ColourMap.instance.map['links']['main_text']
          expect(an_identifying_key).to eq 'scheme[1]'
        end
      end
    end
  end
end

