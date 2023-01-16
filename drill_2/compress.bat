@echo off 
set WinRAR_PATH="C:\Program Files\WinRAR"

echo     [92m.............................[0m   
echo     [92mDirectory and File Compressor[0m
echo     [92m.............................[0m


:main_select
echo. 
echo     [92m.............................[0m   
echo     [92m CHOSE TYPE of COMPRESSION [0m
echo     [92m ALL DIRECTORIES W FILES      [1][0m
echo     [92m ONLY ONE DIRECTORIES W FILES [2][0m
echo     [92m.............................[0m
    set /p type_compress= [94mSELECT TYPE: [0m
        if %type_compress% == 1 ( goto select_level )
        if %type_compress% == 2 ( goto select_level_only_one ) else ( goto error_type_compression) 

:select_level_only_one
echo. 
echo     [92m.............................[0m   
echo     [92mCompression Level from 1 to 5[0m
echo     [92m.............................[0m
    set /p compress_level_only_one= [94mSELECT LEVEL[0m: 
        if %compress_level_only_one% GEQ 1 if %compress_level_only_one% LEQ 5 (  goto select_only_one  )  else ( goto help_only_one )

:help_only_one
echo.
echo     [91m.............................[0m   
echo     [91mInvalid user selection please[0m
echo     [91mchose only from 1 2 3 4 and 5[0m
echo     [91m.............................[0m
goto select_level_only_one   

:select_only_one
dir /ad
echo. 
echo     [92m.............................[0m   
echo     [92m CHOSE ONE DIRECTORY [0m
echo     [92m.............................[0m
set /p dir_chose= NAME OF DIRECTORY: 
set /a count=0
echo.
if exist %dir_chose% ( set /a count=count + 1 ) else (  set /a count=count + 0 )
if %count%==1 ( goto check_select ) else ( goto error_select)


:check_select
echo. 
echo     [92m.............................[0m   
echo     [92m DIRECTORY %dir_chose% EXITS [0m
echo     [92m.............................[0m
goto setPassword

:error_select
echo. 
echo     [91m.............................[0m   
echo    [91m DIRECTORY %dir_chose% NOT EXITS [0m
echo     [91m.............................[0m
goto select_only_one

:setPassword
echo. 
echo     [92m............................. [0m 
echo     [92mSET PASSWORD TO YOUR FILES? [0m 
echo     [92mSET PASSWORD       [Y][0m 
echo     [92mDON'T SET PASSWORD [N][0m 
echo     [92m............................[0m 
    choice /C YN /M "SELECT: " 
        if %errorlevel% == 1 ( goto only_Pass )
        if %errorlevel% == 2 ( goto only_NoPass )

:only_NoPass
 
    for /D %%z in (%dir_chose%*) do (
        cd ./%%z
        rar a -m%compress_level_only_one% %%z
        move *.rar ../
        cd .. )
goto completed

:only_Pass
echo. 
echo     [96m.............................[0m   
echo     [96m CHOSE AND REMEMBER PASSWORD [0m
echo     [96m.............................[0m
set /p only_password= [94mSET PASSWORD: [0m
    for /D %%z in (%dir_chose%*) do (
        cd ./%%z
        rar a -m%compress_level_only_one% -p%only_password% %%z
        move *.rar ../
        cd .. )

        
goto completed

:error_type_compression
echo.
echo     [91m.............................[0m   
echo     [91m  SELECT ONLY FROM 1 AND 2   [0m
echo     [91m.............................[0m

goto main_select

:select_level
echo. 
echo     [92m.............................[0m   
echo     [92mCompression Level from 1 to 5[0m
echo     [92m.............................[0m
    set /p compress_level= [94mSELECT LEVEL[0m: 
        if %compress_level% GEQ 1 if %compress_level% LEQ 5 (  goto setPass  )  else ( goto help )

:help
    echo.
echo     [91m.............................[0m   
echo     [91mInvalid user selection please[0m
echo     [91mchose only from 1 2 3 4 and 5[0m
echo     [91m.............................[0m
goto select_level        

:setPass
  
    echo.
echo. 
echo     [92m.............................[0m   
echo     [92mSET UP PASSWORD TO YOUR FILES[0m
echo     [92mPRESS 1 [YES] OR PRESS 2 [NO][0m
echo     [92m.............................[0m
    set /p setpass= [94mYOUR CHOICE:[0m: 
        if %setpass% == 1 ( goto password_yes )
        if %setpass% == 2 ( goto password_no ) 

:password_yes
echo. 
echo     [96m.............................[0m   
echo     [96mCHOSE AND  REMEMBER  PASSWORD[0m
echo     [96m.............................[0m    
    set /p chosen_pass= [94mSET PASSWORD:[0m: 
    for /D %%z in (*) do (
        cd ./%%z
        rar a -m%compress_level% -p%chosen_pass% %%z
        move *.rar ../
        cd .. 
        )
    goto completed


:password_no
    for /D %%z in (*) do (
        cd ./%%z
        rar a -m%compress_level% %%z
        move *.rar ../
        cd .. )
            goto completed


:completed
echo.
echo     [96m.............................[0m   
echo     [96m   TASK FINISH COMPLETELY   [0m
echo     [96m.............................[0m

pause