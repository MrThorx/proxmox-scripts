# 🐳 install-docker.sh

Ein einfaches Shell-Skript zur automatischen Installation von Docker und Docker Compose auf einem Ubuntu-Server.

## ✅ Funktionen

- Installiert alle offiziellen Docker-Komponenten:
  - Docker Engine  
  - Docker CLI  
  - containerd  
  - Buildx-Plugin  
  - Docker Compose Plugin
- Fügt den aktuellen Benutzer automatisch zur `docker`-Gruppe hinzu (für die Ausführung von Docker-Befehlen ohne `sudo`)
- Basierend auf der offiziellen Anleitung von [https://docs.docker.com](https://docs.docker.com)

---

## ⚙️ Voraussetzungen

- Ubuntu (empfohlen: 20.04, 22.04 oder neuer)
- Root-Rechte (per `sudo` oder direkt als root)

---

## 📥 Installation

Führe folgenden Befehl in deinem Terminal aus:

sudo bash <(curl -fsSL https://raw.githubusercontent.com/mrthorx/proxmox-scripts/main/install-docker.sh)

---

## 🧠 Hinweis

Nach der Installation **neu einloggen**, damit die Gruppenzugehörigkeit zur `docker`-Gruppe aktiv wird.

Gruppenzugehörigkeit prüfen:

---

## 📁 Inhalt des Skripts (Kurzfassung)

- Fügt Docker-GPG-Key und APT-Repository hinzu  
- Führt ein `apt update` aus  
- Installiert die Docker-Komponenten  
- Aktiviert und startet den Docker-Dienst  
- Fügt den aufrufenden Benutzer zur `docker`-Gruppe hinzu
