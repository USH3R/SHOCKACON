#!/bin/bash

echo "=== SHOCKACON Demo Start ==="

# -----------------------------
# Step 1: Python Sentinel Engine
# -----------------------------
echo "[PYTHON] Running Sentinel Engine..."

# Optional: Install dependencies only if not already installed
# This uses inline fallback: if textblob is missing, it will warn but continue
python3 - << 'EOF'
try:
    import textblob
except ModuleNotFoundError:
    print("[WARN] textblob not installed. Using fallback scoring.")

# Run the main Sentinel Engine
python3 sentinel_engine.py || { echo "[ERROR] Python Sentinel failed."; exit 1; }
EOF

# -----------------------------
# Step 2: Java Digital Mentor
# -----------------------------
echo "[JAVA] Running Digital Mentor..."
# Compile only if class file doesn't exist
if [ ! -f DigitalMentor.class ]; then
    javac DigitalMentor.java || { echo "[ERROR] Java compilation failed."; exit 1; }
fi
# Run the Java program
java DigitalMentor || { echo "[ERROR] Could not run Digital Mentor."; exit 1; }

# -----------------------------
# Step 3: C++ Enclave Guard
# -----------------------------
echo "[C++] Running Enclave Guard..."
# Compile only if binary doesn't exist
if [ ! -f enclave_guard ]; then
    g++ enclaveguard.cpp -o enclave_guard || { echo "[ERROR] C++ compilation failed."; exit 1; }
fi
# Run the C++ binary
./enclave_guard || { echo "[ERROR] Could not run Enclave Guard."; exit 1; }

echo "=== SHOCKACON Demo Complete ==="
