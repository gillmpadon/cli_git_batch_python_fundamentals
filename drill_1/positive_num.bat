@echo off
set /p x= FirstNum:
set /p y= SecondNum:

set /a oddEven_x = %x% %%2
set /a oddEven_y = %y% %%2

set /a add = %x%+%y% 
set /a sub = %x%-%y% 
set /a mul = %x%*%y% 
set /a ave = %add%/2

echo sum is %add%
echo dif is %sub%
echo pro is %mul%
echo ave is %ave%

if  %oddEven_x% equ 0 (
	echo %x% is even
)else (
	echo %x% is odd
)

if  %oddEven_y% equ 0 (
	echo %y% is even
)else (
	echo %y% is odd
)

if %x% geq %y% (
	echo maximum is %x%
	echo minimum is %y% 
) else (
	echo maximum is %y%
	echo minimum is %x% 
)
 

