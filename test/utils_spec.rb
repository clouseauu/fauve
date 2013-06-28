require_relative './test_helper'

describe 'Monet Utilities Class' do

  let(:sass_context) { Sass::Script::Functions::EvaluationContext.new({}) }
  let(:amount) { Sass::Script::Number.new(20) }
  let(:colour_scheme) { { "app" => ["#aa4617", "#e1b261"], "body" => ["#8e4162", "#5e7629"] } }

  let(:monet) { Monet::Utils.new(
    sass_context: sass_context,
    colour_scheme: colour_scheme,
    section: "app",
    ordinal: "primary")
  }

  before :each do
    monet.colour.options = {}
  end

  it 'returns a base colour in the form of a SASS colour object' do
    monet.colour.should be_an_instance_of Sass::Script::Color
  end

  it 'is the right colour as determined by section and ordinal' do
    monet.colour.to_s.should == "#aa4617"
  end

  it 'applies filters and return the correct colour' do
    filtered_monet = Monet::Utils.new(sass_context: sass_context, colour_scheme: colour_scheme, section: "app", ordinal: "primary", filters: { "lighten" => amount, "saturate" => amount } )
    filtered_monet.colour.options = {}
    filtered_monet.colour.to_s.should == "#fb6e2c"
  end

  context 'when passed incorrect / non-existent sections or ordinals' do

    let(:sass_context) { Sass::Script::Functions::EvaluationContext.new({}) }
    let(:colour_scheme) { { "app" => ["#aa4617"], "body" => ["#8e4162"] } }

    it 'raises an UndefinedSection error if it does not recognise the section' do
      expect { Monet::Utils.new(
                sass_context: sass_context,
                colour_scheme: colour_scheme,
                section: "cartman",
                ordinal: "primary")
      }.to raise_exception Monet::UndefinedSectionError
    end

    it 'raises an UndefinedOrdinal error if it does not recognise the ordinal' do
      expect { Monet::Utils.new(
                sass_context: sass_context,
                colour_scheme: colour_scheme,
                section: "app",
                ordinal: "nonononogenary")
      }.to raise_exception Monet::UndefinedOrdinalError
    end

  end

end
