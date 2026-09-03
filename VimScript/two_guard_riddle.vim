" Two-Guard Riddle Algorithm - Vim Script Implementation
" Usage: vim -u NONE -N -c "source two_guard_riddle.vim" -c "q" < /dev/null

function! ChooseCorrectDoor(asked_is_truthful, correct_door)
    " Determine if the OTHER guard is truthful
    let other_is_truthful = !a:asked_is_truthful

    " 1. What the OTHER guard would say about the correct door
    let other_says = a:correct_door
    if !other_is_truthful
        if a:correct_door == 'Door A'
            let other_says = 'Door B'
        else
            let other_says = 'Door A'
        endif
    endif

    " 2. What the ASKED guard will tell us
    let asked_says = other_says
    if !a:asked_is_truthful
        if other_says == 'Door A'
            let asked_says = 'Door B'
        else
            let asked_says = 'Door A'
        endif
    endif

    " 3. The real door is the opposite of what we heard
    if asked_says == 'Door A'
        return 'Door B'
    endif
    return 'Door A'
endfunction

echo '=== Two-Guard Riddle Algorithm (Vim Script) ==='
echo ''

" Test 1: Door B safe, ask Liar
let result = ChooseCorrectDoor(0, 'Door B')
echo 'Test 1: Door B is safe, asked Guard = Liar'
echo '  Algorithm outputs: ' . result
if result == 'Door B'
    echo '  Expected: Door B | PASS'
else
    echo '  Expected: Door B | FAIL'
endif
echo ''

" Test 2: Door A safe, ask Truth-teller
let result = ChooseCorrectDoor(1, 'Door A')
echo 'Test 2: Door A is safe, asked Guard = Truth-teller'
echo '  Algorithm outputs: ' . result
if result == 'Door A'
    echo '  Expected: Door A | PASS'
else
    echo '  Expected: Door A | FAIL'
endif
echo ''

" Test 3: Door A safe, ask Liar
let result = ChooseCorrectDoor(0, 'Door A')
echo 'Test 3: Door A is safe, asked Guard = Liar'
echo '  Algorithm outputs: ' . result
if result == 'Door A'
    echo '  Expected: Door A | PASS'
else
    echo '  Expected: Door A | FAIL'
endif
echo ''

" Test 4: Door B safe, ask Truth-teller
let result = ChooseCorrectDoor(1, 'Door B')
echo 'Test 4: Door B is safe, asked Guard = Truth-teller'
echo '  Algorithm outputs: ' . result
if result == 'Door B'
    echo '  Expected: Door B | PASS'
else
    echo '  Expected: Door B | FAIL'
endif
