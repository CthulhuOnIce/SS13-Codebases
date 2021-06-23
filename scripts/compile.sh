#!/bin/sh

echo "! PLEASE MAKE SURE THAT ANTIVIRUS ALLOWING TO EXECUTE THIS SCRIPT !"

DOT -V

echo ".svg generating.."
DOT -Tsvg "./../src/tree.dot" > "./../out/tree.svg"

echo ".png generating.."
DOT -Tpng "./../src/tree.dot" > "./../out/tree.png"

echo "Log file generating.."
date >  ".\..\out\compile_datetime.txt"
time >> ".\..\out\compile_datetime.txt"

exit $?
