require 'spec_helper'
require 'calculator'

describe Calculator::Bracket do
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
  end

  describe '#to_json' do
    let(:subject) { described_class.new(1,2,3) }
    let(:expected_json) { "{\"lower_limit\":1,\"upper_limit\":2,\"percent\":3}" }
    it 'returns attributes as JSON' do
      expect(subject.to_json).to eq(expected_json)
    end
  end

  describe '.==' do
    let(:subject) { described_class.new(1,2,3) }
    let(:subject_clone) { described_class.new(1,2,3) }
    it 'returns true when both attributes match between instances' do
      expect(subject == subject_clone).to be(true)
    end
  end

  describe '#in_bracket?' do
    let(:subject) { described_class.new(5, 10, nil) }
    context 'value is above lower and value is below upper' do
      it 'returns true' do
        expect(subject.in_bracket?(6)).to be(true)
      end
    end
    context 'value is below lower' do
      it 'returns false' do
        expect(subject.in_bracket?(2)).to be(false)
      end
    end
    context 'value is above upper' do
      it 'returns false' do
        expect(subject.in_bracket?(30)).to be(false)
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
