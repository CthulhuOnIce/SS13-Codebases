#!/bin/sh

DOT -V -v

echo ".svg generating.."
DOT -Tsvg "./../src/tree.dot" > "./../out/tree.svg"

echo ".png generating.."
DOT -Tpng "./../src/tree.dot" > "./../out/tree.png"


exit 0
