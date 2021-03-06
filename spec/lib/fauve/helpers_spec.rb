require 'spec_helper'

module Sass
  module Script
    describe Functions do

      let(:section)   { :scheme }
      let(:filters)   { [] }
      let(:reference) { 3 }

      subject { FauveFunction.new }

      describe '#fauve' do
        it 'returns a Sass colour' do
          expect(subject.fauve(section, reference)).to be_a Sass::Script::Value::Color
        end

        it 'returns the right colour' do
          colour = subject.fauve(section, reference)
          colour.options = {}
          expect(colour.to_s).to eq '#3c8399'
        end

      end
    end
  end
end

# Dummy class for testing the module
class FauveFunction; include Sass::Script::Functions; end