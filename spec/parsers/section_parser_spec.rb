require 'spec_helper'

module Monet
  module Parsers

    describe SectionParser do

      describe '.parse' do
        let(:colour_map) { YAML.load_file File.expand_path("./spec/fixtures/monet.yml") }
        subject { described_class.parse(colour_map, section_name) }

        context 'when the section exists' do

          let(:section_name) { :forms }

          it 'returns that particular section' do
            expect( subject ).to be_a Hash
            expect( subject.length ).to eq 3
            expect( subject ).to have_key 'main_bg'
            expect( subject['alternate_bg'] ).to eq '#9cde0d'
          end
        end

        context 'when the section does not exist' do

          let(:section_name) { :boom_boom_boom }

          it 'raises an UndefinedReference error' do
            expect{ subject }.to raise_exception Monet::UndefinedSectionError
          end
        end
      end
    end
  end
end