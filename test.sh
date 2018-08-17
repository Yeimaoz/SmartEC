#!/usr/bin/env bash

echo "Generate case$1 mapping script ......"
time ./nmpgen cases/case$1.json test.py
    
echo "Generate case$1 input file ......"
./conv_map_to_in cases/case$1.json input/case$1_in.json
    
echo "Run mapping file for case$1 ......"
time python3 test.py input/case$1_in.json test.json
    
echo "Verifying case$1 script correctness ......"
./verify cases/case$1.json test.json

echo ""
echo ""
