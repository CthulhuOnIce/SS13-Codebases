
@REM @ECHO OFF
CD /D %CD%
DOT.EXE -V -v

DOT.EXE -Tsvg ".\..\src\tree.dot" > ".\..\out\tree.svg"
DOT.EXE -Tpng ".\..\src\tree.dot" > ".\..\out\tree.png"

TIMEOUT /t 10
REM PAUSE
