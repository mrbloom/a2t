@echo off

echo HELP:
echo whisperls PATH_TO_FILES EXT_OF_FILES MODEL_NAME OTHER_WHISPER_OPTIONS_IN_QOUTES

setlocal EnableDelayedExpansion

set "PATH=%PATH%;.\venv\Scripts"
set "dir=%~1"
set "ext=%~2"
set "modelname=%~3" 
set "otherOpts=%~4"

for /r "%dir%" %%f in (*.%ext%) do (	
	set "filename=%%~nf"
    set "nameext=%%~nxf"
    set "pathfile=%%~dpf"

    if exist !pathfile!!filename!.txt (	
		echo "!pathfile!!filename!.txt exists" 
    ) else ( 
		set "pathantislash=!pathfile:~0,-1!"    	
		echo Recognize begins with opts:
		echo whisper "%%f" --model_dir "models" --model %modelname% --output_dir "!pathantislash!" --output_format srt !otherOpts! 
		   
		whisper "%%f" --model_dir "models" --model !modelname! --output_dir "!pathantislash!" --output_format srt !otherOpts! 
    )
)

pause