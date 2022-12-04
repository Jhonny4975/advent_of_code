# frozen_string_literal: true

HAND_SHAPE_POINTS = {
  'rock' => 1,
  'paper' => 2,
  'scissor' => 3
}.freeze

WIN_RULE = {
  'rock' => 'paper',
  'paper' => 'scissor',
  'scissor' => 'rock'
}.freeze

require 'pry-byebug'

def total_of_points(encrypted_strategy, part = nil)
  total = 0
  strategy = part ? decrypt_guide(encrypted_strategy) : decrypt_elf_guide(encrypted_strategy)

  strategy.each do |match|
    opponent, player = match

    total += (HAND_SHAPE_POINTS[player] + 3) and next if HAND_SHAPE_POINTS[opponent] == HAND_SHAPE_POINTS[player]
    total += (HAND_SHAPE_POINTS[player] + 6) and next if WIN_RULE[opponent] == player

    total += HAND_SHAPE_POINTS[player]
  end

  total
end

def decrypt_guide(encrypted)
  encrypted.then do |strategy|
    strategy.gsub!(/[AX]/, 'rock')
    strategy.gsub!(/[BY]/, 'paper')
    strategy.gsub!(/[CZ]/, 'scissor')
    strategy.split("\n").map { _1.split(' ') }
  end
end

def decrypt_elf_guide(encrypted)
  encrypted.then do |strategy|
    strategy.gsub!(/(A\sX)/, 'rock scissor')
    strategy.gsub!(/(A\sY)/, 'rock rock')
    strategy.gsub!(/(A\sZ)/, 'rock paper')
    strategy.gsub!(/(B\sX)/, 'paper rock')
    strategy.gsub!(/(B\sY)/, 'paper paper')
    strategy.gsub!(/(B\sZ)/, 'paper scissor')
    strategy.gsub!(/(C\sX)/, 'scissor paper')
    strategy.gsub!(/(C\sY)/, 'scissor scissor')
    strategy.gsub!(/(C\sZ)/, 'scissor rock')
    strategy.split("\n").map { _1.split(' ') }
  end
end
