#!/usr/bin/env bash
mkdir -p packed
for file in $(ls script); do
    gzip -c9 script/$file > packed/$file.gz
done

echo "unack:" `wc -c script/* | grep 'total'`

echo "pack:" `wc -c packed/* | grep 'total'`

rm packed/*
