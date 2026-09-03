#!/usr/bin/env ruby
# Two-Guard Riddle Algorithm - Ruby implementation

def choose_correct_door(asked_is_truthful, correct_door)
  other_is_truthful = !asked_is_truthful

  other_says = if other_is_truthful
    correct_door
  else
    correct_door == "Door A" ? "Door B" : "Door A"
  end

  asked_says = if asked_is_truthful
    other_says
  else
    other_says == "Door A" ? "Door B" : "Door A"
  end

  asked_says == "Door A" ? "Door B" : "Door A"
end

puts "=== Two-Guard Riddle Algorithm (Ruby) ==="
puts ""

tests = [
  [false, "Door B", "Door B is safe, asked Guard = Liar"],
  [true,  "Door A", "Door A is safe, asked Guard = Truth-teller"],
  [false, "Door A", "Door A is safe, asked Guard = Liar"],
  [true,  "Door B", "Door B is safe, asked Guard = Truth-teller"],
]

tests.each_with_index do |(asked, correct, label), i|
  result = choose_correct_door(asked, correct)
  verdict = result == correct ? "PASS" : "FAIL"
  puts "Test #{i+1}: #{label}"
  puts "  Algorithm outputs: #{result}"
  puts "  Expected: #{correct} | #{verdict}"
  puts ""
end
