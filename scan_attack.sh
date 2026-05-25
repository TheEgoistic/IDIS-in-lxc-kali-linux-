#!/bin/bash

TARGET="10.30.141.95"

echo "[*] Running Nmap Scan..."

nmap -sS -T4 $TARGET