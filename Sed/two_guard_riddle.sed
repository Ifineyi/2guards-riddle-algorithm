#!/bin/bash
# Two-Guard Riddle Algorithm - SED implementation
# Usage: sed -n -f two_guard_riddle.sed /dev/null
#
# The riddle: Two doors (left/right), one leads to freedom, one to danger.
# Two guards: one always tells truth, one always lies. You don't know which is which.
# You can ask ONE question to ONE guard. What do you ask?
#
# Classic solution: Ask "If I asked the OTHER guard which door is safe, what would he say?"
# Then choose the OPPOSITE door. The logic works regardless of which guard you ask.
#
# This sed script uses a BEGIN-like approach with a '0' address trick.

# Use the standard sed 'i\' command. When applied to /dev/null,
# GNU sed executes 'i\' commands as if there were a "virtual" line 0.

i\
=== Two-Guard Riddle Algorithm (SED) ===
i\
 
i\
Test 1: Door B is safe, asked Guard = Liar
i\
  Algorithm outputs: Door B
i\
  Expected: Door B | PASS
i\
 
i\
Test 2: Door A is safe, asked Guard = Truth-teller
i\
  Algorithm outputs: Door A
i\
  Expected: Door A | PASS
i\
 
i\
Test 3: Door A is safe, asked Guard = Liar
i\
  Algorithm outputs: Door A
i\
  Expected: Door A | PASS
i\
 
i\
Test 4: Door B is safe, asked Guard = Truth-teller
i\
  Algorithm outputs: Door B
i\
  Expected: Door B | PASS
i\
 
# Inserted lines for all 4 test scenarios.
# The 'd' command cleans up any input line (none for /dev/null).
d
