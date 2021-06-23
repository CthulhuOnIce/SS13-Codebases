
:BEGINNING
@ECHO OFF


:SCRIPT_SETTINGS
SET file_name=tree
SET path_input_file=src\%file_name%.dot
SET path_output_file=out\%file_name%
SET path_log_file=out\compile_datetime.txt
SET graphviz_app_file=DOT.EXE


:ANTIVIRUS_WARNING
ECHO.
ECHO. ! PLEASE MAKE SURE THAT ANTIVIRUS ALLOWING TO EXECUTE THIS SCRIPT !
ECHO.


:APP_INSTALLATION_CHECK
ECHO Checking Graphviz installation...
WHERE /Q %graphviz_app_file%
IF %ERRORLEVEL% NEQ 0 (
	ECHO FATAL ERROR!
	ECHO. ^^- Graphviz seems does not installed ^(%graphviz_app_file% didn't detected^).
	ECHO. ^^- Please install it from https://graphviz.org/download/ or chocolatey.
    ECHO ----------------------------------------
	EXIT 1
) ELSE (
	ECHO. ^^- Seems to be installed, processing.
)
ECHO Getting information about Graphviz app...
%graphviz_app_file% -V
WHERE %graphviz_app_file%


:SETTINGS_PRINT
CD /D %CD%\..\
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
%graphviz_app_file% -Tsvg "%CD%\%path_input_file%">"%CD%\%path_output_file%.svg"

ECHO. ^^- [2/2] ".png" file generating..
%graphviz_app_file% -Tpng "%CD%\%path_input_file%">"%CD%\%path_output_file%.png"


:LOGS_PROCESSING
ECHO ----------------------------------------
ECHO. [ Log file generating ]
ECHO. ^^- Date record should been created..
DATE /t 1>  "%CD%\%path_log_file%"
ECHO. ^^- Time record should been created..
TIME /t 1>> "%CD%\%path_log_file%"
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
