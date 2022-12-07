# frozen_string_literal: true

require 'pry-byebug'

def sections_list_checker(list, part = nil)
  list = list.split("\n").map { |pairs| pairs.split(',') }
  count = []

  list.each do |pairs|
    pairs.each_cons(2) do |first_range, second_range|
      count << 1 and next if part && part_two_check(first_range.scan(/\d+/), second_range.scan(/\d+/))

      count << 1 if part_one_check(first_range.scan(/\d+/), second_range.scan(/\d+/))
    end
  end

  count.sum
end

def part_one_check(first_range, second_range)
  first_id, second_id = first_range
  section, other_section = second_range

  (first_id..second_id).include?(section) && (first_id..second_id).include?(other_section) ||
    (section..other_section).include?(first_id) && (section..other_section).include?(second_id)
end

def part_two_check(first_range, second_range)
  first_id, second_id = first_range
  section, other_section = second_range

  (first_id..second_id).include?(section) || (first_id..second_id).include?(other_section) ||
    (section..other_section).include?(first_id) || (section..other_section).include?(second_id)
end
