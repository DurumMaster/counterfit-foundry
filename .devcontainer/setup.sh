#!/bin/bash
set -e

echo "[+] Instalando dependencias de sistema necesarias…"
sudo apt-get update
sudo apt-get install -y --no-install-recommends \
    build-essential gfortran libatlas-base-dev libopenblas-dev liblapack-dev \
    gcc curl git

echo "[+] Creando y activando entorno virtual…"
python3 -m venv ~/venv
source ~/venv/bin/activate

echo "[+] Actualizando pip, wheel y setuptools…"
pip install --upgrade pip setuptools wheel

echo "[+] PREINSTALANDO NumPy con rueda binaria…"
pip install numpy==1.23.5

echo "[+] Clonando Counterfit…"
git clone https://github.com/Azure/counterfit.git ~/counterfit

cd ~/counterfit
echo "[+] Instalando Counterfit (modo editable)…"
# Aquí pip no volverá a compilar NumPy porque ya está instalado
pip install -e .

echo "[+] Descargando NLTK stopwords…"
python - <<'PYCODE'
import nltk; nltk.download('stopwords')
PYCODE

echo "[+] ¡Listo! Activa el entorno con:"
echo "    source ~/venv/bin/activate"
echo "y luego lanza Counterfit con:"
echo "    counterfit --help"
