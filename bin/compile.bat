
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
)


CD /D %CD%
DOT.EXE -V

ECHO .svg generating..
DOT.EXE -Tsvg ".\..\src\tree.dot" > ".\..\out\tree.svg"

ECHO .png generating..
DOT.EXE -Tpng ".\..\src\tree.dot" > ".\..\out\tree.png"

ECHO Log file generating..
DATE /t >  ".\..\out\compile_datetime.txt"
TIME /t >> ".\..\out\compile_datetime.txt"


TIMEOUT /t 10
REM PAUSE
