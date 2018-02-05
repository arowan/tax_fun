require 'spec_helper'
require 'calculator'

describe Calculator::Report do

  describe '.new' do
    it "creates instance of #{described_class.name}" do
      expect(described_class.new(10)).to be_instance_of(described_class)
    end

    context 'income' do
      context 'is nil' do
        it 'throws an ArgumentError' do
          expect{described_class.new(nil)}.to raise_error(ArgumentError)
        end
      end
    end
  end

  describe '#to_s' do
    before do
      allow(Calculator::Tax).to receive(:find_bracket).with(10).and_return(Calculator::Bracket.new(0, 15, 0))
    end
    let(:expected_json) { "{\"income\"=>10, \"tax_rate\"=>0, \"tax_amount\"=>0, \"income_after_tax\"=>10}" }

    context 'income is number' do
      let(:subject) { described_class.new(10) }

      it 'returns report attributes' do
        expect(subject.to_s).to eq(expected_json)
      end
    end

    context 'income is a string' do
      let(:subject) { described_class.new("10") }

      it 'returns report attributes' do
        expect(subject.to_s).to eq(expected_json)
      end
    end
  end

  describe '#to_json' do
    before do
      allow(Calculator::Tax).to receive(:find_bracket).with(10).and_return(Calculator::Bracket.new(0, 15, 0))
    end

    let(:subject) { described_class.new(10) }
    let(:expected_json) { "{\"income\":10,\"tax_rate\":0,\"tax_amount\":0,\"income_after_tax\":10}" }

    it 'returns report attributes as JSON' do
      expect(subject.to_json).to eq(expected_json)
    end
  end

end
