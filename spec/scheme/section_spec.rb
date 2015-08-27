require 'spec_helper'

module Monet
  module Scheme
    describe Section do

      let(:section_name) { 'i_like_bananas' }
      let(:config)  { YAML.load_file File.expand_path("./spec/fixtures/monet.yml") }
      let(:colour_map) { Monet::Scheme::ColourMap.new(config) }

      subject { described_class.new(colour_map, section_name) }

      describe '#initialize' do
        it 'exposes the section name' do
          expect(subject.name).to eq section_name
        end
      end

      describe '#to_h' do

        context 'when the section exists' do
          let(:section_name) { :odd_case }

          it 'returns the section hash' do
            expect(subject.to_h).to eq({ 'main' => '#4de3ef' })
          end
        end

        context 'when the section does not exist' do
          let(:section_name) { 'i_like_bananas' }

          it 'returns the section hash' do
            expect{subject.to_h}.to raise_exception Monet::UndefinedSectionError
          end
        end

      end
    end
  end
end