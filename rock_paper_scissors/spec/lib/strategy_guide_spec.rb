# frozen_string_literal: false

require 'spec_helper'
require 'strategy_guide'
require_relative '../support/encrypted_strategy'

describe 'Strategy Guide' do
  describe 'part one' do
    context 'when the strategy guide is simple' do
      it 'should return the total score obtained' do
        strategy = <<~STRING
          A Y
          B X
          C Z
        STRING

        expect(total_of_points(strategy, 'one')).to eq(15)
      end

      it 'should return the total score obtained' do
        strategy = <<~STRING
          C Z
          C Z
          C Y
          C Z
          C Z
          C Z
          A X
          A X
          C X
          C X
        STRING

        expect(total_of_points(strategy, 'one')).to eq(54)
      end
    end

    context 'when the strategy guide is big' do
      it 'should return the total score obtained' do
        expect(total_of_points(EncryptedStrategy.strategy_guide, 'one')).to eq(13_682)
      end
    end
  end

  describe 'part two' do
    context 'when the strategy guide is simple' do
      it 'should return the total score obtained' do
        strategy = <<~STRING
          A Y
          B X
          C Z
        STRING

        expect(total_of_points(strategy)).to eq(12)
      end

      it 'should return the total score obtained' do
        strategy = <<~STRING
          C Z
          C Z
          C Y
          C Z
          C Z
          C Z
          A X
          A X
          C X
          C X
        STRING

        expect(total_of_points(strategy)).to eq(51)
      end
    end

    context 'when the strategy guide is big' do
      it 'should return the total score obtained' do
        expect(total_of_points(EncryptedStrategy.strategy_guide)).to eq(12_881)
      end
    end
  end
end
