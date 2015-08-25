require 'spec_helper'

describe Monet::SchemeParser do

  let(:colour_scheme) { YAML.load_file File.expand_path("./spec/fixtures/monet.yml") }
  let(:section) { :section1 }

  subject { described_class.new( colour_scheme: colour_scheme, section: section, reference: reference ) }

  describe "#colour" do

    context "when using ordinals" do

      let(:reference) { :primary }

      it 'interprets primary colour correctly' do
        expect(subject.colour).to eq "#ff69b3"
      end

      context "when invoking other ordinals" do

        let(:reference) { :quaternary }

        it 'interprets colours in the scheme correctly' do
          expect(subject.colour).to eq "#00ffee"
        end
      end

      context "when invoking the last existing ordinal" do

        let(:reference) { :nonary }

        it 'interprets the colour correctly' do
          expect(subject.colour).to eq "#0069d6"
        end
      end

    end


    context "when using integers" do

      let(:reference) { 1 }

      it 'interprets primary colour correctly' do
        expect(subject.colour).to eq "#ff69b3"
      end

      context "when invoking other ordinals" do

        let(:reference) { 7 }

        it 'interprets colours in the scheme correctly' do
          expect(subject.colour).to eq "#3f4549"
        end
      end

      context "when invoking the last existing ordinal" do

        let(:reference) { 9 }

        it 'interprets the colour correctly' do
          expect(subject.colour).to eq "#0069d6"
        end
      end

    end


    context "when using keys" do

      let(:section) { :section2 }
      let(:reference) { :a_key }

      it 'interprets primary colour correctly' do
        expect(subject.colour).to eq "#cff535"
      end

      context "when invoking other ordinals" do

        let(:reference) { :another_key }

        it 'interprets colours in the scheme correctly' do
          expect(subject.colour).to eq "#80b601"
        end
      end

      context "when invoking the last existing ordinal" do

        let(:reference) { :yet_another_key }

        it 'interprets the colour correctly' do
          expect(subject.colour).to eq "#53a2de"
        end
      end

    end

    context 'when passed incorrect / non-existent references' do

      let(:section) { :section1 }
      let(:reference) { :denary }

      context "with ordinals" do

        it 'raises an UndefinedReference error' do
          expect{ subject }.to raise_exception Monet::UndefinedReferenceError
        end

      end

      context "with integers" do

        let(:reference) { 10 }

        it 'raises an UndefinedReference error' do
          expect{ subject }.to raise_exception Monet::UndefinedReferenceError
        end

      end

      context "with keys" do

        let(:reference) { :a_non_declared_key }

        it 'raises an UndefinedReference error' do
          expect{ subject }.to raise_exception Monet::UndefinedReferenceError
        end

      end


    end

  end

end
