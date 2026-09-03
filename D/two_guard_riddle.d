import std.stdio;

void main() {
    writeln("Two Guard Riddle - D Implementation");
    writeln("=====================================");
    writeln();

    string[] doors = ["left", "right"];
    string[] guardTypes = ["truthful", "lying"];

    foreach (i; 0..2) {
        string correctDoor = doors[i];

        foreach (j; 0..2) {
            string askedGuard = guardTypes[j];
            bool otherIsTruthful = (askedGuard[0] == 't') ? false : true;

            string otherGuardAnswer = correctDoor;
            if (otherIsTruthful) {
                otherGuardAnswer = (correctDoor[0] == 'l') ? "right" : "left";
            }

            string reportedAnswer = otherGuardAnswer;
            if (askedGuard[0] == 't') {
                reportedAnswer = otherGuardAnswer;
            } else {
                reportedAnswer = (otherGuardAnswer[0] == 'l') ? "right" : "left";
            }

            string choice = (reportedAnswer[0] == 'l') ? "right" : "left";
            string status = (choice[0] == correctDoor[0]) ? "CORRECT" : "WRONG";

            writeln("Correct door: ", correctDoor, " | Asked guard: ", askedGuard,
                    " | Choice: ", choice, " | ", status);
        }
    }

    writeln();
    writeln("All scenarios completed.");
}
