#include <stdio.h>
#include <stdbool.h>
#include <string.h>
// 0. The purpose of this alogrithm is to choose the opposite of the response any guard gives you
const char* choose_correct_door(bool asked_guard_is_truthful, const char* correct_door) {
    bool other_guard_is_truthful = !asked_guard_is_truthful;
    const char* doors[] = {"Door A", "Door B"};
    
    // 1. Determine what the OTHER guard would say if asked directly
    const char* other_guard_response;
    if (other_guard_is_truthful) {
        other_guard_response = correct_door;
    } else {
        other_guard_response = (strcmp(correct_door, "Door A") == 0) ? "Door B" : "Door A";
    }
    
    // 2. Determine what the ASKED guard responds
    const char* final_response;
    if (asked_guard_is_truthful) {
        final_response = other_guard_response;
    } else {
        final_response = (strcmp(other_guard_response, "Door A") == 0) ? "Door B" : "Door A";
    }
    
    // 3. Apply the algorithm's rule: Take the opposite of the response
    return (strcmp(final_response, "Door A") == 0) ? "Door B" : "Door A";
}

int main() {
    printf("=== Two-Guard Riddle Algorithm (C) ===\n\n");
    
    const char* r1 = choose_correct_door(false, "Door B");
    printf("Test 1: Door B is safe, asked Guard = Liar\n");
    printf("  Algorithm outputs: %s\n", r1);
    printf("  Expected: Door B | %s\n\n", strcmp(r1, "Door B") == 0 ? "PASS" : "FAIL");
    
    const char* r2 = choose_correct_door(true, "Door A");
    printf("Test 2: Door A is safe, asked Guard = Truth-teller\n");
    printf("  Algorithm outputs: %s\n", r2);
    printf("  Expected: Door A | %s\n\n", strcmp(r2, "Door A") == 0 ? "PASS" : "FAIL");
    
    const char* r3 = choose_correct_door(false, "Door A");
    printf("Test 3: Door A is safe, asked Guard = Liar\n");
    printf("  Algorithm outputs: %s\n", r3);
    printf("  Expected: Door A | %s\n\n", strcmp(r3, "Door A") == 0 ? "PASS" : "FAIL");
    
    const char* r4 = choose_correct_door(true, "Door B");
    printf("Test 4: Door B is safe, asked Guard = Truth-teller\n");
    printf("  Algorithm outputs: %s\n", r4);
    printf("  Expected: Door B | %s\n", strcmp(r4, "Door B") == 0 ? "PASS" : "FAIL");
    
    return 0;
}
