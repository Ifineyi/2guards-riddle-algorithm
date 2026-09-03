% Two-Guard Riddle Algorithm - MATLAB/Octave implementation
% Usage: octave two_guard_riddle.m  (or MATLAB)
%
% The riddle: Two doors (left/right), one leads to freedom, one to danger.
% Two guards: one always tells truth, one always lies. You don't know which is which.
% You can ask ONE question to ONE guard. What do you ask?
%
% Classic solution: Ask "If I asked the OTHER guard which door is safe, what would he say?"
% Then choose the OPPOSITE door. The logic works regardless of which guard you ask.

function result = find_freedom_door(ask_truthful, correct_door)
    other_is_truthful = ~ask_truthful;
    
    % What the other guard would say
    if other_is_truthful
        other_says = correct_door;
    else
        if strcmp(correct_door, 'Door A')
            other_says = 'Door B';
        else
            other_says = 'Door A';
        end
    end
    
    % What the asked guard reports
    if ask_truthful
        asked_says = other_says;
    else
        if strcmp(other_says, 'Door A')
            asked_says = 'Door B';
        else
            asked_says = 'Door A';
        end
    end
    
    % Choose the opposite of what was said
    if strcmp(asked_says, 'Door A')
        result = 'Door B';
    else
        result = 'Door A';
    end
end

function run_test(ask_truthful, correct, n)
    result = find_freedom_door(ask_truthful, correct);
    verdict = strcmp(result, correct) ? 'PASS' : 'FAIL';
    if ask_truthful
        who = 'Truth-teller';
    else
        who = 'Liar';
    end
    door_letter = correct(end);
    
    fprintf('Test %d: Door %s is safe, asked Guard = %s\n', n, door_letter, who);
    fprintf('  Algorithm outputs: %s\n', result);
    fprintf('  Expected: %s | %s\n', correct, verdict);
    fprintf('\n');
end

fprintf('=== Two-Guard Riddle Algorithm (MATLAB/Octave) ===\n\n');
run_test(false, 'Door B', 1);   % Ask liar, door B is safe -> should output Door B
run_test(true, 'Door A', 2);    % Ask truth-teller, door A is safe -> should output Door A
run_test(false, 'Door A', 3);   % Ask liar, door A is safe -> should output Door A
run_test(true, 'Door B', 4);    % Ask truth-teller, door B is safe -> should output Door B
