require 'spec_helper'

module Monet
  module Parsers

    describe SchemeParser do

      let(:map)   { YAML.load_file File.expand_path("./spec/fixtures/monet.yml") }
      let(:section_name) { :scheme }

      subject { described_class.new( map: map, section_name: section_name, reference_name: reference_name ) }

      describe "#colour" do

        context "when using integers as a reference" do
          let(:reference_name) { 3 }

          it 'interprets primary colour correctly' do
            expect(subject.colour).to eq "#3c8399"
          end
        end

        context 'when using keys as a reference' do
          let(:section_name) { :forms }
          let(:reference_name) { :main_text }

          it 'interprets primary colour correctly' do
            expect(subject.colour).to eq "#5af8de"
          end
        end

        context 'when referencing a multi-level tree' do
          let(:section_name)   { :multi_level }
          let(:reference_name) { :level }

          context 'when the reference is valid' do
            it 'interprets the colour correctly' do
              expect(subject.colour).to eq '#e5b455'
            end
          end
        end
      end
    end
  end
end
