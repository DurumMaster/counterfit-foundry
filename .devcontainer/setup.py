#!/bin/bash
set -e

echo "[+] Instalando dependencias de sistema…"
sudo apt-get update
sudo apt-get install -y --no-install-recommends \
    build-essential gfortran libatlas-base-dev libopenblas-dev liblapack-dev \
    python3.10-dev python3.10-distutils gcc curl git

echo "[+] Creando y activando entorno virtual…"
python3.10 -m venv ~/venv
source ~/venv/bin/activate

echo "[+] Actualizando pip, wheel y setuptools…"
pip install --upgrade pip setuptools wheel

echo "[+] Clonando Counterfit…"
# Si ya clonaste manualmente, comenta la siguiente línea.
git clone https://github.com/Azure/counterfit.git ~/counterfit

cd ~/counterfit
echo "[+] Instalando Counterfit en modo editable…"
pip install -e .

echo "[+] Descargando NLTK stopwords…"
python - <<'PYCODE'
import nltk; nltk.download('stopwords')
PYCODE

echo "[+] ¡Listo! Usa 'counterfit' desde cualquier terminal."
