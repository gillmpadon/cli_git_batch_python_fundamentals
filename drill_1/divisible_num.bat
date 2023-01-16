@echo off
SetLocal EnableDelayedExpansion
set /p var=Num to Test:
set /p iterate=Inceasing or Deceasing? (i/d):
set /p starVar=Num Start:
set /p endVar=Num End:
set /a count = 0
set /a lower = starVar
set /a higher = endVar
set /a Inceasing = "i"
set /a Deceasing = "d"
set /a choose =0
if !iterate! == !Inceasing! (
    call :makeIterate_Increase


)
if !iterate! == !Deceasing! (
   call :makeIterate_Decrease

)

:makeIterate_Increase
 set /a starVar = starVar + var
IF %starVar% leq %endVar% if %starVar% gtr 0 (
    echo %starVar%
    set /a count = count + 1
    GOTO :makeIterate_Increase   
)


echo there are %count% numbers from %lower% - %higher% that are divisible by %var%



