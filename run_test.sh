#!/usr/bin/env bash

mkdir -p script input output

for file in $(ls cases/); do
    echo "Test $file ....."
    bname=$(basename -s .json $file)
    
    echo "Generate $file mapping script ......"
    time ./nmpgen cases/$file script/${bname}_script.py
    
    echo "Generate $file input file ......"
    ./conv_map_to_in cases/$file input/${bname}_in.json
    
    echo "Run mapping file for $file ......"
    time python3 ./script/${bname}_script.py input/${bname}_in.json output/${bname}_out.json
    
    echo "Veritifying $file script correctness ......"
    ./veritify cases/$file output/${bname}_out.json

    echo ""
    echo ""
done

