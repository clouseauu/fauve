# require_relative './test_helper'

# describe Monet::SchemeParser do

#   let(:colour_scheme) { YAML.load_file File.expand_path("./test/fixtures/monet.yml") }

#   it 'is the right colour as determined by section and ordinal' do
#     monet.colour.to_s.should == "#ff69b3"
#   end

#   context 'when passed incorrect / non-existent sections or ordinals' do

#     let(:sass_context) { Sass::Script::Functions::EvaluationContext.new( Sass::Environment.new ) }

#     it 'raises an UndefinedSection error if it does not recognise the section' do
#       expect { Monet::Engine.new(
#                 sass_context: sass_context,
#                 colour_scheme: colour_scheme,
#                 section: "cartman",
#                 reference: "primary")
#       }.to raise_exception Monet::UndefinedSectionError
#     end

#     it 'raises an UndefinedOrdinal error if it does not recognise the ordinal' do
#       expect { Monet::Engine.new(
#                 sass_context: sass_context,
#                 colour_scheme: colour_scheme,
#                 section: "section1",
#                 reference: "nonononogenary")
#       }.to raise_exception Monet::UndefinedOrdinalError
#     end

#   end

# end
