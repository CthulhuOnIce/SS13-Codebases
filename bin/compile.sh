#!/bin/sh

DOT -V -v

echo ".svg generating.."
DOT -Tsvg "./../src/tree.dot" > "./../out/tree.svg"

echo ".png generating.."
DOT -Tpng "./../src/tree.dot" > "./../out/tree.png"

echo "Log file generating.."
date >  ".\..\out\compile_datetime.txt"
time >> ".\..\out\compile_datetime.txt"

exit 0
