#!/bin/sh

echo "! PLEASE MAKE SURE THAT ANTIVIRUS ALLOWING TO EXECUTE THIS SCRIPT !";

command -v DOT

DOT -V;

echo ".svg generating..";
DOT -Tsvg "./../src/tree.dot" > "./../out/tree.svg";

echo ".png generating..";
DOT -Tpng "./../src/tree.dot" > "./../out/tree.png";

echo "Log file generating..";
date "+%d/%m/%y" >  "./../out/compile_datetime.txt";
date "+%H:%M"    >> "./../out/compile_datetime.txt";

echo "Goodbye";
exit $?;
