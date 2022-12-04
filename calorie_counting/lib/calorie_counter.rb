# frozen_string_literal: true

def total_calories(inventory, top_length = 1)
  inventory.split("\n\n").map do |element|
    element.split("\n").map(&:to_i).sum
  end.max(top_length).sum
end
