
:BEGINNING
@ECHO OFF


:SCRIPT_SETTINGS
SET file_name=tree
SET path_input_file=\src\%file_name%.dot
SET path_output_file=\out\%file_name%
SET path_log_file=\out\compile_datetime.txt
SET graphviz_exe=DOT.EXE


:ANTIVIRUS_WARNING
ECHO.
ECHO. ! PLEASE MAKE SURE THAT ANTIVIRUS ALLOWING TO EXECUTE THIS SCRIPT !
ECHO.


:APP_INSTALLATION_CHECK
ECHO Checking Graphviz installation...
WHERE /Q %graphviz_exe%
IF %ERRORLEVEL% NEQ 0 (
	ECHO FATAL ERROR!
	ECHO. ^^- Graphviz seems does not installed ^(%graphviz_exe% didn't detected^)
	ECHO. ^^- Please install it from https://graphviz.org/download/ or chocolatey.
    ECHO ----------------------------------------
	EXIT 1
) ELSE (
	ECHO. ^^- Seems to be installed, processing.
)
ECHO Getting information about Graphviz app...
%graphviz_exe% -V
WHERE %graphviz_exe%


:SETTINGS_PRINT
CD /D %CD%\..
ECHO ----------------------------------------
ECHO. [ Used variables ]
ECHO. ^^- Input file name:  "%file_name%";
ECHO. ^^- Project dir:      "%CD%";
ECHO. ^^- Input file path:  ".%path_input_file%";
ECHO. ^^- Output file path: ".%path_output_file%";
ECHO. ^^- Log file path:    ".%path_log_file%".


:GRAPHS_COMPILING
ECHO ----------------------------------------
ECHO. [ Graphs Compiling ]
ECHO. ^^- [1/2] ".svg" file generating..
%graphviz_exe% -Tsvg "%CD%%path_input_file%">"%CD%%path_output_file%.svg"

ECHO. ^^- [2/2] ".png" file generating..
%graphviz_exe% -Tpng "%CD%%path_input_file%">"%CD%%path_output_file%.png"


:LOGS_PROCESSING
ECHO ----------------------------------------
ECHO. [ Log file generating ]
ECHO. ^^- Date record & DATE /t 1>  "%CD%%path_log_file%"
ECHO. ^^- Time record & TIME /t 1>> "%CD%%path_log_file%"
@REM ECHO. ^^- UTC record


@REM :README_UPDATE
@REM To replace "ÜTC" in README.MD
@REM FOR /f %%i IN ('DATE /t') DO SET compile_datetime=%%i


:END
ECHO ----------------------------------------
@REM SET exit_timeout=10
@REM ECHO Waiting for %exit_timeout% seconds and exit...
@REM PING -n %exit_timeout% 127.0.0.1 1> NUL
@REM PAUSE
ECHO Goodbye!
EXIT %ERRORLEVEL%
