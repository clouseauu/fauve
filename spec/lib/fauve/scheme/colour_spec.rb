require 'spec_helper'

module Fauve
  module Scheme
    describe Colour do

      let(:colour_map)    { Scheme::ColourMap.instance }
      let(:section_name)  { :scheme }
      let(:section)       { Fauve::Scheme::Section.new(colour_map, section_name) }
      let(:reference)     { Fauve::Scheme::Reference.new(reference_name) }

      subject { described_class.new( colour_map, section, reference ) }

      describe '#initialize' do
        context 'when passed filters' do
          let(:section_name)   { :links }
          let(:reference_name) { :main_hover }

          it 'correctly interprets filters' do
            expect(subject.filters).to be_a Array
            expect(subject.filters.length).to eq 2
          end
        end

        context 'when not passed filters' do
          let(:section_name)   { :links }
          let(:reference_name) { :main_text }

          it 'correctly interprets filters' do
            expect(subject.filters).to be_empty
          end
        end
      end

      describe '#raw_colour' do
        context "when using integers in the reference" do
          let(:reference_name) { 0 }

          it 'interprets primary colour correctly' do
            expect(subject.raw_colour).to eq "#131210"
          end

          context "when invoking other integers" do
            let(:reference_name) { 2 }

            it 'interprets colours in the scheme correctly' do
              expect(subject.raw_colour).to eq "#e5b455"
            end
          end

          context "when invoking the last existing integer" do
            let(:reference_name) { 4 }

            it 'interprets the colour correctly' do
              expect(subject.raw_colour).to eq "#d8ccb2"
            end
          end
        end

        context 'when using keys' do
          let(:section_name) { :forms }
          let(:reference_name) { :main_bg }

          it 'interprets primary colour correctly' do
            expect(subject.raw_colour).to eq "#f60"
          end

          context "when invoking other keys" do
            let(:reference_name) { :alternate_bg }

            it 'interprets colours in the scheme correctly' do
              expect(subject.raw_colour).to eq "#9cde0d"
            end
          end

          context 'when invoking the last existing key' do
            let(:reference_name) { :main_text }

            it 'interprets the colour correctly' do
              expect(subject.raw_colour).to eq '#5af8de'
            end
          end
        end

        context 'when referencing another section' do
          let(:section_name)   { :links }
          let(:reference_name) { :main_text }

          context 'when the reference is valid' do
            it 'interprets the colour correctly' do
              expect(subject.raw_colour).to eq '#c05d33'
            end
          end

          context 'when the reference is invalid' do
            let(:reference_name) { :invalid_red }
            it 'raises an UndefinedReference error' do
            expect{ subject }.to raise_exception Fauve::UndefinedReferenceError
            end
          end

          context 'when the reference is circular' do
            let(:reference_name) { :circular_1 }
            it 'raises a CircularReferenceError error' do
            expect{ subject }.to raise_exception Fauve::CircularReferenceError
            end
          end
        end

        context 'when passed incorrect / non-existent references' do
          let(:section_name) { :scheme }

          context 'with integers' do
            let(:reference_name) { 10 }

            it 'raises an UndefinedReference error' do
              expect{ subject }.to raise_exception Fauve::UndefinedReferenceError
            end
          end

          context 'with keys' do
            let(:reference_name) { :a_non_declared_key }

            it 'raises an UndefinedReference error' do
              expect{ subject }.to raise_exception Fauve::UndefinedReferenceError
            end
          end
        end
      end
    end
  end
end
