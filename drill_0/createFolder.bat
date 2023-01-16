@echo off
set /p name="Type folder Name:"
set /p num="Count of Folder:"
for  /l %%z in (1, 1, %num%) do mkdir %name%-%%z | echo %name%-%%z
echo Succesfully created!