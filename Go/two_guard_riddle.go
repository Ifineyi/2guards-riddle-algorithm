package main

import "fmt"

func chooseCorrectDoor(askedIsTruthful bool, correctDoor string) string {
    otherIsTruthful := !askedIsTruthful

    var otherSays string
    if otherIsTruthful {
        otherSays = correctDoor
    } else {
        if correctDoor == "Door A" {
            otherSays = "Door B"
        } else {
            otherSays = "Door A"
        }
    }

    var askedSays string
    if askedIsTruthful {
        askedSays = otherSays
    } else {
        if otherSays == "Door A" {
            askedSays = "Door B"
        } else {
            askedSays = "Door A"
        }
    }

    if askedSays == "Door A" {
        return "Door B"
    }
    return "Door A"
}

func main() {
    fmt.Println("=== Two-Guard Riddle Algorithm (Go) ===")
    fmt.Println()

    type test struct {
        asked   bool
        correct string
        label   string
    }

    tests := []test{
        {false, "Door B", "Door B is safe, asked Guard = Liar"},
        {true,  "Door A", "Door A is safe, asked Guard = Truth-teller"},
        {false, "Door A", "Door A is safe, asked Guard = Liar"},
        {true,  "Door B", "Door B is safe, asked Guard = Truth-teller"},
    }

    for i, t := range tests {
        result := chooseCorrectDoor(t.asked, t.correct)
        verdict := "FAIL"
        if result == t.correct {
            verdict = "PASS"
        }
        fmt.Printf("Test %d: %s\n", i+1, t.label)
        fmt.Printf("  Algorithm outputs: %s\n", result)
        fmt.Printf("  Expected: %s | %s\n\n", t.correct, verdict)
    }
}
