// Two-Guard Riddle Algorithm - Dart implementation
// Usage: dart run two_guard_riddle.dart
//
// The riddle: Two doors (left/right), one leads to freedom, one to danger.
// Two guards: one always tells truth, one always lies. You don't know which is which.
// You can ask ONE question to ONE guard. What do you ask?
//
// Classic solution: Ask "If I asked the OTHER guard which door is safe, what would he say?"
// Then choose the OPPOSITE door. The logic works regardless of which guard you ask.

String findFreedomDoor(bool askTruthful, String correctDoor) {
  bool otherIsTruthful = !askTruthful;
  
  // What the other guard would say
  String otherSays;
  if (otherIsTruthful) {
    otherSays = correctDoor;
  } else {
    otherSays = correctDoor == 'Door A' ? 'Door B' : 'Door A';
  }
  
  // What the asked guard reports
  String askedSays;
  if (askTruthful) {
    askedSays = otherSays;
  } else {
    askedSays = otherSays == 'Door A' ? 'Door B' : 'Door A';
  }
  
  // Choose the opposite of what was said
  return askedSays == 'Door A' ? 'Door B' : 'Door A';
}

void runTest(bool askTruthful, String correctDoor, int n) {
  String result = findFreedomDoor(askTruthful, correctDoor);
  String verdict = result == correctDoor ? 'PASS' : 'FAIL';
  String who = askTruthful ? 'Truth-teller' : 'Liar';
  String doorLetter = correctDoor == 'Door A' ? 'A' : 'B';
  
  print('Test $n: Door $doorLetter is safe, asked Guard = $who');
  print('  Algorithm outputs: $result');
  print('  Expected: $correctDoor | $verdict');
  print('');
}

void main() {
  print('=== Two-Guard Riddle Algorithm (Dart) ===');
  print('');
  runTest(false, 'Door B', 1);
  runTest(true, 'Door A', 2);
  runTest(false, 'Door A', 3);
  runTest(true, 'Door B', 4);
}
