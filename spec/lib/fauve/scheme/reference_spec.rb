require 'spec_helper'

module Fauve
  module Scheme
    describe Reference do

      subject { described_class.new(reference_name) }

      describe '#key' do

        context 'when the reference is numeric' do
          let(:reference_name) { '1' }

          it 'returns an integer' do
            expect( subject.key ).to eq 1
          end
        end

        context 'when the reference is a key' do

          context 'with an invalid key' do
            let(:reference_name) { 'like oh my god yo!' }

            it 'raises an InvalidReferenceError error' do
              expect{ subject.key }.to raise_exception Fauve::InvalidReferenceError
            end
          end

          context 'with a valid symbol key' do
            let(:reference_name) { :a_valid_key }

            it 'returns the key' do
              expect( subject.key ).to eq 'a_valid_key'
            end
          end

          context 'with a valid string key' do
            let(:reference_name) { 'another_valid_key' }

            it 'returns the key' do
              expect( subject.key ).to eq 'another_valid_key'
            end
          end
        end
      end
    end
  end
end