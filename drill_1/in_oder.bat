@echo off
set /p first_var="First Num:"
set /p second_var="Second Num:"
set /p third_var="Third Num:"
set /A count = 0

if %first_var% leq %second_var% (
	set /A count +=1
)
if %first_var% leq %third_var% (
	set /A count +=1
) 
if %second_var% leq %third_var% (
	set /A count +=1
) 




set /A countgtr = 0
if %first_var% geq %second_var% (
	set /A countgtr +=1
)
if %first_var% geq %third_var% (
	set /A countgtr +=1
) 
if %second_var% geq %third_var% (
	set /A countgtr +=1
) 

set /A print =0
if %countgtr%==3 ( 
 set /A print +=1
)
if %count%==3 ( 
 set /A print +=1
)

if %print% geq 1 (
echo %first_var% %second_var% %third_var% is IN order 
) else (
echo %first_var% %second_var% %third_var% is NOT order 
)



