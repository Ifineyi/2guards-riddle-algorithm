// Two-Guard Riddle Algorithm - Kotlin implementation
// Usage: kotlinc two_guard_riddle.kt -include-runtime -d two_guard_riddle.jar && java -jar two_guard_riddle.jar

fun chooseCorrectDoor(askedGuardIsTruthful: Boolean, correctDoor: String): String {
    val otherGuardIsTruthful = !askedGuardIsTruthful

    // 1. What would the OTHER guard say?
    val otherGuardResponse = if (otherGuardIsTruthful) correctDoor
    else if (correctDoor == "Door A") "Door B" else "Door A"

    // 2. What does the ASKED guard say?
    val finalResponse = if (askedGuardIsTruthful) otherGuardResponse
    else if (otherGuardResponse == "Door A") "Door B" else "Door A"

    // 3. Take the opposite
    return if (finalResponse == "Door A") "Door B" else "Door A"
}

fun runTest(asked: Boolean, correct: String, n: Int) {
    val result = chooseCorrectDoor(asked, correct)
    val who = if (asked) "Truth-teller" else "Liar"
    val letter = if (correct == "Door A") "A" else "B"
    val verdict = if (result == correct) "PASS" else "FAIL"
    println("Test $n: Door $letter is safe, asked Guard = $who")
    println("  Algorithm outputs: $result")
    println("  Expected: $correct | $verdict")
    println()
}

fun main() {
    println("=== Two-Guard Riddle Algorithm (Kotlin) ===")
    println()
    runTest(false, "Door B", 1)
    runTest(true, "Door A", 2)
    runTest(false, "Door A", 3)
    runTest(true, "Door B", 4)
}

fun main(args: Array<String>) = main()
