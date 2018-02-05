require 'spec_helper'
require 'calculator'

describe Calculator::Tax do

  describe '.new' do
    it "creates instance of #{described_class.name}" do
      expect(described_class.new(1)).to be_instance_of(described_class)
    end

    describe '#income' do
      let(:income) { 123 }
      let(:subject) { described_class.new(income) }

      it 'has a income varible' do
        expect(subject.income).to eq(income)
      end
    end
  end

  describe '#tax_rate' do
    context 'income is below 11,500' do
      let(:subject) { described_class.new(10_000) }
      let(:expected_backet) { Calculator::Bracket.new(nil, 11_500, 0) }
      it 'returns Calculator::Bracket object' do
        expect(subject.tax_rate).to eq(expected_backet)
      end
    end

    context 'income is above 11,500' do
      let(:subject) { described_class.new(13_000) }
      let(:expected_backet) { Calculator::Bracket.new(11_501, 45_000, 20) }
      it 'returns Calculator::Bracket object' do
        expect(subject.tax_rate).to eq(expected_backet)
      end
    end

    context 'income is above 45,000' do
      let(:subject) { described_class.new(46_000) }
      let(:expected_backet) { Calculator::Bracket.new(45_001, 150_000, 40) }
      it 'returns Calculator::Bracket object' do
        expect(subject.tax_rate).to eq(expected_backet)
      end
    end

    context 'income is above 150,000' do
      let(:subject) { described_class.new(150_000) }
      let(:expected_backet) { Calculator::Bracket.new(150_000, nil, 45) }
      it 'returns Calculator::Bracket object' do
        expect(subject.tax_rate).to eq(expected_backet)
      end
    end
  end
end
