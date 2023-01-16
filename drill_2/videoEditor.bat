@echo off
set FFMPEG_PATH="C:\Program Files\ffmpeg\bin"

goto main

:main
echo.
echo     [92m.............................[0m   
echo     [92mVIDEO EDITOR W FFMPEG UTILITY[0m
echo     [92m.............................[0m
echo        [96m[A]RESIZE VIDEO BY QUALITY [0m
echo        [96m[B]CONCATE ALL MP4 VIDEOS [0m
echo        [96m[C]CUT LENGTH OF VIDEO[0m
echo        [96m[D]HOW TO USE[0m  

 choice /C ABCD /M "SELECT OPTIONS:"
    if %errorlevel% == 1 ( goto resizeA )
    if %errorlevel% == 2 ( goto ConcateB)
    if %errorlevel% == 3 ( goto cutVideoC)
    if %errorlevel% == 3 ( goto helpuser)
:helpuser
cls
echo.
echo     [92m.............................[0m   
echo     [92m    INSTRUCTION OF USAGE[0m
echo     [92m.............................[0m
echo.
echo [96mOption RESIZE A have options such as low , medium and high [0m
echo [96m       you will have to select a video and change it quality this makes the file size changes[0m
echo.
echo [96mOption CONCAT B will combine all mp4 videos to one output video[0m
echo.
echo [96mOption CONCAT C will cut your selected video through give format hour:minute:seconds "00:00:00" [0m
echo [96m       you will select the start time and end of cutting of length of the selected video[0m
echo.
echo [91mIMPORTANT NOTE IS THAT ALL OF THE VIDEO YOU WANT TO EDIT MUST BE IN THE SAME DIRECTORY OR FOLDER[0m
goto main

:resizeA
dir /on *.mp4
echo.
echo     [92m.............................[0m   
echo     [92m    VIDEO RESIZE[0m
echo     [92m.............................[0m
echo.
        set /p name_video=[94mVideo name: [0m
        set /p newname_video=[94mOutput video name:[0m

echo.
echo     [92m.............................[0m   
echo     [92m       RESIZE VIDEO [0m
echo     [92m   CHOSE VIDEO QUALITY [0m
echo     [92mLOW    QUALITY [L] [0m
echo     [92mMEDIUM QUALITY [M] [0m
echo     [92mHIGH   QUALITY [H] [0m
echo     [92m.............................[0m
    choice /C LMH /M "Choose video quality:"

    if %errorlevel% == 1 ( goto low_quality )
    if %errorlevel% == 2 ( goto medium_quality)
    if %errorlevel% == 3 ( goto high_quality)

    :low_quality
        ffmpeg -i %name_video%  -c:a copy -c:v libx264 -b:v 1200k -r 24 -s 480x270 %newname_video%.mp4
        goto completed
    :medium_quality
        ffmpeg -i %name_video%  -c:a copy -c:v libx264 -b:v 1500k -r 28 -s 1280x720 %newname_video%.mp4
        goto completed
    :high_quality
        ffmpeg -i %name_video%  -c:a copy -c:v libx264 -b:v 2m -r 30 -s 1920x1080 %newname_video%.mp4 
        goto completed

:ConcateB
echo.
echo     [92m.............................[0m   
echo     [92m    VIDEO CONCATENATE[0m
echo     [92m.............................[0m
echo.
set /p name_video_concat=[94mEnter the output name:[0m 
(for %%G in (*.mp4 *.MOV *.WMV *.AVI *.AVCHD *.FLV *.F4V *.SWF *.MKV *.WEBM) do @echo file '%%G') > %name_video_concat%.txt
ffmpeg -safe 0 -f concat -i %name_video_concat%.txt -c copy %name_video_concat%.mp4
goto concat_message

:concat_message
echo this is a text showing that the file video of %name_video_concat% is composed of video list/s above >> %name_video_concat%.txt
echo.
echo     [96m.............................[0m   
echo     [96m    DONE CONCATE ALL VIDEO[0m
echo     [96mOUTPUT NAME IS %name_video_concat%[0m
echo     [96mREAD %name_video_concat% to see lists[0m
echo     [96m.............................[0m
goto completed


:cutVideoC
dir /on *.mp4
echo.
echo     [92m.............................[0m   
echo     [92m        Video Cutter[0m
echo     [92m    Follow Time Format[0m
echo     [92m    HOUR:MINUTES:SECONDS[0m
echo     [92m        00:00:00[0m
echo     [92m.............................[0m
set /p video_name=[96mVideo File Name:[0m 
 set /p video_start=[96mCut Start Time:[0m  
 set /p video_end=[96mCut End Time:[0m 
 set /p name_video_cut= Enter the output name: 
 ffmpeg -i %video_name% -ss %video_start% -to %video_end% -c copy %name_video_cut%.mp4
goto completed


:completed
echo.
echo     [96m.............................[0m   
echo     [96m   TASK FINISH COMPLETELY   [0m
echo     [96m.............................[0m
pause