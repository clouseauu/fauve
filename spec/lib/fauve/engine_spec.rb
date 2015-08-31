require 'spec_helper'

describe Fauve::Engine do

  let(:sass_context) { Sass::Script::Functions::EvaluationContext.new( Sass::Environment.new ) }
  let(:amount) { Sass::Script::Number.new(20) }
  let(:filters) { Hash.new }
  let(:raw_colour) { "#ff69b3" }

  let(:engine) { Fauve::Engine.new(
    context: sass_context,
    raw_colour: raw_colour,
    filters: filters
    )
  }

  before :each do
    engine.colour.options = {}
  end

  describe "#colour" do

    it 'returns a base colour in the form of a SASS colour object' do
      expect(engine.colour).to be_an_instance_of Sass::Script::Color
    end

    context "when applied filters" do

      let(:filters) { { "lighten" => amount, "saturate" => amount } }

      it 'applies said filters and returns the correct colour' do
        expect(engine.colour.to_s).to eq "#ffcfe7"
      end

    end

  end

end