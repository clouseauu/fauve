require 'spec_helper'

module Monet
  describe Config do

    let(:config_file)   { File.expand_path("./spec/fixtures/monet.yml") }

    before do
      allow(Monet::Rails::Railtie.config.monet).to receive(:config_file).and_return(config_file)
    end

    subject { described_class }

    describe '.colour_map' do
      it 'returns a hashified colour scheme' do
        expect(subject.colour_map).to be_a Hash
      end

      it 'includes all sections' do
        expect(subject.colour_map).to have_key 'scheme'
        expect(subject.colour_map).to have_key 'forms'
        expect(subject.colour_map).to have_key 'links'
        expect(subject.colour_map).to have_key 'buttons'
        expect(subject.colour_map).to have_key 'multi_level'
        expect(subject.colour_map).to have_key 'odd_case'
      end


    end
  end
end