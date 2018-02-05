require 'spec_helper'
require 'calculate'
require 'bracket'
require 'faker'

describe Calculate::Tax do

  describe '#tax_and_allowance' do

    context 'personal allowence' do
      let(:income) { 9000 }
      let(:expected_tax_and_allowence) { [0, 11500] }
      it 'returns tax and allowence object' do
        expect(described_class.tax_and_allowance(income)).to eq(expected_tax_and_allowence)
      end
    end

    context 'basic' do
      let(:income) { 25000 }
      let(:expected_tax_and_allowence) { [2698.2, 11500] }
      it 'returns tax and allowence object' do
        expect(described_class.tax_and_allowance(income)).to eq(expected_tax_and_allowence)
      end
    end
    #
    context 'higher' do
      let(:income) { 120_000 }
      let(:expected_tax_and_allowence) { [40696.4, 1500] }
      it 'returns tax and allowence object' do
        expect(described_class.tax_and_allowance(income)).to eq(expected_tax_and_allowence)
      end
    end

    context 'additional' do
      let(:income) { 180_000 }
      let(:expected_tax_and_allowence) { [66800, 0] }
      it 'returns tax and allowence object' do
        expect(described_class.tax_and_allowance(income)).to eq(expected_tax_and_allowence)
      end
    end
  end
end
