require 'spec_helper'
require 'calculate'

describe Calculate::Report do

  context 'income 9000' do
    let(:expected_report) do
      {"income"=>9000, "tax_free_allowence"=>11500, "taxable_income"=>-2500, "tax_amount"=>0.0, "income_after_tax"=>9000.0}
    end

    let(:subject) { described_class.new(9000) }
    it 'generates a report that matches' do
      expect(subject).to eq(expected_report)
    end
  end

  context 'income 25000' do
    let(:expected_report) do
      {"income"=>25000, "tax_free_allowence"=>11500, "taxable_income"=>13500, "tax_amount"=>2699.8, "income_after_tax"=>22300.2}
    end

    let(:subject) { described_class.new(25000) }
    it 'generates a report that matches' do
      expect(subject).to eq(expected_report)
    end
  end

  context 'income 65000' do
    let(:expected_report) do
      {"income"=>65000, "tax_free_allowence"=>11500, "taxable_income"=>53500, "tax_amount"=>14699.400000000001, "income_after_tax"=>50300.6}
    end

    let(:subject) { described_class.new(65000) }
    it 'generates a report that matches' do
      expect(subject).to eq(expected_report)
    end
  end

  context 'income 165000' do
    let(:expected_report) do
      {"income"=>165000, "tax_free_allowence"=>0, "taxable_income"=>165000, "tax_amount"=>55449.4, "income_after_tax"=>109550.6}
    end

    let(:subject) { described_class.new(165000) }
    it 'generates a report that matches' do
      expect(subject).to eq(expected_report)
    end
  end

end
