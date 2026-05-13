# Jenkins Installer

A simple bash script to automate the installation of Jenkins on RPM-based Linux distributions (e.g., Fedora, RHEL, CentOS).

## Prerequisites

- Root or sudo access
- Internet connection
- RPM-based Linux distribution (uses `dnf` package manager)

## Installation

1. Clone or download this repository.
2. Make the script executable:
   ```bash
   chmod +x installer.sh
   ```
3. Run the script:
   ```bash
   sudo ./installer.sh
   ```

## What the Script Does

- Updates system packages
- Adds the Jenkins repository
- Imports the Jenkins GPG key
- Installs Java 21 (Amazon Corretto)
- Installs Jenkins
- Enables and starts the Jenkins service
- Displays the initial admin password and access URL

## Usage

After running the script, access Jenkins at `http://<your-public-ip>:8080` and use the displayed initial admin password to set up Jenkins.

## Notes

- The script assumes `sudo` is available and configured.
- Ensure your firewall allows traffic on port 8080.
- For production use, consider additional security configurations.