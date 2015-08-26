require 'spec_helper'

module Monet
  module Parsers

    describe SchemeParser do

      let(:map)   { YAML.load_file File.expand_path("./spec/fixtures/monet.yml") }
      let(:section_name) { :scheme }

      subject { described_class.new( map: map, section_name: section_name, reference_name: reference_name ) }

      describe "#colour" do

        context "when using integers" do

          let(:reference_name) { 0 }

          it 'interprets primary colour correctly' do
            expect(subject.colour).to eq "#131210"
          end

          context "when invoking other integers" do

            let(:reference_name) { 2 }

            it 'interprets colours in the scheme correctly' do
              expect(subject.colour).to eq "#e5b455"
            end
          end

          context "when invoking the last existing integer" do

            let(:reference_name) { 4 }

            it 'interprets the colour correctly' do
              expect(subject.colour).to eq "#d8ccb2"
            end
          end
        end

        context "when using keys" do

          let(:section_name) { :forms }
          let(:reference_name) { :main_bg }

          it 'interprets primary colour correctly' do
            expect(subject.colour).to eq "#f60"
          end

          context "when invoking other keys" do

            let(:reference_name) { :alternate_bg }

            it 'interprets colours in the scheme correctly' do
              expect(subject.colour).to eq "#9cde0d"
            end
          end

          context 'when invoking the last existing key' do

            let(:reference_name) { :main_text }

            it 'interprets the colour correctly' do
              expect(subject.colour).to eq '#5af8de'
            end
          end
        end

        context 'when referencing another section' do
          let(:section_name)   { :links }
          let(:reference_name) { :main_text }

          context 'when the reference is valid' do
            it 'interprets the colour correctly' do
              expect(subject.colour).to eq '#c05d33'
            end
          end

          context 'when the reference is invalid' do
            let(:reference_name) { :invalid_red }
            it 'raises an UndefinedReference error' do
            expect{ subject }.to raise_exception Monet::UndefinedReferenceError
            end
          end

          context 'when the reference is circular' do
            let(:reference_name) { :circular_1 }
            it 'raises a CircularReferenceError error' do
            expect{ subject }.to raise_exception Monet::CircularReferenceError
            end
          end
        end

        context 'when passed incorrect / non-existent references' do

          let(:section_name) { :scheme }

          context 'with integers' do
            let(:reference_name) { 10 }

            it 'raises an UndefinedReference error' do
              expect{ subject }.to raise_exception Monet::UndefinedReferenceError
            end
          end

          context 'with keys' do

            let(:reference_name) { :a_non_declared_key }

            it 'raises an UndefinedReference error' do
              expect{ subject }.to raise_exception Monet::UndefinedReferenceError
            end
          end
        end
      end
    end
  end
end
