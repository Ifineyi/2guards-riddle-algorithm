! Two-Guard Riddle Algorithm - Fortran implementation
! Usage: gfortran two_guard_riddle.f90 -o two_guard_riddle.exe && two_guard_riddle.exe

program TwoGuardRiddle
    implicit none
    character(len=10) :: correct_door, choice, asked_str, status
    logical :: asked_truthful, other_is_truthful
    character(len=10) :: other_guard_answer, asked_guard_report
    integer :: i, j
    
    print *, "Two Guard Riddle - Fortran Implementation"
    print *, "============================================"
    print *, ""
    
    do i = 1, 2
        if (i == 1) then
            correct_door = "left"
        else
            correct_door = "right"
        end if
        
        do j = 1, 2
            if (j == 1) then
                asked_truthful = .true.
            else
                asked_truthful = .false.
            end if
            
            other_is_truthful = .not. asked_truthful
            
            if (other_is_truthful) then
                other_guard_answer = correct_door
            else
                if (correct_door == "left") then
                    other_guard_answer = "right"
                else
                    other_guard_answer = "left"
                end if
            end if
            
            if (asked_truthful) then
                asked_guard_report = other_guard_answer
            else
                if (other_guard_answer == "left") then
                    asked_guard_report = "right"
                else
                    asked_guard_report = "left"
                end if
            end if
            
            if (asked_guard_report == "left") then
                choice = "right"
            else
                choice = "left"
            end if
            
            if (choice == correct_door) then
                status = "CORRECT"
            else
                status = "WRONG"
            end if
            
            if (asked_truthful) then
                asked_str = "truthful"
            else
                asked_str = "lying"
            end if
            
            print *, "Correct door:", trim(correct_door), "| Asked guard:", trim(asked_str), &
                     "| Choice:", trim(choice), "|", trim(status)
        end do
    end do
    
    print *, ""
    print *, "All scenarios completed."
end program TwoGuardRiddle
