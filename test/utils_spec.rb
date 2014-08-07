require_relative './test_helper'

describe 'Monet Engine Class' do

  let(:sass_context) { Sass::Script::Functions::EvaluationContext.new( Sass::Environment.new ) }
  let(:amount) { Sass::Script::Number.new(20) }
  let(:colour_scheme) { YAML.load_file File.expand_path("./test/fixtures/monet.yml") }

  let(:monet) { Monet::Engine.new(
    sass_context: sass_context,
    colour_scheme: colour_scheme,
    section: "section1",
    reference: "primary")
  }

  before :each do
    monet.colour.options = {}
  end

  it 'returns a base colour in the form of a SASS colour object' do
    monet.colour.should be_an_instance_of Sass::Script::Color
  end

  it 'is the right colour as determined by section and ordinal' do
    monet.colour.to_s.should == "#ff69b3"
  end

  it 'applies filters and returns the correct colour' do
    filtered_monet = Monet::Engine.new(sass_context: sass_context, colour_scheme: colour_scheme, section: "section1", reference: "primary", filters: { "lighten" => amount, "saturate" => amount } )
    filtered_monet.colour.options = {}
    filtered_monet.colour.to_s.should == "#ffcfe7"
  end

  context 'when passed incorrect / non-existent sections or ordinals' do

    let(:sass_context) { Sass::Script::Functions::EvaluationContext.new( Sass::Environment.new ) }

    it 'raises an UndefinedSection error if it does not recognise the section' do
      expect { Monet::Engine.new(
                sass_context: sass_context,
                colour_scheme: colour_scheme,
                section: "cartman",
                reference: "primary")
      }.to raise_exception Monet::UndefinedSectionError
    end

    it 'raises an UndefinedOrdinal error if it does not recognise the ordinal' do
      expect { Monet::Engine.new(
                sass_context: sass_context,
                colour_scheme: colour_scheme,
                section: "section1",
                reference: "nonononogenary")
      }.to raise_exception Monet::UndefinedOrdinalError
    end

  end

end
