-- Two-Guard Riddle Algorithm - Haskell implementation
-- Usage: runhaskell two_guard_riddle.hs
--    or: ghc -o two_guard_riddle two_guard_riddle.hs && ./two_guard_riddle

chooseCorrectDoor :: Bool -> String -> String
chooseCorrectDoor askedGuardIsTruthful correctDoor =
    let otherGuardIsTruthful = not askedGuardIsTruthful
        otherGuardResponse
            | otherGuardIsTruthful = correctDoor
            | otherwise = if correctDoor == "Door A" then "Door B" else "Door A"
        finalResponse
            | askedGuardIsTruthful = otherGuardResponse
            | otherwise = if otherGuardResponse == "Door A" then "Door B" else "Door A"
    in if finalResponse == "Door A" then "Door B" else "Door A"

runTest :: Bool -> String -> Int -> IO ()
runTest asked correct n = do
    let result = chooseCorrectDoor asked correct
        who = if asked then "Truth-teller" else "Liar"
        letter = if correct == "Door A" then "A" else "B"
        verdict = if result == correct then "PASS" else "FAIL"
    putStrLn $ "Test " ++ show n ++ ": Door " ++ letter ++ " is safe, asked Guard = " ++ who
    putStrLn $ "  Algorithm outputs: " ++ result
    putStrLn $ "  Expected: " ++ correct ++ " | " ++ verdict
    putStrLn ""

main :: IO ()
main = do
    putStrLn "=== Two-Guard Riddle Algorithm (Haskell) ==="
    putStrLn ""
    runTest False "Door B" 1
    runTest True "Door A" 2
    runTest False "Door A" 3
    runTest True "Door B" 4
