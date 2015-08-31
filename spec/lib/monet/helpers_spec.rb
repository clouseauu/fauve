require 'spec_helper'

module Sass
  module Script
    describe Functions do

      let(:config)    { YAML.load_file File.expand_path("./spec/fixtures/monet.yml") }
      let(:section)   { :scheme }
      let(:filters)   { Hash.new }
      let(:reference) { 3 }

      before do
        allow(Monet::Config).to receive(:colour_map).and_return(config)
      end

      subject { MonetFunction.new }

      describe '#monet' do
        it 'returns a Sass colour' do
          expect(subject.monet(section, reference)).to be_a Sass::Script::Value::Color
        end

        it 'returns the right colour' do
          colour = subject.monet(section, reference)
          colour.options = {}
          expect(colour.to_s).to eq '#3c8399'
        end

      end
    end
  end
end

# Dummy class for testing the module
class MonetFunction; include Sass::Script::Functions; end