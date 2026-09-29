// Two-Guard Riddle Algorithm - C# (.NET)
// Compile: cd CSharp && dotnet build -c Release -o out
// Run: dotnet run

using System;

class TwoGuardRiddle
{
    static string FindFreedomDoor(bool askTruthful, string correctDoor)
    {
        // 1. What the OTHER guard would say
        bool otherIsTruthful = !askTruthful;
        string otherSays = otherIsTruthful
            ? correctDoor
            : (correctDoor == "Door A" ? "Door B" : "Door A");
        
        // 2. What the ASKED guard says about other's answer
        string askedSays = askTruthful
            ? otherSays
            : (otherSays == "Door A" ? "Door B" : "Door A");
        
        // 3. Opposite = freedom
        return askedSays == "Door A" ? "Door B" : "Door A";
    }
    
    static void RunTest(bool askTruthful, string correctDoor, int n)
    {
        string result = FindFreedomDoor(askTruthful, correctDoor);
        string verdict = result == correctDoor ? "PASS" : "FAIL";
        string who = askTruthful ? "Truth-teller" : "Liar";
        string door = correctDoor == "Door A" ? "A" : "B";
        
        Console.WriteLine($"Test {n}: Door {door} is safe, asked Guard = {who}");
        Console.WriteLine($"  Algorithm outputs: {result}");
        Console.WriteLine($"  Expected: {correctDoor} | {verdict}");
        Console.WriteLine();
    }
    
    static void Main()
    {
        Console.WriteLine("=== Two-Guard Riddle Algorithm (C#) ===");
        Console.WriteLine();
        RunTest(false, "Door B", 1);
        RunTest(true, "Door A", 2);
        RunTest(false, "Door A", 3);
        RunTest(true, "Door B", 4);
    }
}
