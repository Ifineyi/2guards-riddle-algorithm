# Two-Guard Riddle Algorithm - PowerShell Implementation

function Choose-CorrectDoor {
    param(
        [bool] $AskedIsTruthful,
        [string] $CorrectDoor
    )

    $OtherIsTruthful = -not $AskedIsTruthful
    
    # 1. What the OTHER guard would say
    if ($OtherIsTruthful) {
        $OtherSays = $CorrectDoor
    } else {
        $OtherSays = if ($CorrectDoor -eq "Door A") { "Door B" } else { "Door A" }
    }
    
    # 2. What the ASKED guard will tell us
    if ($AskedIsTruthful) {
        $AskedSays = $OtherSays
    } else {
        $AskedSays = if ($OtherSays -eq "Door A") { "Door B" } else { "Door A" }
    }
    
    # 3. The real door is the opposite of what we heard
    if ($AskedSays -eq "Door A") {
        return "Door B"
    } else {
        return "Door A"
    }
}

Write-Host "=== Two-Guard Riddle Algorithm (PowerShell) ==="
Write-Host ""

$test1Result = Choose-CorrectDoor -AskedIsTruthful $false -CorrectDoor "Door B"
Write-Host "Test 1: Door B is safe, asked Guard = Liar"
Write-Host "  Algorithm outputs: $test1Result"
Write-Host "  Expected: Door B | $(if ($test1Result -eq 'Door B') { 'PASS' } else { 'FAIL' })"
Write-Host ""

$test2Result = Choose-CorrectDoor -AskedIsTruthful $true -CorrectDoor "Door A"
Write-Host "Test 2: Door A is safe, asked Guard = Truth-teller"
Write-Host "  Algorithm outputs: $test2Result"
Write-Host "  Expected: Door A | $(if ($test2Result -eq 'Door A') { 'PASS' } else { 'FAIL' })"
Write-Host ""

$test3Result = Choose-CorrectDoor -AskedIsTruthful $false -CorrectDoor "Door A"
Write-Host "Test 3: Door A is safe, asked Guard = Liar"
Write-Host "  Algorithm outputs: $test3Result"
Write-Host "  Expected: Door A | $(if ($test3Result -eq 'Door A') { 'PASS' } else { 'FAIL' })"
Write-Host ""

$test4Result = Choose-CorrectDoor -AskedIsTruthful $true -CorrectDoor "Door B"
Write-Host "Test 4: Door B is safe, asked Guard = Truth-teller"
Write-Host "  Algorithm outputs: $test4Result"
Write-Host "  Expected: Door B | $(if ($test4Result -eq 'Door B') { 'PASS' } else { 'FAIL' })"
