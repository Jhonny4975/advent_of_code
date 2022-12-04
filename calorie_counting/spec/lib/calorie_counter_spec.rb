# frozen_string_literal: true

require 'spec_helper'
require 'calorie_counter'
require_relative '../support/supplements_inventory'

describe 'Day 1: Calorie Counting' do
  describe 'Part one' do
    include SupplementsInventory

    context 'with example list' do
      it 'should return the highest amount of total calories' do
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

    context 'with my puzzle input' do
      it 'should return the highest amount of total calories' do
        expect(total_calories(SupplementsInventory::INVENTORY)).to eq(69_528)
      end
    end
  end

  describe 'Part two' do
    include SupplementsInventory

    context 'with example list' do
      it 'should return to the three highest total calories' do
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

    context 'with my puzzle input' do
      it 'should return to the three highest total calories' do
        expect(total_calories(SupplementsInventory::INVENTORY, 3)).to eq(206_152)
      end
    end
  end
end
