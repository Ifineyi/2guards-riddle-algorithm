// Two-Guard Riddle Algorithm - Swift implementation
// Usage: swift two_guard_riddle.swift

func chooseCorrectDoor(askedGuardIsTruthful: Bool, correctDoor: String) -> String {
    let otherGuardIsTruthful = !askedGuardIsTruthful

    // 1. What would the OTHER guard say?
    let otherGuardResponse: String
    if otherGuardIsTruthful {
        otherGuardResponse = correctDoor
    } else {
        otherGuardResponse = correctDoor == "Door A" ? "Door B" : "Door A"
    }

    // 2. What does the ASKED guard say?
    let finalResponse: String
    if askedGuardIsTruthful {
        finalResponse = otherGuardResponse
    } else {
        finalResponse = otherGuardResponse == "Door A" ? "Door B" : "Door A"
    }

    // 3. Take the opposite
    return finalResponse == "Door A" ? "Door B" : "Door A"
}

func runTest(asked: Bool, correct: String, n: Int) {
    let result = chooseCorrectDoor(askedGuardIsTruthful: asked, correctDoor: correct)
    let who = asked ? "Truth-teller" : "Liar"
    let letter = correct == "Door A" ? "A" : "B"
    let verdict = result == correct ? "PASS" : "FAIL"
    print("Test \(n): Door \(letter) is safe, asked Guard = \(who)")
    print("  Algorithm outputs: \(result)")
    print("  Expected: \(correct) | \(verdict)")
    print()
}

print("=== Two-Guard Riddle Algorithm (Swift) ===")
print()
runTest(asked: false, correct: "Door B", n: 1)
runTest(asked: true, correct: "Door A", n: 2)
runTest(asked: false, correct: "Door A", n: 3)
runTest(asked: true, correct: "Door B", n: 4)
