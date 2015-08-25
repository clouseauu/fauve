require 'spec_helper'

module Monet
  module Parsers

    describe ReferenceParser do

      describe '.parse' do

        context 'when the reference is numeric' do

          let(:original_reference) { '1' }

          it 'returns an integer' do
            expect( described_class.parse(original_reference) ).to eq 1
          end
        end

        context 'when the reference is a key' do

          context 'with an invalid key' do

            let(:original_reference) { 'like oh my god yo!' }

            it 'raises an InvalidReferenceError error' do
              expect{ described_class.parse(original_reference) }.to raise_exception Monet::InvalidReferenceError
            end
          end

          context 'with a valid string key' do

            let(:original_reference) { 'a_valid_key' }

            it 'returns the key' do
              expect( described_class.parse(original_reference) ).to eq 'a_valid_key'
            end
          end
        end
      end
    end
  end
end