# frozen_string_literal: false

require 'spec_helper'
require 'sections_list_checker'
require_relative '../support/sections_list'

describe 'Day 4: Camp Cleanup' do
  describe 'Part one' do
    context 'with example section list' do
      it 'should return how many assignment pairs does one range fully contain the other' do
        list = <<~STRING
          2-4,6-8
          2-3,4-5
          5-7,7-9
          2-8,3-7
          6-6,4-6
          2-6,4-8
        STRING

        expect(sections_list_checker(list)).to eq(2)
      end
    end

    context 'with my puzzle input' do
      it 'should return how many assignment pairs does one range fully contain the other' do
        expect(sections_list_checker(SectionsList.list)).to eq(462)
      end
    end
  end

  describe 'Part two' do
    context 'with example section list' do
      it 'should return on how many pairs of assignments do the ranges overlap' do
        list = <<~STRING
          2-4,6-8
          2-3,4-5
          5-7,7-9
          2-8,3-7
          6-6,4-6
          2-6,4-8
        STRING

        expect(sections_list_checker(list, 'two')).to eq(4)
      end
    end

    context 'with my puzzle input' do
      it 'should return on how many pairs of assignments do the ranges overlap' do
        expect(sections_list_checker(SectionsList.list, 'two')).to eq(835)
      end
    end
  end
end
