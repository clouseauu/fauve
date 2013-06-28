require_relative './test_helper'

describe 'Monet Utilities Class' do
  # 1. intitialize - create a correct instance of the utils class
  # 2. check for the colours
  # 3. apply some filters
  # 4. check for the colours
  # 5. create an incorrect instance
  # 6. check for exceptions

  let(:sass_context) { Sass::Script::Functions::EvaluationContext.new({}) }
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

  it 'should return a base colour in the form of a SASS colour object' do
    monet.colour.should be_an_instance_of Sass::Script::Color
  end

  it 'should be the right colour as determined by section and ordinal' do
    monet.colour.to_s.should == "#aa4617"
  end

  context "when applying some filters" do
  end


end
