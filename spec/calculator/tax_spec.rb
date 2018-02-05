require 'spec_helper'
require 'calculator'

describe Calculator::Tax do

  describe '#find_bracket' do
    context 'income is below 11,500' do
      let(:expected_backet) { Calculator::Bracket.new(nil, 11_500, 0) }
      it 'returns Calculator::Bracket object' do
        expect(described_class.find_bracket(10_000)).to eq(expected_backet)
      end
    end

    context 'income is above 11,500' do
      let(:expected_backet) { Calculator::Bracket.new(11_501, 45_000, 20) }
      it 'returns Calculator::Bracket object' do
        expect(described_class.find_bracket(13_000)).to eq(expected_backet)
      end
    end

    context 'income is above 45,000' do
      let(:expected_backet) { Calculator::Bracket.new(45_001, 150_000, 40) }
      it 'returns Calculator::Bracket object' do
        expect(described_class.find_bracket(46_000)).to eq(expected_backet)
      end
    end

    context 'income is above 150,000' do
      let(:expected_backet) { Calculator::Bracket.new(150_000, nil, 45) }
      it 'returns Calculator::Bracket object' do
        expect(described_class.find_bracket(150_000)).to eq(expected_backet)
      end
    end
  end
end
