// Two-Guard Riddle Algorithm - V implementation
// Usage: v run two_guard_riddle.v

fn chooseCorrectDoor(askedIsTruthful bool, correctDoor string) string {
    otherIsTruthful := !askedIsTruthful
    
    otherSays := if otherIsTruthful {
        correctDoor
    } else {
        if correctDoor == 'Door A' { 'Door B' } else { 'Door A' }
    }
    
    askedSays := if askedIsTruthful {
        otherSays
    } else {
        if otherSays == 'Door A' { 'Door B' } else { 'Door A' }
    }
    
    if askedSays == 'Door A' { return 'Door B' }
    return 'Door A'
}

fn main() {
    println('=== Two-Guard Riddle Algorithm (V) ===')
    println('')
    
    tests := [
        [false, 'Door B', 'Door B is safe, asked Guard = Liar'],
        [true,  'Door A', 'Door A is safe, asked Guard = Truth-teller'],
        [false, 'Door A', 'Door A is safe, asked Guard = Liar'],
        [true,  'Door B', 'Door B is safe, asked Guard = Truth-teller'],
    ]
    
    for i, t in tests {
        result := chooseCorrectDoor(t[0], t[1])
        verdict := if result == t[1] { 'PASS' } else { 'FAIL' }
        println('Test ' + i + ': ' + t[2])
        println('  Algorithm outputs: ' + result)
        println('  Expected: ' + t[1] + ' | ' + verdict)
        println('')
    }
}
