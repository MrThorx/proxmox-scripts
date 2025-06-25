#!/bin/bash

set -e

# Prüfen, ob Skript mit sudo-Rechten läuft
if [ "$EUID" -ne 0 ]; then
  echo "⚠️  Bitte führe dieses Skript mit 'sudo' aus."
  exit 1
fi

# Benutzername des Aufrufers (nicht root)
USER_NAME=$(logname)

echo "==> Aktualisiere Paketliste..."
apt-get update

echo "==> Installiere notwendige Pakete..."
apt-get install -y ca-certificates curl gnupg

echo "==> Erstelle Keyring-Verzeichnis..."
install -m 0755 -d /etc/apt/keyrings

echo "==> Lade Docker GPG Key herunter..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc

echo "==> Setze Leserechte auf Key..."
chmod a+r /etc/apt/keyrings/docker.asc

echo "==> Füge Docker-Repository hinzu..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "==> Aktualisiere Paketliste..."
apt-get update

echo "==> Installiere Docker-Komponenten..."
apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "==> Füge Benutzer '$USER_NAME' zur Gruppe 'docker' hinzu..."
usermod -aG docker "$USER_NAME"

echo "✅ Docker wurde erfolgreich installiert!"
echo "ℹ️  Bitte abmelden und erneut anmelden, damit die Gruppenzugehörigkeit aktiv wird."
docker --version
docker compose version
