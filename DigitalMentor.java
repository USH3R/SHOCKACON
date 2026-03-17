public class DigitalMentor {

    public static void generateUserGuidance(String threatLevel, double deceptionIndex) {
        System.out.println("--- SHOCKACON DIGITAL TRUST REPORT ---");

        String guidance;

        if (deceptionIndex > 0.75) {
            guidance = "⚠️ HIGH RISK: This content shows strong signs of manipulation. " +
                       "SHOCKACON has intercepted this to protect your data.";
        } else if (deceptionIndex > 0.5) {
            guidance = "🔍 CAUTION: This message contains urgent language from an unknown source. " +
                       "Verify through an official channel before clicking.";
        } else {
            guidance = "✅ LOW RISK: No significant deception markers detected.";
        }

        System.out.println("Status: " + threatLevel);
        System.out.println("Deception Score: " + deceptionIndex);
        System.out.println("Guidance: " + guidance);
        System.out.println("---------------------------------------");
    }

    public static void main(String[] args) {
        try {
            generateUserGuidance("HIGH", 0.88);
            generateUserGuidance("MEDIUM", 0.62);
            generateUserGuidance("LOW", 0.32);
        } catch (Exception e) {
            System.out.println("[ERROR] Digital Mentor encountered a problem, skipping...");
        }
    }
}
