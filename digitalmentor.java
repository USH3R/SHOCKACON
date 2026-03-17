/**
 * SHOCKACON: Secure Hazard Observation & Cyber Knowledge for AI Control
 * Component: Digital Mentor (Java Explanation Engine)
 * iSAFE 2026 Focus: Inclusive Safety & Explainable AI (XAI)
 */
public class DigitalMentor {

    /**
     * Generates user guidance based on SHOCKACON threat analysis
     * @param threatLevel The categorical threat level: LOW, MEDIUM, HIGH
     * @param deceptionIndex The numeric deception score (0.0 - 1.0)
     */
    public static void generateUserGuidance(String threatLevel, double deceptionIndex) {
        System.out.println("--- SHOCKACON DIGITAL TRUST REPORT ---");

        String guidance;

        if (deceptionIndex > 0.75) {
            guidance = "⚠️ HIGH RISK: This content shows strong signs of manipulation. " +
                       "SHOCKACON has intercepted this to protect your data. " +
                       "Reason: High urgency combined with unverified source provenance.";
        } else if (deceptionIndex > 0.5) {
            guidance = "🔍 CAUTION: This message contains urgent language from an unknown source. " +
                       "We recommend verifying this through an official channel before clicking.";
        } else {
            guidance = "✅ LOW RISK: No significant deception markers detected.";
        }

        System.out.println("Status: " + threatLevel);
        System.out.println("Deception Score: " + deceptionIndex);
        System.out.println("Guidance: " + guidance);
        System.out.println("---------------------------------------");
    }

    public static void main(String[] args) {
        // Simulating a hand-off from the Python Sentinel
        generateUserGuidance("HIGH", 0.88);
        generateUserGuidance("MEDIUM", 0.62);
        generateUserGuidance("LOW", 0.32);
    }
}
