# Two-Guard Riddle Algorithm - R implementation
# Usage: Rscript two_guard_riddle.R

chooseCorrectDoor <- function(askedIsTruthful, correctDoor) {
  otherIsTruthful <- !askedIsTruthful
  otherGuardAnswer <- if (otherIsTruthful) correctDoor else if (correctDoor == "left") "right" else "left"
  askedGuardReport <- if (askedIsTruthful) otherGuardAnswer else if (otherGuardAnswer == "left") "right" else "left"
  if (askedGuardReport == "left") "right" else "left"
}

cat("Two Guard Riddle - R Implementation\n")
cat("======================================\n\n")

for (correctDoor in c("left", "right")) {
  for (askedTruthful in c(TRUE, FALSE)) {
    choice0 <- chooseCorrectDoor(askedTruthful, correctDoor)
    status <- if (choice0 == correctDoor) "CORRECT" else "WRONG"
    askedStr <- if (askedTruthful) "truthful" else "lying"
    cat(sprintf("Correct door: %s | Asked guard: %s | Choice: %s | %s\n",
                correctDoor, askedStr, choice0, status))
  }
}
cat("\nAll scenarios completed.\n")
