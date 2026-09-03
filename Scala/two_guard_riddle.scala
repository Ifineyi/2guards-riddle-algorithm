// Two-Guard Riddle Algorithm - Scala implementation
// Usage: scalac -d . two_guard_riddle.scala && scala TwoGuardRiddle

object TwoGuardRiddle {
  def chooseCorrectDoor(askedIsTruthful: Boolean, correctDoor: String): String = {
    val otherIsTruthful = !askedIsTruthful
    val otherGuardAnswer = if (otherIsTruthful) correctDoor
        else if (correctDoor == "Door A") "Door B" else "Door A"
    val askedGuardReport = if (askedIsTruthful) otherGuardAnswer
        else if (otherGuardAnswer == "Door A") "Door B" else "Door A"
    if (askedGuardReport == "Door A") "Door B" else "Door A"
  }

  def main(args: Array[String]): Unit = {
    println("=== Two-Guard Riddle Algorithm (Scala) ===")
    println()
    val scenarios = List(
      (false, "Door B", 1),
      (true, "Door A", 2),
      (false, "Door A", 3),
      (true, "Door B", 4)
    )
    scenarios.foreach { case (asked, correct, n) =>
      val result = chooseCorrectDoor(asked, correct)
      val who = if (asked) "Truth-teller" else "Liar"
      val letter = if (correct == "Door A") "A" else "B"
      val verdict = if (result == correct) "PASS" else "FAIL"
      println(s"Test $n: Door $letter is safe, asked Guard = $who")
      println(s"  Algorithm outputs: $result")
      println(s"  Expected: $correct | $verdict")
      println()
    }
  }
}
