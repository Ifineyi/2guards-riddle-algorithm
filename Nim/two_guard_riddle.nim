# Two-Guard Riddle Algorithm - Nim implementation
# Usage: nim c -o:two_guard_riddle_nim two_guard_riddle.nim && ./two_guard_riddle_nim

proc chooseCorrectDoor(askedGuardIsTruthful: bool, correctDoor: string): string =
  let otherGuardIsTruthful = not askedGuardIsTruthful

  # 1. What the OTHER guard would say if asked directly
  var otherGuardResponse = correctDoor
  if not otherGuardIsTruthful:
    otherGuardResponse = if correctDoor == "Door A": "Door B" else: "Door A"

  # 2. What the ASKED guard tells us about the other guard's answer
  var askedGuardResponse = otherGuardResponse
  if not askedGuardIsTruthful:
    askedGuardResponse = if otherGuardResponse == "Door A": "Door B" else: "Door A"

  # 3. Opposite of the response → choose that door
  result = if askedGuardResponse == "Door A": "Door B" else: "Door A"

when isMainModule:
  echo "=== Two-Guard Riddle Algorithm (Nim) ==="
  echo ""

  let r1 = chooseCorrectDoor(false, "Door B")
  echo "Test 1: Door B is safe, asked Guard = Liar"
  echo "  Algorithm outputs: " & r1
  echo "  Expected: Door B | ", if r1 == "Door B": "PASS" else: "FAIL"
  echo ""

  let r2 = chooseCorrectDoor(true, "Door A")
  echo "Test 2: Door A is safe, asked Guard = Truth-teller"
  echo "  Algorithm outputs: " & r2
  echo "  Expected: Door A | ", if r2 == "Door A": "PASS" else: "FAIL"
  echo ""

  let r3 = chooseCorrectDoor(false, "Door A")
  echo "Test 3: Door A is safe, asked Guard = Liar"
  echo "  Algorithm outputs: " & r3
  echo "  Expected: Door A | ", if r3 == "Door A": "PASS" else: "FAIL"
  echo ""

  let r4 = chooseCorrectDoor(true, "Door B")
  echo "Test 4: Door B is safe, asked Guard = Truth-teller"
  echo "  Algorithm outputs: " & r4
  echo "  Expected: Door B | ", if r4 == "Door B": "PASS" else: "FAIL"
