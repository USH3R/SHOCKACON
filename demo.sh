#!/bin/bash
# ========================
# SHOCKACON Demo
# Reviewer-ready: ./demo.sh
# ========================

echo "=== SHOCKACON Demo Start ==="

# -------------------------
# Step 1: Python (Sentinel Engine)
# -------------------------
echo "[PYTHON] Running Sentinel Engine..."

python3 - <<'END_PYTHON' || echo "[WARN] Python step failed, continuing demo..."
import subprocess
import sys
import time

# Inline fallback: install TextBlob if not present
try:
    from textblob import TextBlob
except ImportError:
    print("[WARN] TextBlob not found. Installing...")
    subprocess.check_call([sys.executable, "-m", "pip", "install", "textblob", "--quiet"])

# Import Sentinel Engine (ensure file name matches repo)
from sentinel_engine import ShockSentinel

sentinel = ShockSentinel()

# Mock data examples
test_cases = [
    {"content": "CRITICAL: YOUR SOCIAL SECURITY NUMBER HAS BEEN SUSPENDED. CALL IMMEDIATELY.",
     "metadata": {"source_id": "FED-ALERT-SPOOF", "is_verified": False}},
    {"content": "Friendly reminder: Update your account settings at your convenience.",
     "metadata": {"source_id": "FED-ALERT-OFFICIAL", "is_verified": True}},
    {"content": "URGENT: New cybersecurity regulations require immediate compliance!",
     "metadata": {"source_id": "UNKNOWN-ALERT", "is_verified": False}}
]

for case in test_cases:
    result = sentinel.scan_content(case["content"], case["metadata"])
    print(f"\n[RESULT] Source: {case['metadata']['source_id']}")
    print(f"Deception Index: {result['index']}")
    print(f"Threat Level: {result['threat_level']}")
    print(f"Action: {result['action']}")
    time.sleep(0.5)
END_PYTHON

# -------------------------
# Step 2: Java (Digital Mentor)
# -------------------------
echo "[JAVA] Running Digital Mentor..."
javac DigitalMentor.java 2>/dev/null
java DigitalMentor || echo "[WARN] Java step failed, continuing demo..."

# -------------------------
# Step 3: C++ (Enclave Guard)
# -------------------------
echo "[C++] Running Enclave Guard..."
g++ -o enclave_guard enclaveguard.cpp 2>/dev/null
./enclave_guard || echo "[WARN] C++ step failed, continuing demo..."

echo "=== SHOCKACON Demo Complete ==="
