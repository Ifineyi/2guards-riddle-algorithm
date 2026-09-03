# Two-Guard Riddle Algorithm - Octave/MATLAB implementation
% Usage: octave --no-gui two_guard_riddle.m

function result = choose_correct_door_f(asked_guard_is_truthful, correct_door)
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
    result = choose_correct_door_f(asked, correct);
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
    fprintf("Test %d: Door %s is safe, asked Guard = %s\n", n, letter, who);
    fprintf("  Algorithm outputs: %s\n", result);
    fprintf("  Expected: %s | %s\n\n", correct, verdict);
endfunction

fprintf("=== Two-Guard Riddle Algorithm (Octave) ===\n\n");
run_test(false, "Door B", 1);
run_test(true, "Door A", 2);
run_test(false, "Door A", 3);
run_test(true, "Door B", 4);
