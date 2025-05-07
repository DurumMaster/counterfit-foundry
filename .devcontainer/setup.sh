#!/bin/bash
set -e

echo "[+] Instalando dependencias del sistema…"
sudo apt-get update
sudo apt-get install -y --no-install-recommends \
    build-essential gfortran libatlas-base-dev libopenblas-dev liblapack-dev \
    python3-venv python3-pip python3-numpy git curl gcc

echo "[+] Creando virtualenv (heredando paquetes de sistema)…"
python3 -m venv --system-site-packages ~/venv
source ~/venv/bin/activate

echo "[+] Actualizando pip, setuptools y wheel…"
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

echo "[+] ✅ ¡Listo!  
Activa el entorno con:
    source ~/venv/bin/activate  
Y comprueba:
    counterfit --help  
"
