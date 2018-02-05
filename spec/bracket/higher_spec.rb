require 'spec_helper'
require 'calculate'

describe Bracket::Higher do

  describe '#allowence' do
    context 'is influenced by income' do
      let(:subject) { described_class.new }

      context '123_000' do
        before do
          subject.in_bracket?(123_000)
        end

        it 'has a allowence limit of 0' do
          expect(subject.allowence).to eq(0)
        end
      end

      context '65_000' do
        before do
          subject.in_bracket?(65_000)
        end

        it 'has a allowence limit of 6500' do
          expect(subject.allowence).to eq(11_500)
        end
      end

      context '120_000' do
        before do
          subject.in_bracket?(120_000)
        end

        it 'has a allowence limit of 6500' do
          expect(subject.allowence).to eq(1500)
        end
      end

      context '110_000' do
        before do
          subject.in_bracket?(110_000)
        end

        it 'has a allowence limit of 6500' do
          expect(subject.allowence).to eq(6_500)
        end
      end
    end
  end

end
