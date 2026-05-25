#!/bin/bash

echo "========== FULL ATTACK SIMULATION =========="

bash sqli_attack.sh
bash xss_attack.sh
bash brute_force.sh
bash scan_attack.sh
bash dos_attack.sh

echo "========== ATTACK COMPLETE =========="