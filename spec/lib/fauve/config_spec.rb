require 'spec_helper'

module Fauve
  describe Config do

    let(:config_file)   { File.expand_path("./spec/fixtures/fauve.yml") }
    let(:map)           { subject.colour_map.map }

    before do
      allow(Fauve::Rails::Railtie.config.fauve).to receive(:config_file).and_return(config_file)
    end

    subject { described_class }

    describe '.colour_map' do
      it 'returns a hashified colour scheme' do
        expect(subject.colour_map).to be_a Fauve::Scheme::ColourMap
      end

      it 'includes all sections' do
        expect(map).to have_key 'scheme'
        expect(map).to have_key 'forms'
        expect(map).to have_key 'links'
        expect(map).to have_key 'buttons'
        expect(map).to have_key 'multi_level'
        expect(map).to have_key 'odd_case'
      end
    end
  end
end