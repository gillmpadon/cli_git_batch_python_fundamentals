
@echo off
set /p x= FirstNum:
set /p y= SecondNum:

if %x% gtr %y% (
    echo the largest is %x%
) else (
    echo the largest is %y%
)

if %x% lss %y% (
    echo the lowest is %x%
) else (
    echo the lowest is %y%
)

if %x% equ %y% (echo ERROR )

pause