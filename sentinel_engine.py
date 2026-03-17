import time
from textblob import TextBlob  # optional, for sentiment/urgency scoring

# SHOCKACON: Secure Hazard Observation & Cyber Knowledge for AI Control
# Component: The Sentinel (Python Analysis Engine)
# Purpose: Real-time detection of deceptive content & malicious AI campaigns.

class ShockSentinel:
    def __init__(self):
        self.deception_threshold = 0.75  # Above this, content is HIGH threat
        print("[INIT] SHOCKACON Sentinel Active. Monitoring for cognitive threats...")

    def calculate_urgency(self, content):
        """
        Analyzes text content for urgency and manipulative language.
        Returns a normalized score between 0 and 1.
        """
        blob = TextBlob(content)
        polarity = blob.sentiment.polarity  # -1 (negative) to +1 (positive)
        # Urgency heuristics: extreme negative language = higher urgency
        urgency_score = min(max((abs(polarity) + 0.5), 0), 1)
        return urgency_score

    def scan_content(self, content_body, metadata):
        """
        Analyzes content for 'Shock' signatures: urgency, 
        deceptive linguistic patterns, and metadata anomalies.
        Returns Deception Index, threat level, and suggested action.
        """
        source_id = metadata.get('source_id', 'UNKNOWN')
        provenance_valid = metadata.get('is_verified', False)

        print(f"[*] Analyzing incoming content from source: {source_id}")

        # Dynamic scoring
        urgency_score = self.calculate_urgency(content_body)
        provenance_score = 1.0 if provenance_valid else 0.0

        # Weighted Deception Index
        # Formula: (Urgency * 0.6) + ((1 - Provenance) * 0.4)
        deception_index = (urgency_score * 0.6) + ((1 - provenance_score) * 0.4)

        # Threat level classification
        if deception_index > self.deception_threshold:
            threat_level = "HIGH"
            action = "INTERCEPT"
        elif deception_index > 0.5:
            threat_level = "MEDIUM"
            action = "REVIEW"
        else:
            threat_level = "LOW"
            action = "PASS"

        return {
            "index": round(deception_index, 2),
            "threat_level": threat_level,
            "action": action
        }

if __name__ == "__main__":
    sentinel = ShockSentinel()

    # Mock data examples
    test_cases = [
        {
            "content": "CRITICAL: YOUR SOCIAL SECURITY NUMBER HAS BEEN SUSPENDED. CALL IMMEDIATELY.",
            "metadata": {"source_id": "FED-ALERT-SPOOF", "is_verified": False}
        },
        {
            "content": "Friendly reminder: Update your account settings at your convenience.",
            "metadata": {"source_id": "FED-ALERT-OFFICIAL", "is_verified": True}
        },
        {
            "content": "URGENT: New cybersecurity regulations require immediate compliance!",
            "metadata": {"source_id": "UNKNOWN-ALERT", "is_verified": False}
        }
    ]

    # Run sentinel scan on each example
    for case in test_cases:
        result = sentinel.scan_content(case["content"], case["metadata"])
        print(f"\n[RESULT] Source: {case['metadata']['source_id']}")
        print(f"Deception Index: {result['index']}")
        print(f"Threat Level: {result['threat_level']}")
        print(f"Action: {result['action']}")
        time.sleep(0.5)
