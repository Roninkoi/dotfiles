#!/bin/sh
awk '{s += $'$2'; n++} END {if (n > 0) print s / n; }' $1
