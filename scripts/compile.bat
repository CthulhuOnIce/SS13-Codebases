
@ECHO OFF

ECHO.
ECHO ! PLEASE MAKE SURE THAT ANTIVIRUS ALLOWING TO EXECUTE THIS SCRIPT !
ECHO.

WHERE DOT.EXE
IF %ERRORLEVEL% NEQ 0 (
	ECHO Fatal error!
	ECHO  Graphviz does not installed [dot.exe didn't detected]
	ECHO  Please install it from: https://graphviz.org/download/
	EXIT 1
) ELSE (
	ECHO Graphviz seems to be installed, processing...
	CD ..
	@REM ECHO Project dir: %CD%
)

SET file_name=tree
SET path_input_file=%CD%\src\%file_name%.dot
SET path_output_file=%CD%\out\%file_name%
SET path_log_file=%CD%\out\compile_datetime.txt

ECHO Graphviz version is:
DOT.EXE -V

ECHO [1/2] ".svg" file generating..
DOT.EXE -Tsvg "%path_input_file%">"%path_output_file%.svg"

ECHO [2/2] ".png" file generating..
DOT.EXE -Tpng "%path_input_file%">"%path_output_file%.png"

ECHO Log file generating..
DATE /t1>"%path_log_file%"
TIME /t1>>"%path_log_file%"

@REM To replace "ÜTC" in README.MD
@REM FOR /f %%i IN ('DATE /t') DO SET compile_datetime=%%i

TIMEOUT /t 10
@REM PAUSE
