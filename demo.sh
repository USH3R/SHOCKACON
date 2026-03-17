#!/bin/bash
echo "=== SHOCKACON Demo Start ==="

# Step 1: Python Sentinel
echo "[PYTHON] Running Sentinel Engine..."
python3 ShakaCon.py

# Step 2: Java Digital Mentor
echo "[JAVA] Running Digital Mentor..."
javac DigitalMentor.java
java DigitalMentor

# Step 3: C++ Enclave Guard
echo "[C++] Running Enclave Guard..."
g++ -o enclave_guard enclaveguard.cpp
./enclave_guard

echo "=== SHOCKACON Demo Complete ==="
