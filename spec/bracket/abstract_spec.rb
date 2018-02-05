require 'spec_helper'
require 'calculate'

describe Bracket::Abstract do
  describe '.new' do
    it "creates instance of #{described_class.name}" do
      expect(described_class.new(1, 2, nil)).to be_instance_of(described_class)
    end

    describe '#percent' do
      context 'is nil' do
        let(:subject) { described_class.new(nil, 10, nil) }

        it 'has a lower limit of zero' do
          expect(subject.percent).to eq(0)
        end
      end
      context 'has value' do
        let(:percent) { 20 }
        let(:subject) { described_class.new(1, 10, percent) }

        it 'has a percent varible' do
          expect(subject.percent).to eq(percent)
        end
      end
    end

    describe '#lower_limit' do
      context 'is nil' do
        let(:subject) { described_class.new(nil, 10, nil) }

        it 'has a lower limit of zero' do
          expect(subject.lower_limit).to eq(0)
        end
      end
      context 'has value' do
        let(:lower_limit) { 123 }
        let(:subject) { described_class.new(lower_limit, 10, nil) }

        it 'has a lower_limit varible' do
          expect(subject.lower_limit).to eq(lower_limit)
        end
      end
    end

    describe '#upper_limit' do
      context 'is nil' do
        let(:subject) { described_class.new(1, nil, nil) }

        it 'has a upper_limit limit of nil' do
          expect(subject.upper_limit).to eq(nil)
        end
      end
      context 'has value' do
        let(:upper_limit) { 123 }
        let(:subject) { described_class.new(1, upper_limit, nil) }

        it 'has a upper_limit varible' do
          expect(subject.upper_limit).to eq(upper_limit)
        end
      end
    end

    describe '#allowence' do
      context 'is nil' do
        let(:subject) { described_class.new(1, nil, nil, nil) }

        it 'has a allowence limit of 0' do
          expect(subject.allowence).to eq(0)
        end
      end
      context 'has value' do
        let(:allowence) { 123 }
        let(:subject) { described_class.new(1, nil, nil, allowence) }

        it 'has a allowence varible' do
          expect(subject.allowence).to eq(allowence)
        end
      end
    end
  end

  describe '#calculate_tax' do
    context 'all varibles set' do
      let(:subject) { described_class.new(50, 1000, 10) }

      it 'returns amount of tax due' do
        expect(subject.calculate_tax(800)).to eq(75.0)
      end

      it 'returns correct amount of tax' do
        expect(subject.calculate_tax(1100)).to eq(95.0)
      end
    end
    context 'upper_limit not set' do
      let(:subject) { described_class.new(50, nil, 10) }

      it 'returns amount of tax due' do
        expect(subject.calculate_tax(800)).to eq(75.0)
      end
    end
  end

  describe '#in_bracket?' do
    let(:subject) { described_class.new(5, 10, nil) }
    context 'value is above lower and value is below upper' do
      it 'returns true' do
        expect(subject.in_bracket?(6)).to be(true)
      end
    end
    context 'value is below lower limit' do
      it 'returns false' do
        expect(subject.in_bracket?(2)).to be(false)
      end
    end
    context 'value is above upper limit' do
      it 'returns true' do
        expect(subject.in_bracket?(30)).to be(true)
      end
    end

    context 'value is on lower limit' do
      it 'returns false' do
        expect(subject.in_bracket?(5)).to be(true)
      end
    end

    context 'upper_limit is nil and value is above lower_limit' do
      let(:subject) { described_class.new(5, nil, nil) }
      it 'returns true' do
        expect(subject.in_bracket?(30)).to be(true)
      end
    end

  end
end
