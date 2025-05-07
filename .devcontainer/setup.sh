#!/bin/bash
set -e

echo "[+] Instalando dependencias de sistema necesarias…"
sudo apt-get update
sudo apt-get install -y --no-install-recommends \
    build-essential gfortran libatlas-base-dev libopenblas-dev liblapack-dev \
    gcc curl git python3-numpy

echo "[+] Creando entorno virtual (incluyendo paquetes del sistema)…"
python3 -m venv --system-site-packages ~/venv
source ~/venv/bin/activate

echo "[+] Actualizando pip, wheel y setuptools…"
pip install --upgrade pip setuptools wheel

echo "[+] Clonando Counterfit…"
git clone https://github.com/Azure/counterfit.git ~/counterfit

cd ~/counterfit
echo "[+] Instalando Counterfit en modo editable…"
pip install -e .

echo "[+] Descargando NLTK stopwords…"
python - <<'PYCODE'
import nltk
nltk.download('stopwords')
PYCODE

echo "[+] ¡Listo! Activa el entorno con:"
echo "    source ~/venv/bin/activate"
echo "y luego lanza Counterfit con:"
echo "    counterfit --help"
