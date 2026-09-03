# Two-Guard Riddle Algorithm - Bash implementation
# Usage: bash two_guard_riddle.sh

choose_correct_door() {
    local asked_is_truthful=$1
    local correct_door=$2
    
    # 1. What the OTHER guard would say about the correct door
    if [ "$asked_is_truthful" = "false" ]; then
        # Other guard is truthful
        other_says=$correct_door
    else
        # Other guard is liar
        if [ "$correct_door" = "Door A" ]; then
            other_says="Door B"
        else
            other_says="Door A"
        fi
    fi
    
    # 2. What the ASKED guard will tell us
    if [ "$asked_is_truthful" = "true" ]; then
        # Asked guard is truthful - tells us what other would say
        asked_says=$other_says
    else
        # Asked guard is liar - inverts what other would say
        if [ "$other_says" = "Door A" ]; then
            asked_says="Door B"
        else
            asked_says="Door A"
        fi
    fi
    
    # 3. The real door is the opposite of what we heard
    if [ "$asked_says" = "Door A" ]; then
        echo "Door B"
    else
        echo "Door A"
    fi
}

echo "=== Two-Guard Riddle Algorithm (Bash) ==="
echo ""

# Test 1: Door B safe, ask Liar
r1=$(choose_correct_door false "Door B")
echo "Test 1: Door B is safe, asked Guard = Liar"
echo "  Algorithm outputs: $r1"
if [ "$r1" = "Door B" ]; then
    echo "  Expected: Door B | PASS"
else
    echo "  Expected: Door B | FAIL"
fi
echo ""

# Test 2: Door A safe, ask Truth-teller
r2=$(choose_correct_door true "Door A")
echo "Test 2: Door A is safe, asked Guard = Truth-teller"
echo "  Algorithm outputs: $r2"
if [ "$r2" = "Door A" ]; then
    echo "  Expected: Door A | PASS"
else
    echo "  Expected: Door A | FAIL"
fi
echo ""

# Test 3: Door A safe, ask Liar
r3=$(choose_correct_door false "Door A")
echo "Test 3: Door A is safe, asked Guard = Liar"
echo "  Algorithm outputs: $r3"
if [ "$r3" = "Door A" ]; then
    echo "  Expected: Door A | PASS"
else
    echo "  Expected: Door A | FAIL"
fi
echo ""

# Test 4: Door B safe, ask Truth-teller
r4=$(choose_correct_door true "Door B")
echo "Test 4: Door B is safe, asked Guard = Truth-teller"
echo "  Algorithm outputs: $r4"
if [ "$r4" = "Door B" ]; then
    echo "  Expected: Door B | PASS"
else
    echo "  Expected: Door B | FAIL"
fi
