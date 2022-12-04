# frozen_string_literal: true

require 'spec_helper'
require 'calorie_counter'
require_relative '../support/supplements_inventory'

describe 'Day 1: Calorie Counting' do
  describe 'finding the elf with the most calories' do
    include SupplementsInventory

    context 'when the list of elves is simple' do
      it 'should return how many total calories that student is carrying' do
        inventory = <<~STRING
          1000
          2000
          3000

          4000

          5000
          6000

          7000
          8000
          9000

          10000
        STRING

        expect(total_calories(inventory)).to eq(24_000)
      end
    end

    context 'when the list of elves is big' do
      it 'should return how many total calories that student is carrying' do
        expect(total_calories(SupplementsInventory::INVENTORY)).to eq(69_528)
      end
    end
  end

  describe 'finding the top three elves with the most calories' do
    include SupplementsInventory

    context 'when the list of elves is simple' do
      it 'should return how many calories the elves are carrying in total' do
        inventory = <<~STRING
          1000
          2000
          3000

          4000

          5000
          6000

          7000
          8000
          9000

          10000
        STRING

        expect(total_calories(inventory, 3)).to eq(45_000)
      end
    end

    context 'when the list of elves is big' do
      it 'should return how many calories the elves are carrying in total' do
        expect(total_calories(SupplementsInventory::INVENTORY, 3)).to eq(206_152)
      end
    end
  end
end
