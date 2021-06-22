
:BEGINNING
@ECHO OFF


:ANTIVIRUS_WARNING
ECHO.
ECHO. ! PLEASE MAKE SURE THAT ANTIVIRUS ALLOWING TO EXECUTE THIS SCRIPT !
ECHO.


:APP_INSTALLATION_CHECK
WHERE DOT.EXE
IF %ERRORLEVEL% NEQ 0 (
    ECHO ----------------------------------------
	ECHO Fatal error!
	ECHO  Graphviz does not installed [dot.exe didn't detected]
	ECHO  Please install it from: https://graphviz.org/download/
	EXIT 1
) ELSE (
    ECHO ----------------------------------------
	ECHO Graphviz: seems to be ok, processing.
	ECHO | SET /p = "^- Folder:  " & WHERE DOT.EXE
	ECHO | SET /p = "^- Version: " & DOT.EXE -V
)


:SCRIPT_SETTINGS
SET file_name=tree
SET path_input_file=\src\%file_name%.dot
SET path_output_file=\out\%file_name%
SET path_log_file=\out\compile_datetime.txt
CD /D %CD%\..
ECHO ----------------------------------------
ECHO Used variables
ECHO. ! Input file name:  "%file_name%";
ECHO. ! Project dir:      "%CD%";
ECHO. ! Input file path:  ".%path_input_file%";
ECHO. ! Output file path: ".%path_output_file%";
ECHO. ! Log file path:    ".%path_log_file%".


:GRAPHS_COMPILING
ECHO ----------------------------------------
ECHO Graphs Compiling
ECHO. ! [1/2] ".svg" file generating..
DOT.EXE -Tsvg "%CD%%path_input_file%">"%CD%%path_output_file%.svg"

ECHO. ! [2/2] ".png" file generating..
DOT.EXE -Tpng "%CD%%path_input_file%">"%CD%%path_output_file%.png"


:LOGS_PROCESSING
ECHO ----------------------------------------
ECHO Log file generating
ECHO ^- Date record & DATE /t 1>  "%CD%%path_log_file%"
ECHO ^- Time record & TIME /t 1>> "%CD%%path_log_file%"
@REM ECHO ^- UTC record


@REM :README_UPDATE
@REM To replace "ÜTC" in README.MD
@REM FOR /f %%i IN ('DATE /t') DO SET compile_datetime=%%i


:END
ECHO ----------------------------------------
SET exit_timeout=10
ECHO Waiting for %exit_timeout% seconds and exit...
PING -n %exit_timeout% 127.0.0.1 1> NUL
@REM PAUSE
EXIT %ERRORLEVEL%
