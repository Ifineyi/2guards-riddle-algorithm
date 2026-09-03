/// Two-Guard Riddle Algorithm - C++ implementation
/// Usage: g++ -o two_guard_riddle two_guard_riddle.cpp && ./two_guard_riddle
///
/// The riddle: Two doors (left/right), one leads to freedom, one to danger.
/// Two guards: one always tells truth, one always lies. You don't know which is which.
/// You can ask ONE question to ONE guard. What do you ask?
///
/// Classic solution: Ask "If I asked the OTHER guard which door is safe, what would he say?"
/// Then choose the OPPOSITE door. The logic works regardless of which guard you ask.

#include <iostream>
#include <string>

std::string find_freedom_door(bool ask_truthful, const std::string& correct_door) {
    bool other_is_truthful = !ask_truthful;
    
    // What the other guard would say
    std::string other_says;
    if (other_is_truthful) {
        other_says = correct_door;
    } else {
        other_says = (correct_door == "Door A") ? "Door B" : "Door A";
    }
    
    // What the asked guard reports
    std::string asked_says;
    if (ask_truthful) {
        asked_says = other_says;
    } else {
        asked_says = (other_says == "Door A") ? "Door B" : "Door A";
    }
    
    // Choose the opposite of what was said
    return (asked_says == "Door A") ? "Door B" : "Door A";
}

void run_test(bool ask_truthful, const std::string& correct, int n) {
    std::string result = find_freedom_door(ask_truthful, correct);
    std::string verdict = (result == correct) ? "PASS" : "FAIL";
    std::string who = ask_truthful ? "Truth-teller" : "Liar";
    char door_letter = (correct == "Door A") ? 'A' : 'B';
    
    std::cout << "Test " << n << ": Door " << door_letter << " is safe, asked Guard = " << who << std::endl;
    std::cout << "  Algorithm outputs: " << result << std::endl;
    std::cout << "  Expected: " << correct << " | " << verdict << std::endl;
    std::cout << std::endl;
}

int main() {
    std::cout << "=== Two-Guard Riddle Algorithm (C++) ===" << std::endl;
    std::cout << std::endl;
    run_test(false, "Door B", 1);   // Ask liar, door B is safe -> should output Door B
    run_test(true, "Door A", 2);    // Ask truth-teller, door A is safe -> should output Door A
    run_test(false, "Door A", 3);   // Ask liar, door A is safe -> should output Door A
    run_test(true, "Door B", 4);    // Ask truth-teller, door B is safe -> should output Door B
    return 0;
}
