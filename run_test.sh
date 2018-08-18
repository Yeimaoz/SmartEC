#!/usr/bin/env bash

mkdir -p script input output
rm script/* input/* output/* 

for file in $(ls cases/); do
    bname=$(basename -s .json $file)
    echo "Test $bname ......"
    
    echo "Generate script for $bname ......"
    time ./nmpgen cases/$file script/${bname}_script.py
    
    echo "Generate input file for $bname ......"
    ./conv_map_to_in cases/$file input/${bname}_in.json
    
    echo "Test script for $bname ......"
    time python3 ./script/${bname}_script.py input/${bname}_in.json output/${bname}_out.json
    
    echo "Verify the functionality of the reconstruction ......"
    ./verify cases/$file output/${bname}_out.json

    echo ""
    echo ""
done
wc -c script/*

