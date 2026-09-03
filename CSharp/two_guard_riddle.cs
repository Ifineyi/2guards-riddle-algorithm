:: Two-Guard Riddle Algorithm - C# (.NET)
:: Compile: cd CSharp && dotnet build -c Release -o out
:: Run: cd CSharp && dotnet run

using System;

class TwoGuardRiddle
{
    static string FindFreedomDoor(bool askTruthful, string correctDoor)
    {
        // 1. Determine what the OTHER guard would say
        bool otherIsTruthful = !askTruthful;
        string otherSays = otherIsTruthful
            ? correctDoor
            : (correctDoor == "Door A" ? "Door B" : "Door A");
        
        // 2. Determine what the ASKED guard would say about other's answer
        string askedSays = askTruthful
            ? otherSays
            : (otherSays == "Door A" ? "Door B" : "Door A");
        
        // 3. Take opposite → freedom door
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
        RunTest(false, "Door B", 1);  // Ask Liar → Door B is safe
        RunTest(true, "Door A", 2);   // Ask Truth-teller → Door A is safe
        RunTest(false, "Door A", 3);  // Ask Liar → Door A is safe
        RunTest(true, "Door B", 4);   // Ask Truth-teller → Door B is safe
    }
}
