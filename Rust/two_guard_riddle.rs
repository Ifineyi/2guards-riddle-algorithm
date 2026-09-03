use std::io::Write;

fn choose_correct_door(asked_is_truthful: bool, correct_door: &str) -> String {
    let other_is_truthful = !asked_is_truthful;

    let other_says = if other_is_truthful {
        correct_door.to_string()
    } else {
        if correct_door == "Door A" { "Door B".to_string() }
        else { "Door A".to_string() }
    };

    let asked_says = if asked_is_truthful {
        other_says.clone()
    } else {
        if other_says == "Door A" { "Door B".to_string() }
        else { "Door A".to_string() }
    };

    if asked_says == "Door A" { "Door B".to_string() }
    else { "Door A".to_string() }
}

fn main() {
    let stdout = std::io::stdout();
    let mut handle = stdout.lock();

    writeln!(handle, "=== Two-Guard Riddle Algorithm (Rust) ===").unwrap();
    writeln!(handle).unwrap();

    let tests = [
        (false, "Door B", "Door B is safe, asked Guard = Liar"),
        (true,  "Door A", "Door A is safe, asked Guard = Truth-teller"),
        (false, "Door A", "Door A is safe, asked Guard = Liar"),
        (true,  "Door B", "Door B is safe, asked Guard = Truth-teller"),
    ];

    for (i, (asked, correct, label)) in tests.iter().enumerate() {
        let result = choose_correct_door(*asked, correct);
        let verdict = if result == *correct { "PASS" } else { "FAIL" };
        writeln!(handle, "Test {}: {}", i + 1, label).unwrap();
        writeln!(handle, "  Algorithm outputs: {}", result).unwrap();
        writeln!(handle, "  Expected: {} | {}", correct, verdict).unwrap();
        writeln!(handle).unwrap();
    }
}
