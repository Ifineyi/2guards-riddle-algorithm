       IDENTIFICATION DIVISION.
       PROGRAM-ID. TwoGuardRiddle.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  Correct-Door        PIC X(4).
       01  Choice              PIC X(4).
       01  Asked-Str-Fld       PIC X(9).
       01  Result-Status       PIC X(7).
       01  J                  PIC 9 VALUE 1.
       01  I                  PIC 9 VALUE 1.
       01  Asked-Truthful     PIC X(9).
       01  Other-Guard-Answer  PIC X(4).
       01  Asked-Guard-Report  PIC X(4).
       01  Other-Is-Truthful  PIC X(9).
       01  Msg                PIC X(80).
       
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY "Two Guard Riddle - COBOL Implementation".
           DISPLAY "============================================".
           DISPLAY " ".
           
           PERFORM VARYING I FROM 1 BY 1 UNTIL I > 2
               IF I = 1 MOVE "left" TO Correct-Door END-IF
               IF I = 2 MOVE "right" TO Correct-Door END-IF
               
               PERFORM VARYING J FROM 1 BY 1 UNTIL J > 2
                   EVALUATE J
                       WHEN 1 MOVE "truthful" TO Asked-Truthful
                       WHEN 2 MOVE "lying" TO Asked-Truthful
                   END-EVALUATE
                   
                   IF Asked-Truthful = "truthful"
                       MOVE "lying" TO Other-Is-Truthful
                   ELSE
                       MOVE "truthful" TO Other-Is-Truthful
                   END-IF
                   
                   IF Other-Is-Truthful = "truthful"
                       MOVE Correct-Door TO Other-Guard-Answer
                   ELSE
                       IF Correct-Door = "left" THEN
                           MOVE "right" TO Other-Guard-Answer
                       ELSE
                           MOVE "left" TO Other-Guard-Answer
                       END-IF
                   END-IF
                   
                   IF Asked-Truthful = "truthful"
                       MOVE Other-Guard-Answer TO Asked-Guard-Report
                   ELSE
                       IF Other-Guard-Answer = "left" THEN
                           MOVE "right" TO Asked-Guard-Report
                       ELSE
                           MOVE "left" TO Asked-Guard-Report
                       END-IF
                   END-IF
                   
                   IF Asked-Guard-Report = "left" THEN
                       MOVE "right" TO Choice
                   ELSE
                       MOVE "left" TO Choice
                   END-IF
                   
                   IF Choice = Correct-Door
                       MOVE "CORRECT" TO Result-Status
                   ELSE
                       MOVE "WRONG" TO Result-Status
                   END-IF
                   
                   IF Asked-Truthful = "truthful" THEN
                       MOVE "truthful" TO Asked-Str-Fld
                   ELSE
                       MOVE "lying" TO Asked-Str-Fld
                   END-IF
                   
                   MOVE "Correct door: " TO Msg
                   STRING Correct-Door " | Asked guard: " Asked-Str-Fld
                          " | Choice: " Choice " | " Result-Status
                          INTO Msg
                   END-STRING
                   DISPLAY Msg
               END-PERFORM
           END-PERFORM.
           
           DISPLAY " ".
           DISPLAY "All scenarios completed.".
           STOP RUN.