defmodule TwoGuardRiddle do
  def choose_correct_door(asked_guard_is_truthful, correct_door) do
    other_guard_is_truthful = !asked_guard_is_truthful

    other_guard_response =
      if other_guard_is_truthful, do: correct_door,
      else: (if correct_door == "Door A", do: "Door B", else: "Door A")

    final_response =
      if asked_guard_is_truthful, do: other_guard_response,
      else: (if other_guard_response == "Door A", do: "Door B", else: "Door A")

    if final_response == "Door A", do: "Door B", else: "Door A"
  end

  def run_test(asked, correct, n) do
    result = choose_correct_door(asked, correct)
    who = if asked, do: "Truth-teller", else: "Liar"
    letter = if correct == "Door A", do: "A", else: "B"
    verdict = if result == correct, do: "PASS", else: "FAIL"
    IO.puts("Test #{n}: Door #{letter} is safe, asked Guard = #{who}")
    IO.puts("  Algorithm outputs: #{result}")
    IO.puts("  Expected: #{correct} | #{verdict}")
    IO.puts("")
  end

  def run do
    IO.puts("=== Two-Guard Riddle Algorithm (Elixir) ===")
    IO.puts("")
    run_test(false, "Door B", 1)
    run_test(true, "Door A", 2)
    run_test(false, "Door A", 3)
    run_test(true, "Door B", 4)
  end
end

TwoGuardRiddle.run()
