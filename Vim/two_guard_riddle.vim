" Two-Guard Riddle Algorithm - Vim script implementation
" Usage: vim -u NONE -N -c "source two_guard_riddle.vim" -c "qa!"

function! ChooseCorrectDoor(askTruthful, correctDoor)
    let l:otherIsTruthful = !a:askTruthful
    " 1. What the OTHER guard would say
    if l:otherIsTruthful
        let l:otherSays = a:correctDoor
    else
        let l:otherSays = (a:correctDoor == "Door A") ? "Door B" : "Door A"
    endif
    " 2. What the ASKED guard tells us
    if a:askTruthful
        let l:askedSays = l:otherSays
    else
        let l:askedSays = (l:otherSays == "Door A") ? "Door B" : "Door A"
    endif
    " 3. Invert to get the correct door
    return (l:askedSays == "Door A") ? "Door B" : "Door A"
endfunction

echo "=== Two-Guard Riddle Algorithm (Vim script) ==="
echo ""

let l:r1 = ChooseCorrectDoor(0, "Door B")
echo "Test 1: Door B is safe, asked Guard = Liar"
echo "  Algorithm outputs: " . l:r1
echo "  Expected: Door B | " . (l:r1 == "Door B" ? "PASS" : "FAIL")
echo ""

let l:r2 = ChooseCorrectDoor(1, "Door A")
echo "Test 2: Door A is safe, asked Guard = Truth-teller"
echo "  Algorithm outputs: " . l:r2
echo "  Expected: Door A | " . (l:r2 == "Door A" ? "PASS" : "FAIL")
echo ""

let l:r3 = ChooseCorrectDoor(0, "Door A")
echo "Test 3: Door A is safe, asked Guard = Liar"
echo "  Algorithm outputs: " . l:r3
echo "  Expected: Door A | " . (l:r3 == "Door A" ? "PASS" : "FAIL")
echo ""

let l:r4 = ChooseCorrectDoor(1, "Door B")
echo "Test 4: Door B is safe, asked Guard = Truth-teller"
echo "  Algorithm outputs: " . l:r4
echo "  Expected: Door B | " . (l:r4 == "Door B" ? "PASS" : "FAIL")
