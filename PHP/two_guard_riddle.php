<?php
// Two-Guard Riddle Algorithm - PHP implementation
// Usage: php two_guard_riddle.php

function chooseCorrectDoor($askedIsTruthful, $correctDoor) {
    $otherIsTruthful = !$askedIsTruthful;
    
    $otherSays = $otherIsTruthful
        ? $correctDoor
        : ($correctDoor === "Door A" ? "Door B" : "Door A");
    
    $askedSays = $askedIsTruthful
        ? $otherSays
        : ($otherSays === "Door A" ? "Door B" : "Door A");
    
    return ($askedSays === "Door A") ? "Door B" : "Door A";
}

echo "=== Two-Guard Riddle Algorithm (PHP) ===\n\n";

$tests = [
    [false, "Door B", "Door B is safe, asked Guard = Liar"],
    [true,  "Door A", "Door A is safe, asked Guard = Truth-teller"],
    [false, "Door A", "Door A is safe, asked Guard = Liar"],
    [true,  "Door B", "Door B is safe, asked Guard = Truth-teller"],
];

foreach ($tests as $i => [$asked, $correct, $label]) {
    $result = chooseCorrectDoor($asked, $correct);
    $verdict = ($result === $correct) ? "PASS" : "FAIL";
    echo "Test " . ($i+1) . ": $label\n";
    echo "  Algorithm outputs: $result\n";
    echo "  Expected: $correct | $verdict\n\n";
}
?>
