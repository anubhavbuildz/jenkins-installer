#!/bin/bash

set -e

echo "Updating system packages..."
sudo dnf update -y

echo "Adding Jenkins repository..."
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/rpm-stable/jenkins.repo

echo "Importing Jenkins GPG key..."
sudo rpm --import https://pkg.jenkins.io/rpm-stable/jenkins.io-2023.key

echo "Installing Java 21 and dependencies..."
sudo dnf install -y fontconfig java-21-amazon-corretto

echo "Installing Jenkins..."
sudo dnf install -y jenkins

echo "Reloading systemd..."
sudo systemctl daemon-reload

echo "Enabling Jenkins service..."
sudo systemctl enable jenkins

echo "Starting Jenkins..."
sudo systemctl start jenkins

echo "Checking Jenkins status..."
sudo systemctl status jenkins --no-pager

echo ""
echo "Jenkins installation completed."
echo ""

PUBLIC_IP=$(curl -s ifconfig.me || true)

echo "Access Jenkins at:"
echo "http://${PUBLIC_IP}:8080"

echo ""
echo "Initial Admin Password:"
echo ""

sudo cat /var/lib/jenkins/secrets/initialAdminPassword || true