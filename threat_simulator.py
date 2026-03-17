import random

attacks = [
    "URGENT: Your bank account has been locked. Click here immediately.",
    "Federal notice: Your Social Security number has been suspended.",
    "Breaking news: Government emergency alert. Verify your identity now."
]

def generate_attack():
    return random.choice(attacks)

if __name__ == "__main__":
    print(generate_attack())
