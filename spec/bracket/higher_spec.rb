require 'spec_helper'
require 'calculate'

describe Bracket::Higher do

  describe '#allowence' do
    context 'is influenced by income' do
      context '123_000' do
        it 'has a allowence limit of 0' do
          expect(subject.allowence(123_000)).to eq(0)
        end
      end

      context '65_000' do
        it 'has a allowence limit of 6500' do
          expect(subject.allowence(65_000)).to eq(11_500)
        end
      end

      context '120_000' do
        it 'has a allowence limit of 6500' do
          expect(subject.allowence(120_000)).to eq(1500)
        end
      end

      context '110_000' do
        it 'has a allowence limit of 6500' do
          expect(subject.allowence(110_000)).to eq(6_500)
        end
      end
    end
  end

end
