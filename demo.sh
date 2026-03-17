#!/bin/bash

echo "=== SHOCKACON Demo Start ==="

# Step 1: Python
echo "[PYTHON] Running Sentinel Engine..."
python3 sentinel_engine.py || echo "[WARN] Python step failed, continuing demo..."

# Step 2: Java
echo "[JAVA] Running Digital Mentor..."
javac DigitalMentor.java && java DigitalMentor || echo "[WARN] Java step failed, continuing demo..."

# Step 3: C++
echo "[C++] Running Enclave Guard..."
g++ -o enclave_guard enclave_guard.cpp
./enclave_guard || echo "[WARN] C++ step failed, continuing demo..."

echo "=== SHOCKACON Demo Complete ==="
