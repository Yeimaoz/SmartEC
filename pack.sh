#!/usr/bin/env bash
mkdir -p packed
for file in $(ls script); do
    gzip -c9 script/$file > packed/$file.gz
    
done

echo "unpack:" 
wc -c script/*

echo "pack:" 
wc -c packed/*

rm packed/*
