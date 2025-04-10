#!/bin/bash

# filepath: /home/potechius/Code/anycost-gan/setup_and_run.sh

# Überprüfen, ob die virtuelle Umgebung bereits existiert
if [ ! -d "env" ]; then
    echo "Virtuelle Umgebung wird erstellt..."
    python3.8 -m venv env
    echo "Virtuelle Umgebung wurde erstellt."
else
    echo "Virtuelle Umgebung existiert bereits."
fi

# Aktivieren der virtuellen Umgebung
echo "Aktiviere die virtuelle Umgebung..."
source env/bin/activate

# Installieren der Abhängigkeiten aus requirements.txt
echo "Installiere Abhängigkeiten..."
pip install --upgrade pip
pip install -r requirements.txt

# Herunterladen des Modells
echo "Lade Modell herunter..."
python scripts/download_model.py

# Starten des Python-Skripts
echo "Starte demo.py..."
sh scripts/gui.sh