def choose_correct_door(asked_guard_is_truthful, correct_door):
    """
    Simulates the two-guard riddle algorithm.
    Returns the door you should actually walk through.
    """
    doors = ["Door A", "Door B"]
    other_guard_is_truthful = not asked_guard_is_truthful
    
    # 1. Determine what the OTHER guard would say if asked directly
    if other_guard_is_truthful:
        other_guard_response = correct_door
    else:
        # The liar returns the wrong door
        other_guard_response = [d for d in doors if d != correct_door][0]
        
    # 2. Determine what the ASKED guard responds
    if asked_guard_is_truthful:
        final_response = other_guard_response
    else:
        # The liar inverts the other guard's answer
        final_response = [d for d in doors if d != other_guard_response][0]
        
    # 3. Apply the algorithm's rule: Take the opposite of the response
    chosen_door = [d for d in doors if d != final_response][0]
    return chosen_door

print("=== Two-Guard Riddle Algorithm (Python) ===")
print()

# Test 1: Door B is safe, we ask the Liar
r1 = choose_correct_door(False, "Door B")
print("Test 1: Door B is safe, asked Guard = Liar")
print(f"  Algorithm outputs: {r1}")
print(f"  Expected: Door B | {'PASS' if r1 == 'Door B' else 'FAIL'}")
print()

# Test 2: Door A is safe, we ask the Truth-teller
r2 = choose_correct_door(True, "Door A")
print("Test 2: Door A is safe, asked Guard = Truth-teller")
print(f"  Algorithm outputs: {r2}")
print(f"  Expected: Door A | {'PASS' if r2 == 'Door A' else 'FAIL'}")
print()

# Test 3: Door A is safe, we ask the Liar
r3 = choose_correct_door(False, "Door A")
print("Test 3: Door A is safe, asked Guard = Liar")
print(f"  Algorithm outputs: {r3}")
print(f"  Expected: Door A | {'PASS' if r3 == 'Door A' else 'FAIL'}")
print()

# Test 4: Door B is safe, we ask the Truth-teller
r4 = choose_correct_door(True, "Door B")
print("Test 4: Door B is safe, asked Guard = Truth-teller")
print(f"  Algorithm outputs: {r4}")
print(f"  Expected: Door B | {'PASS' if r4 == 'Door B' else 'FAIL'}")
