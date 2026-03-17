import time

# Try to import TextBlob. If unavailable, simulate sentiment
try:
    from textblob import TextBlob
    TEXTBLOB_AVAILABLE = True
except ImportError:
    TEXTBLOB_AVAILABLE = False

class ShockSentinel:
    def __init__(self):
        self.deception_threshold = 0.75
        print("[INIT] SHOCKACON Sentinel Active. Monitoring for cognitive threats...")

    def calculate_urgency(self, content):
        """
        Returns a normalized score between 0 and 1.
        Uses TextBlob if installed; otherwise, uses a simple heuristic.
        """
        if TEXTBLOB_AVAILABLE:
            blob = TextBlob(content)
            polarity = blob.sentiment.polarity
            urgency_score = min(max((abs(polarity) + 0.5), 0), 1)
        else:
            # Simple heuristic if TextBlob is not installed
            urgency_score = 0.6 if any(word in content.upper() for word in ["URGENT", "CRITICAL", "ALERT"]) else 0.3
        return urgency_score

    def scan_content(self, content_body, metadata):
        source_id = metadata.get('source_id', 'UNKNOWN')
        provenance_valid = metadata.get('is_verified', False)

        print(f"[*] Analyzing incoming content from source: {source_id}")

        urgency_score = self.calculate_urgency(content_body)
        provenance_score = 1.0 if provenance_valid else 0.0

        deception_index = (urgency_score * 0.6) + ((1 - provenance_score) * 0.4)

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

    for case in test_cases:
        result = sentinel.scan_content(case["content"], case["metadata"])
        print(f"\n[RESULT] Source: {case['metadata']['source_id']}")
        print(f"Deception Index: {result['index']}")
        print(f"Threat Level: {result['threat_level']}")
        print(f"Action: {result['action']}")
        time.sleep(0.5)
