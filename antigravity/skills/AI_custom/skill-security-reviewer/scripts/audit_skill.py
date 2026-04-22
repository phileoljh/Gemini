import os
import sys
import re

# 定義要檢測的可疑模式
SUSPICIOUS_PATTERNS = {
    "Networking": [
        r"requests\.(get|post|put|delete|patch|head)",
        r"urllib\.request",
        r"http\.client",
        r"socket\.(socket|connect|send)",
        r"curl",
        r"wget",
        r"ftplib",
        r"smtplib"
    ],
    "Dynamic Execution": [
        r"eval\(",
        r"exec\(",
        r"__import__",
        r"getattr\(.*__import__",
        r"pickle\.load",
        r"marshal\.load"
    ],
    "Process Execution": [
        r"subprocess\.",
        r"os\.system\(",
        r"os\.popen\(",
        r"shutil\.rmtree"
    ],
    "Information Leakage": [
        r"\.env",
        r"\.ssh",
        r"\.git",
        r"api_key",
        r"secret_key",
        r"token",
        r"password"
    ],
    "Obfuscation": [
        r"base64\.b64decode",
        r"binascii\.a2b",
        r"rot13",
        r"\\x[0-9a-fA-F]{2}"
    ]
}

def audit_directory(path):
    print(f"[*] Starting security audit for: {path}")
    print("-" * 50)
    
    findings = []
    
    for root, dirs, files in os.walk(path):
        for file in files:
            if file.endswith(('.py', '.sh', '.md', '.txt', '.hbs', '.json')):
                file_path = os.path.join(root, file)
                try:
                    with open(file_path, 'r', encoding='utf-8', errors='ignore') as f:
                        content = f.read()
                        
                    for category, patterns in SUSPICIOUS_PATTERNS.items():
                        for pattern in patterns:
                            matches = re.finditer(pattern, content, re.IGNORECASE)
                            for match in matches:
                                line_no = content.count('\n', 0, match.start()) + 1
                                findings.append({
                                    "category": category,
                                    "file": file,
                                    "line": line_no,
                                    "pattern": pattern,
                                    "match": match.group(0)
                                })
                except Exception as e:
                    print(f"[!] Error reading {file}: {e}")

    if not findings:
        print("[+] No suspicious patterns found. Audit passed!")
    else:
        print(f"[!] Found {len(findings)} suspicious entries:")
        for f in findings:
            print(f"    - [{f['category']}] {f['file']}:{f['line']} -> Found match: '{f['match']}' (Pattern: {f['pattern']})")
        print("-" * 50)
        print("[RESULT] Audit completed with warnings. Please review the findings manually.")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python audit_skill.py <target_directory>")
        sys.exit(1)
        
    target_dir = sys.argv[1]
    if not os.path.exists(target_dir):
        print(f"Error: Directory '{target_dir}' does not exist.")
        sys.exit(1)
        
    audit_directory(target_dir)
