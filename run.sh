#!/bin/bash

export CUDA_HOME=/cluster/nvidia/cuda/12.1.0
export PATH=$CUDA_HOME/bin:$PATH
export LD_LIBRARY_PATH=$CUDA_HOME/lib64:$LD_LIBRARY_PATH

# Überprüfen, ob die virtuelle Umgebung bereits existiert
if [ ! -d "env" ]; then
    echo "Virtuelle Umgebung wird erstellt..."
    module load tools/python/3.8
    python3 -m venv env
    #python3.8 -m venv env
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