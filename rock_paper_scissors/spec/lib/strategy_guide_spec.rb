# frozen_string_literal: false

require 'spec_helper'
require 'strategy_guide'
require_relative '../support/encrypted_strategy'

describe 'Day 2: Rock Paper Scissors' do
  describe 'Part one' do
    context 'with example strategy' do
      it 'should return the total score obtained' do
        strategy = <<~STRING
          A Y
          B X
          C Z
        STRING

        expect(total_of_points(strategy, 'one')).to eq(15)
      end
    end

    context 'with my puzzle input' do
      it 'should return the total score obtained' do
        expect(total_of_points(EncryptedStrategy.strategy_guide, 'one')).to eq(13_682)
      end
    end
  end

  describe 'Part two' do
    context 'with example strategy' do
      it 'should return the total score obtained' do
        strategy = <<~STRING
          A Y
          B X
          C Z
        STRING

        expect(total_of_points(strategy)).to eq(12)
      end
    end

    context 'with my puzzle input' do
      it 'should return the total score obtained' do
        expect(total_of_points(EncryptedStrategy.strategy_guide)).to eq(12_881)
      end
    end
  end
end
