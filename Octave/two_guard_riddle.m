# Two-Guard Riddle Algorithm - Octave/MATLAB implementation

function result = two_guard_riddle(asked_guard_is_truthful, correct_door)
    other_guard_is_truthful = ~asked_guard_is_truthful;
    if other_guard_is_truthful
        other_guard_response = correct_door;
    else
        if strcmp(correct_door, "Door A")
            other_guard_response = "Door B";
        else
            other_guard_response = "Door A";
        end
    end
    if asked_guard_is_truthful
        final_response = other_guard_response;
    else
        if strcmp(other_guard_response, "Door A")
            final_response = "Door B";
        else
            final_response = "Door A";
        end
    end
    if strcmp(final_response, "Door A")
        result = "Door B";
    else
        result = "Door A";
    end
endfunction

function run_test(asked, correct, n)
    result = two_guard_riddle(asked, correct);
    if asked
        who = "Truth-teller";
    else
        who = "Liar";
    end
    if strcmp(correct, "Door A")
        letter = "A";
    else
        letter = "B";
    end
    if strcmp(result, correct)
        verdict = "PASS";
    else
        verdict = "FAIL";
    end
    printf("Test %d: Door %s is safe, asked Guard = %s\n", n, letter, who);
    printf("  Algorithm outputs: %s\n", result);
    printf("  Expected: %s | %s\n\n", correct, verdict);
endfunction

printf("=== Two-Guard Riddle Algorithm (Octave) ===\n\n");
run_test(0, "Door B", 1);
run_test(1, "Door A", 2);
run_test(0, "Door A", 3);
run_test(1, "Door B", 4);
