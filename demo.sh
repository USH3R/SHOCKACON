#!/bin/bash

echo "=== SHOCKACON Demo Start ==="

# Step 1: Python
echo "[PYTHON] Running Sentinel Engine..."
# optional: install dependencies (only first time)
# pip install -r requirements.txt
python3 ShakaCon.py

# Step 2: Java
echo "[JAVA] Running Digital Mentor..."
javac DigitalMentor.java
java DigitalMentor

# Step 3: C++
echo "[C++] Running Enclave Guard..."
g++ -o enclave_guard enclave_guard.cpp
./enclave_guard

echo "=== SHOCKACON Demo Complete ==="
