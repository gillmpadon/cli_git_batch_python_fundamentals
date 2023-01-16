@echo off
set /p stuFname="firstName:"
set /p stuLname="lastName:"
set /p stuNum="studentNumber:"
mkdir %stuNum%
type nul > .\%stuNum%\%stuFname%-%stuLname%.txt
echo First name is %stuFname% >> .\%stuNum%\%stuFname%-%stuLname%.txt
echo Last name is %stuLname% >> .\%stuNum%\%stuFname%-%stuLname%.txt
echo Student number is %stuNum% >> .\%stuNum%\%stuFname%-%stuLname%.txt

set /p countPet="counPet:"

type nul > .\%stuNum%\pets.txt
for /L %%i in ( 1,1, %countPet%) do ( 
echo petName %%i :
set /p usr="" 
setlocal EnableDelayedExpansion
echo !usr! >> .\%stuNum%\pets.txt 
endlocal
)

echo Succesfully created!

