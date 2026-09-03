# Two-Guard Riddle — Tcl implementation
# Usage: tclsh two_guard_riddle.tcl

proc choose_correct_door {asked_is_truthful correct_door} {
    set other_is_truthful [expr {!$asked_is_truthful}]
    set doors [list "Door A" "Door B"]

    # 1. What the OTHER guard would say about the correct door
    if {$other_is_truthful} {
        set other_says $correct_door
    } else {
        set other_says [expr {$correct_door eq "Door A" ? "Door B" : "Door A"}]
    }

    # 2. What the ASKED guard will tell us
    if {$asked_is_truthful} {
        set asked_says $other_says
    } else {
        set asked_says [expr {$other_says eq "Door A" ? "Door B" : "Door A"}]
    }

    # 3. The real door is the opposite of what we heard
    return [expr {$asked_says eq "Door A" ? "Door B" : "Door A"}]
}

puts "=== Two-Guard Riddle Algorithm (Tcl) ==="
puts ""

set tests {
    {0 "Door B" 1 "Door B is safe, asked Guard = Liar"}
    {1 "Door A" 2 "Door A is safe, asked Guard = Truth-teller"}
    {0 "Door A" 3 "Door A is safe, asked Guard = Liar"}
    {1 "Door B" 4 "Door B is safe, asked Guard = Truth-teller"}
}

foreach test $tests {
    lassign $test asked correct num label
    set result [choose_correct_door $asked $correct]
    set verdict [expr {$result eq $correct ? "PASS" : "FAIL"}]
    set who [expr {$asked ? "Truth-teller" : "Liar"}]
    set door_letter [string index $correct 5]
    puts "Test $num: Door $door_letter is safe, asked Guard = $who"
    puts "  Algorithm outputs: $result"
    puts "  Expected: $correct | $verdict"
    puts ""
}
