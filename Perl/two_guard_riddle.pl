#!/usr/bin/perl
# Two-Guard Riddle Algorithm - Perl implementation
# Usage: perl two_guard_riddle.pl

sub choose_correct_door {
    my ($asked_is_truthful, $correct_door) = @_;
    my $other_is_truthful = !$asked_is_truthful;

    # 1. What the OTHER guard would say about the correct door
    my $other_says = $other_is_truthful
        ? $correct_door
        : ($correct_door eq "Door A" ? "Door B" : "Door A");

    # 2. What the ASKED guard will tell us
    my $asked_says = $asked_is_truthful
        ? $other_says
        : ($other_says eq "Door A" ? "Door B" : "Door A");

    # 3. The real door is the opposite of what we heard
    return ($asked_says eq "Door A") ? "Door B" : "Door A";
}

print "=== Two-Guard Riddle Algorithm (Perl) ===\n\n";

# Test 1: Door B safe, ask Liar
my $r1 = choose_correct_door(0, "Door B");
print "Test 1: Door B is safe, asked Guard = Liar\n";
print "  Algorithm outputs: $r1\n";
print "  Expected: Door B | " . ($r1 eq "Door B" ? "PASS" : "FAIL") . "\n\n";

# Test 2: Door A safe, ask Truth-teller
my $r2 = choose_correct_door(1, "Door A");
print "Test 2: Door A is safe, asked Guard = Truth-teller\n";
print "  Algorithm outputs: $r2\n";
print "  Expected: Door A | " . ($r2 eq "Door A" ? "PASS" : "FAIL") . "\n\n";

# Test 3: Door A safe, ask Liar
my $r3 = choose_correct_door(0, "Door A");
print "Test 3: Door A is safe, asked Guard = Liar\n";
print "  Algorithm outputs: $r3\n";
print "  Expected: Door A | " . ($r3 eq "Door A" ? "PASS" : "FAIL") . "\n\n";

# Test 4: Door B safe, ask Truth-teller
my $r4 = choose_correct_door(1, "Door B");
print "Test 4: Door B is safe, asked Guard = Truth-teller\n";
print "  Algorithm outputs: $r4\n";
print "  Expected: Door B | " . ($r4 eq "Door B" ? "PASS" : "FAIL") . "\n";
