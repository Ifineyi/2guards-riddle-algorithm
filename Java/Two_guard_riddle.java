public class Two_guard_riddle {
    public static String findFreedomDoor(boolean askTruthful, String correctDoor) {
        boolean otherIsTruthful = !askTruthful;
        String otherSays;
        if (otherIsTruthful) {
            otherSays = correctDoor;
        } else {
            otherSays = correctDoor.equals("left") ? "right" : "left";
        }
        String reportedAnswer;
        if (askTruthful) {
            reportedAnswer = otherSays;
        } else {
            reportedAnswer = otherSays.equals("left") ? "right" : "left";
        }
        return reportedAnswer.equals("left") ? "right" : "left";
    }
    
    public static void main(String[] args) {
        System.out.println("Two Guard Riddle - Java Implementation");
        System.out.println("=========================================");
        System.out.println();
        String[] doors = {"left", "right"};
        boolean[] guardTypes = {true, false};
        for (int i = 0; i < 2; i++) {
            String correctDoor = doors[i];
            for (int j = 0; j < 2; j++) {
                boolean askTruthful = guardTypes[j];
                String askedGuard = askTruthful ? "truthful" : "lying";
                String choice = findFreedomDoor(askTruthful, correctDoor);
                String status = choice.equals(correctDoor) ? "CORRECT" : "WRONG";
                System.out.println("Correct door: " + correctDoor +
                    " | Asked guard: " + askedGuard +
                    " | Choice: " + choice +
                    " | " + status);
            }
        }
        System.out.println();
        System.out.println("All scenarios completed.");
    }
}