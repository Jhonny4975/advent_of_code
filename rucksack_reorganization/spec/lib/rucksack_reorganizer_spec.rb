# frozen_string_literal: false

require 'spec_helper'
require 'rucksack_reorganizer'
require_relative '../support/rucksack_list'

describe 'Day 3: Rucksack Reorganization' do
  describe 'Part one' do
    context 'with example list of contents' do
      it 'should return the sum of priorities of item types' do
        list = <<~STRING
          vJrwpWtwJgWrhcsFMMfFFhFp
          jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
          PmmdzqPrVvPwwTWBwg
          wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
          ttgJtRGJQctTZtZT
          CrZsJsPPZsGzwwsLwLmpwMDw
        STRING

        expect(rucksack_reorganizer(list)).to eq(157)
      end
    end

    context 'with my puzzle input' do
      it 'should return the sum of priorities of item types' do
        expect(rucksack_reorganizer(RucksackList.list)).to eq(7_824)
      end
    end
  end

  describe 'Part two' do
    context 'with example list of contents' do
      it 'must return the sum of the priorities of the insignia of each group of three Elves' do
        list = <<~STRING
          vJrwpWtwJgWrhcsFMMfFFhFp
          jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
          PmmdzqPrVvPwwTWBwg
          wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
          ttgJtRGJQctTZtZT
          CrZsJsPPZsGzwwsLwLmpwMDw
        STRING

        expect(rucksack_reorganizer(list, 'two')).to eq(70)
      end
    end

    context 'with my puzzle input' do
      it 'must return the sum of the priorities of the insignia of each group of three Elves' do
        expect(rucksack_reorganizer(RucksackList.list, 'two')).to eq(2_798)
      end
    end
  end
end
