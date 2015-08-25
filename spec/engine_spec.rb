require 'spec_helper'

describe Monet::Engine do

  let(:sass_context) { Sass::Script::Functions::EvaluationContext.new( Sass::Environment.new ) }
  let(:amount) { Sass::Script::Number.new(20) }
  let(:filters) { }
  let(:raw_colour) { "#ff69b3" }

  let(:monet) { Monet::Engine.new(
    sass_context: sass_context,
    filters: filters,
    raw_colour: raw_colour)
  }

  before :each do
    monet.colour.options = {}
  end

  describe "#colour" do

    it 'returns a base colour in the form of a SASS colour object' do
      expect(monet.colour).to be_an_instance_of Sass::Script::Color
    end

    context "when applied filters" do

      let(:filters) { { "lighten" => amount, "saturate" => amount } }

      it 'applies said filters and returns the correct colour' do
        expect(monet.colour.to_s).to eq "#ffcfe7"
      end

    end

  end

end