

---

### 📄 `README.md`

```markdown
# 🔍 Subdomain Enumeration Automation Script

This Bash script automates subdomain enumeration, probing for live hosts, and port scanning using tools like `subfinder`, `assetfinder`, `httprobe`, and `nmap`.

## 🛠 Tools Used

- [Subfinder](https://github.com/projectdiscovery/subfinder) — Passive subdomain discovery
- [Assetfinder](https://github.com/tomnomnom/assetfinder) — More subdomain enumeration
- [httprobe](https://github.com/tomnomnom/httprobe) — Check which subdomains are alive
- [Nmap](https://nmap.org/) — Network scanning
- [Gowitness](https://github.com/sensepost/gowitness) — Screenshotting

---

## 📂 Output Structure

When run, the script creates a structured directory under the domain name:

```Structure 

<domain>/
├── Subdomain/path/
│   ├── found.txt      # All discovered subdomains
│   └── alive.txt      # Live subdomains after probing
├── Screenshots/       # Screenshots of live hosts (if enabled)
└── Scans/
└── nmap.txt       # Full port scan results

````

---

### 📌 Prerequisites

Install the required tools:

```bash
sudo apt install nmap
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install -v github.com/tomnomnom/assetfinder@latest
go install -v github.com/tomnomnom/httprobe@latest
# Optional for screenshots:
# go install -v github.com/sensepost/gowitness@latest
````

Ensure Go's bin directory is in your `$PATH`:

```bash
export PATH=$PATH:$(go env GOPATH)/bin
```

### ▶️ Running the Script

```bash
chmod +x subdomain_enum.sh
./subdomain_enum.sh example.com
```

---

## ⚠️ Disclaimer

This script is intended for educational and authorized security testing purposes **only**. Unauthorized scanning of networks and domains without permission may be illegal.

---

## 📄 License

MIT License — feel free to use, modify, and distribute.

---

## 🙌 Contributions

Pull requests, feature suggestions, and tool integrations are welcome!

```

