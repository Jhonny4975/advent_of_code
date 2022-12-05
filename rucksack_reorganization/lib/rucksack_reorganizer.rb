# frozen_string_literal: true

def rucksack_reorganizer(list, part = nil)
  sum_priority_values(check_shared_types(list, part), create_priority_table)
end

def sum_priority_values(shared_types, priority_table)
  [].tap do |priority_values|
    shared_types.each do |type|
      priority_values.push(priority_table[type])
    end
  end.sum
end

def check_shared_types(list, part)
  [].tap do |shared_types|
    list = list.split("\n")

    part ? by_badge(list, shared_types) : by_compartment(list, shared_types)
  end
end

def by_compartment(list, shared_types)
  list.each do |rucksack|
    first_compartment = rucksack.slice(0, (rucksack.length / 2))
    second_compartment = rucksack.slice((rucksack.length / 2), rucksack.length)

    first_compartment.each_char do |char|
      shared_types.push(char) and second_compartment.delete!(char) if second_compartment.count(char).positive?
    end
  end

  shared_types
end

def by_badge(list, shared_types)
  (list.length / 3).times do
    elf_group = list.take(3)
    list.shift(3)

    elf_group.first.chars do |type|
      next if elf_group[1].count(type).zero? || elf_group.last.count(type).zero?

      shared_types.push(type)
      elf_group.last.delete!(type)
    end
  end

  shared_types
end

def create_priority_table
  keys = ('a'..'z').to_a.push(*('A'..'Z').to_a)

  {}.tap do |key, _value|
    keys.each_with_index do |element, index|
      key[element] = index + 1
    end
  end
end
