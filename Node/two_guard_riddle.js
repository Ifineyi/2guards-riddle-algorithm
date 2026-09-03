// Two-Guard Riddle Algorithm (JavaScript/Node.js)

function chooseCorrectDoor(askedGuardIsTruthful, correctDoor) {
    const doors = ["Door A", "Door B"];
    const otherGuardIsTruthful = !askedGuardIsTruthful;
    
    // 1. Determine what the OTHER guard would say if asked directly
    let otherGuardResponse;
    if (otherGuardIsTruthful) {
        otherGuardResponse = correctDoor;
    } else {
        otherGuardResponse = doors.find(d => d !== correctDoor);
    }
    
    // 2. Determine what the ASKED guard responds
    let finalResponse;
    if (askedGuardIsTruthful) {
        finalResponse = otherGuardResponse;
    } else {
        finalResponse = doors.find(d => d !== otherGuardResponse);
    }
    
    // 3. Apply the algorithm's rule: Take the opposite of the response
    return doors.find(d => d !== finalResponse);
}

console.log("=== Two-Guard Riddle Algorithm (Node.js) ===");
console.log();

const r1 = chooseCorrectDoor(false, "Door B");
console.log("Test 1: Door B is safe, asked Guard = Liar");
console.log(`  Algorithm outputs: ${r1}`);
console.log(`  Expected: Door B | ${r1 === "Door B" ? "PASS" : "FAIL"}`);
console.log();

const r2 = chooseCorrectDoor(true, "Door A");
console.log("Test 2: Door A is safe, asked Guard = Truth-teller");
console.log(`  Algorithm outputs: ${r2}`);
console.log(`  Expected: Door A | ${r2 === "Door A" ? "PASS" : "FAIL"}`);
console.log();

const r3 = chooseCorrectDoor(false, "Door A");
console.log("Test 3: Door A is safe, asked Guard = Liar");
console.log(`  Algorithm outputs: ${r3}`);
console.log(`  Expected: Door A | ${r3 === "Door A" ? "PASS" : "FAIL"}`);
console.log();

const r4 = chooseCorrectDoor(true, "Door B");
console.log("Test 4: Door B is safe, asked Guard = Truth-teller");
console.log(`  Algorithm outputs: ${r4}`);
console.log(`  Expected: Door B | ${r4 === "Door B" ? "PASS" : "FAIL"}`);
