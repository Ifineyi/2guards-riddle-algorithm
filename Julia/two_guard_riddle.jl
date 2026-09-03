# Two-Guard Riddle Algorithm - Julia implementation
# Usage: julia two_guard_riddle.jl

function choose_correct_door(asked_guard_is_truthful, correct_door)
    other_guard_is_truthful = !asked_guard_is_truthful

    # 1. What would the OTHER guard say?
    other_guard_response = if other_guard_is_truthful
        correct_door
    else
        correct_door == "Door A" ? "Door B" : "Door A"
    end

    # 2. What does the ASKED guard say?
    final_response = if asked_guard_is_truthful
        other_guard_response
    else
        other_guard_response == "Door A" ? "Door B" : "Door A"
    end

    # 3. Take the opposite
    return final_response == "Door A" ? "Door B" : "Door A"
end

function run_test(asked, correct, n)
    result = choose_correct_door(asked, correct)
    who = asked ? "Truth-teller" : "Liar"
    letter = correct == "Door A" ? "A" : "B"
    verdict = result == correct ? "PASS" : "FAIL"
    println("Test $n: Door $letter is safe, asked Guard = $who")
    println("  Algorithm outputs: $result")
    println("  Expected: $correct | $verdict")
    println()
end

println("=== Two-Guard Riddle Algorithm (Julia) ===")
println()
run_test(false, "Door B", 1)
run_test(true, "Door A", 2)
run_test(false, "Door A", 3)
run_test(true, "Door B", 4)
