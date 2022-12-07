# frozen_string_literal: true

require 'pry-byebug'

def sections_list_checker(list, part = nil)
  list = list.split("\n").map { |pairs| pairs.split(',') }

  [].tap do |count|
    list.each { |pairs| part ? part_two_check(pairs, count) : part_one_check(pairs, count) }
  end.sum
end

def part_one_check(pairs, count)
  pairs.each_cons(2) do |first_range, second_range|
    first_id, second_id = first_range.scan(/\d+/)
    section, other_section = second_range.scan(/\d+/)

    has_shared_sections =
      (first_id..second_id).include?(section) && (first_id..second_id).include?(other_section) ||
      (section..other_section).include?(first_id) && (section..other_section).include?(second_id)

    count << 1 if has_shared_sections
  end

  count
end

def part_two_check(pairs, count)
  pairs.each_cons(2) do |first_range, second_range|
    first_id, second_id = first_range.scan(/\d+/)
    section, other_section = second_range.scan(/\d+/)

    has_shared_sections =
      (first_id..second_id).include?(section) || (first_id..second_id).include?(other_section) ||
      (section..other_section).include?(first_id) || (section..other_section).include?(second_id)

    count << 1 if has_shared_sections
  end

  count
end
