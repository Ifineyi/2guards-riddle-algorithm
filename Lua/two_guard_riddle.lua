-- Two-Guard Riddle Algorithm - Lua implementation
-- Usage: lua two_guard_riddle.lua

function chooseCorrectDoor(askedIsTruthful, correctDoor)
    local otherIsTruthful = not askedIsTruthful
    
    local otherSays
    if otherIsTruthful then
        otherSays = correctDoor
    else
        otherSays = (correctDoor == "Door A") and "Door B" or "Door A"
    end
    
    local askedSays
    if askedIsTruthful then
        askedSays = otherSays
    else
        askedSays = (otherSays == "Door A") and "Door B" or "Door A"
    end
    
    return (askedSays == "Door A") and "Door B" or "Door A"
end

print("=== Two-Guard Riddle Algorithm (Lua) ===")
print()

local tests = {
    {false, "Door B", "Door B is safe, asked Guard = Liar"},
    {true,  "Door A", "Door A is safe, asked Guard = Truth-teller"},
    {false, "Door A", "Door A is safe, asked Guard = Liar"},
    {true,  "Door B", "Door B is safe, asked Guard = Truth-teller"},
}

for i, test in ipairs(tests) do
    local asked, correct, label = test[1], test[2], test[3]
    local result = chooseCorrectDoor(asked, correct)
    local verdict = (result == correct) and "PASS" or "FAIL"
    print("Test " .. (i+1) .. ": " .. label)
    print("  Algorithm outputs: " .. result)
    print("  Expected: " .. correct .. " | " .. verdict)
    print()
end
