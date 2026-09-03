program TwoGuardRiddle;

function ChooseCorrectDoor(AskedGuardIsTruthful: Boolean; CorrectDoor: string): string;
var
    OtherGuardIsTruthful: Boolean;
    OtherGuardResponse, FinalResponse: string;
begin
    OtherGuardIsTruthful := not AskedGuardIsTruthful;

    { 1. What would the OTHER guard say? }
    if OtherGuardIsTruthful then
        OtherGuardResponse := CorrectDoor
    else
        if CorrectDoor = 'Door A' then
            OtherGuardResponse := 'Door B'
        else
            OtherGuardResponse := 'Door A';

    { 2. What does the ASKED guard say? }
    if AskedGuardIsTruthful then
        FinalResponse := OtherGuardResponse
    else
        if OtherGuardResponse = 'Door A' then
            FinalResponse := 'Door B'
        else
            FinalResponse := 'Door A';

    { 3. Take the opposite }
    if FinalResponse = 'Door A' then
        ChooseCorrectDoor := 'Door B'
    else
        ChooseCorrectDoor := 'Door A';
end;

procedure RunTest(Asked: Boolean; Correct: string; N: integer);
var
    Result: string;
    Who, Letter, Verdict: string;
begin
    Result := ChooseCorrectDoor(Asked, Correct);
    if Asked then
        Who := 'Truth-teller'
    else
        Who := 'Liar';
    if Correct = 'Door A' then
        Letter := 'A'
    else
        Letter := 'B';
    if Result = Correct then
        Verdict := 'PASS'
    else
        Verdict := 'FAIL';
    writeln('Test ', N, ': Door ', Letter, ' is safe, asked Guard = ', Who);
    writeln('  Algorithm outputs: ', Result);
    writeln('  Expected: ', Correct, ' | ', Verdict);
    writeln;
end;

begin
    writeln('=== Two-Guard Riddle Algorithm (Pascal) ===');
    writeln;
    RunTest(false, 'Door B', 1);
    RunTest(true, 'Door A', 2);
    RunTest(false, 'Door A', 3);
    RunTest(true, 'Door B', 4);
end.
