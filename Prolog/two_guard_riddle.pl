% Two-Guard Riddle Algorithm - Prolog implementation
% Usage: swipl -s two_guard_riddle.pl -g run_tests -t halt

:- initialization(run_tests).

other_is_truthful(Truthful, Other) :- Other = \+ Truthful.

other_guard_answer(true, CorrectDoor, CorrectDoor).
other_guard_answer(false, "left", "right").
other_guard_answer(false, "right", "left").

asked_guard_report(true, OtherGuardAnswer, OtherGuardAnswer).
asked_guard_report(false, "left", "right").
asked_guard_report(false, "right", "left").

choice_door("left", "right").
choice_door("right", "left").

choose_correct_door(AskedIsTruthful, CorrectDoor, Choice) :-
    other_is_truthful(AskedIsTruthful, OtherIsTruthful),
    other_guard_answer(OtherIsTruthful, CorrectDoor, OtherGuardAnswer),
    asked_guard_report(AskedIsTruthful, OtherGuardAnswer, AskedGuardReport),
    choice_door(AskedGuardReport, Choice).

run_tests :-
    writeln('Two Guard Riddle - Prolog Implementation'),
    writeln('==========================================='), writeln(''),
    forall(member(CorrectDoor, ["left", "right"]),
        forall(member(AskedTruthful, [true, false]),
            ( choose_correct_door(AskedTruthful, CorrectDoor, Choice),
              (Choice = CorrectDoor -> Status = "CORRECT" ; Status = "WRONG"),
              (AskedTruthful = true -> AskedStr = "truthful" ; AskedStr = "lying"),
              format('Correct door: ~w | Asked guard: ~w | Choice: ~w | ~w~n',
                     [CorrectDoor, AskedStr, Choice, Status])
            )
        )
    ),
    writeln(''), writeln('All scenarios completed.'), nl.
