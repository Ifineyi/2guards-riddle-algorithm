#include <iostream>
#include <string>
#include <vector>

std::string choose_correct_door(bool asked_guard_is_truthful, const std::string& correct_door) {
    std::vector<std::string> doors = {"Door A", "Door B"};
    bool other_guard_is_truthful = !asked_guard_is_truthful;

    // 1. Determine what the OTHER guard would say if asked directly
    std::string other_guard_response;
    if (other_guard_is_truthful) {
        other_guard_response = correct_door;
    } else {
        // The liar returns the wrong door
        other_guard_response = (correct_door == "Door A") ? "Door B" : "Door A";
    }

    // 2. Determine what the ASKED guard responds
    std::string final_response;
    if (asked_guard_is_truthful) {
        final_response = other_guard_response;
    } else {
        // The liar inverts the other guard's answer
        final_response = (other_guard_response == "Door A") ? "Door B" : "Door A";
    }

    // 3. Apply the algorithm's rule: Take the opposite of the response
    std::string chosen_door = (final_response == "Door A") ? "Door B" : "Door A";
    return chosen_door;
}

int main() {
    std::cout << "=== Two-Guard Riddle Algorithm (C++) ===" << std::endl;
    std::cout << std::endl;

    // Test: Door B is safe, we ask the Liar
    std::string result1 = choose_correct_door(false, "Door B");
    std::cout << "Test 1: Door B is safe, asked Guard = Liar" << std::endl;
    std::cout << "  Algorithm outputs: " << result1 << std::endl;
    std::cout << "  Expected: Door B | " << (result1 == "Door B" ? "PASS" : "FAIL") << std::endl;
    std::cout << std::endl;

    // Test: Door A is safe, we ask the Truth-teller
    std::string result2 = choose_correct_door(true, "Door A");
    std::cout << "Test 2: Door A is safe, asked Guard = Truth-teller" << std::endl;
    std::cout << "  Algorithm outputs: " << result2 << std::endl;
    std::cout << "  Expected: Door A | " << (result2 == "Door A" ? "PASS" : "FAIL") << std::endl;
    std::cout << std::endl;

    // Test: Door A is safe, we ask the Liar
    std::string result3 = choose_correct_door(false, "Door A");
    std::cout << "Test 3: Door A is safe, asked Guard = Liar" << std::endl;
    std::cout << "  Algorithm outputs: " << result3 << std::endl;
    std::cout << "  Expected: Door A | " << (result3 == "Door A" ? "PASS" : "FAIL") << std::endl;
    std::cout << std::endl;

    // Test: Door B is safe, we ask the Truth-teller
    std::string result4 = choose_correct_door(true, "Door B");
    std::cout << "Test 4: Door B is safe, asked Guard = Truth-teller" << std::endl;
    std::cout << "  Algorithm outputs: " << result4 << std::endl;
    std::cout << "  Expected: Door B | " << (result4 == "Door B" ? "PASS" : "FAIL") << std::endl;

    return 0;
}
