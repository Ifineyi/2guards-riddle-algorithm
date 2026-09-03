% Two-Guard Riddle Algorithm - Erlang implementation
-module(two_guard_riddle).
-export([main/0, choose_correct_door/2, run_test/3, start/0]).

choose_correct_door(AskedGuardIsTruthful, CorrectDoor) ->
    OtherGuardIsTruthful = not AskedGuardIsTruthful,
    OtherGuardResponse = choose_other_guard_response(OtherGuardIsTruthful, CorrectDoor),
    FinalResponse = choose_final_response(AskedGuardIsTruthful, OtherGuardResponse),
    opposite(FinalResponse).

choose_other_guard_response(true, CorrectDoor) -> CorrectDoor;
choose_other_guard_response(false, "Door A") -> "Door B";
choose_other_guard_response(false, "Door B") -> "Door A".

choose_final_response(true, OtherGuardResponse) -> OtherGuardResponse;
choose_final_response(false, "Door A") -> "Door B";
choose_final_response(false, "Door B") -> "Door A".

opposite("Door A") -> "Door B";
opposite("Door B") -> "Door A".

run_test(false, CorrectDoor, N) ->
    Result = choose_correct_door(false, CorrectDoor),
    Who = "Liar",
    Letter = case CorrectDoor of "Door A" -> "A"; "Door B" -> "B" end,
    Verdict = if Result == CorrectDoor -> "PASS"; true -> "FAIL" end,
    io:format("Test ~p: Door ~s is safe, asked Guard = ~s~n", [N, Letter, Who]),
    io:format("  Algorithm outputs: ~s~n", [Result]),
    io:format("  Expected: ~s | ~s~n~n", [CorrectDoor, Verdict]);
run_test(true, CorrectDoor, N) ->
    Result = choose_correct_door(true, CorrectDoor),
    Who = "Truth-teller",
    Letter = case CorrectDoor of "Door A" -> "A"; "Door B" -> "B" end,
    Verdict = if Result == CorrectDoor -> "PASS"; true -> "FAIL" end,
    io:format("Test ~p: Door ~s is safe, asked Guard = ~s~n", [N, Letter, Who]),
    io:format("  Algorithm outputs: ~s~n", [Result]),
    io:format("  Expected: ~s | ~s~n~n", [CorrectDoor, Verdict]).

start() -> main().

main() ->
    io:format("=== Two-Guard Riddle Algorithm (Erlang) ===~n~n"),
    run_test(false, "Door B", 1),
    run_test(true, "Door A", 2),
    run_test(false, "Door A", 3),
    run_test(true, "Door B", 4).
