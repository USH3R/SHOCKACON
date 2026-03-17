#!/bin/bash

echo "=== SHOCKACON Demo Start ==="

# Compile the C++ Enclave Guard
g++ enclaveguard.cpp -o enclave_guard

# Step 1: Python
echo "[PYTHON] Running Sentinel Engine..."
pip install -r requirements.txt
python3 ShakaCon.py

# Step 2: Java
echo "[JAVA] Running Digital Mentor..."
javac DigitalMentor.java
java DigitalMentor

# Step 3: C++
echo "[C++] Running Enclave Guard..."
./enclave_guard

echo "=== SHOCKACON Demo Complete ==="
