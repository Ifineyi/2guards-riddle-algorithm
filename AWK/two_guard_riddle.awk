# Two-Guard Riddle Algorithm - AWK Implementation
# Usage: awk -f two_guard_riddle.awk < NUL (Windows) or < /dev/null (Unix)

function choose_correct_door(asked, correct,    other, other_says, asked_says) {
    other = !asked

    # 1. What the OTHER guard would say about the correct door
    if (other)
        other_says = correct
    else
        other_says = (correct == "Door A") ? "Door B" : "Door A"

    # 2. What the ASKED guard will tell us
    if (asked)
        asked_says = other_says
    else
        asked_says = (other_says == "Door A") ? "Door B" : "Door A"

    # 3. The real door is the opposite of what we heard
    return (asked_says == "Door A") ? "Door B" : "Door A"
}

BEGIN {
    print "=== Two-Guard Riddle Algorithm (AWK) ==="
    print ""

    # Test 1: Door B safe, ask Liar
    r = choose_correct_door(0, "Door B")
    print "Test 1: Door B is safe, asked Guard = Liar"
    print "  Algorithm outputs: " r
    print "  Expected: Door B | " (r == "Door B" ? "PASS" : "FAIL")
    print ""

    # Test 2: Door A safe, ask Truth-teller
    r = choose_correct_door(1, "Door A")
    print "Test 2: Door A is safe, asked Guard = Truth-teller"
    print "  Algorithm outputs: " r
    print "  Expected: Door A | " (r == "Door A" ? "PASS" : "FAIL")
    print ""

    # Test 3: Door A safe, ask Liar
    r = choose_correct_door(0, "Door A")
    print "Test 3: Door A is safe, asked Guard = Liar"
    print "  Algorithm outputs: " r
    print "  Expected: Door A | " (r == "Door A" ? "PASS" : "FAIL")
    print ""

    # Test 4: Door B safe, ask Truth-teller
    r = choose_correct_door(1, "Door B")
    print "Test 4: Door B is safe, asked Guard = Truth-teller"
    print "  Algorithm outputs: " r
    print "  Expected: Door B | " (r == "Door B" ? "PASS" : "FAIL")
}
