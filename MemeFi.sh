#!/bin/bash

echo "API_ID kalian: (ambil disini: https://my.telegram.org/auth?to=apps):"
read API_ID
echo "API_HASH kalian: (ambil disini: https://my.telegram.org/auth?to=apps):"
read API_HASH

echo "Clone Repo Dulu"
git clone https://github.com/shamhi/MemeFiBot.git

echo "Install Prerequestion Dulu"
sudo apt update
sudo apt install python3.10 python3.10-venv python3.10-dev -y

echo "Proses Setup Bot"
cd MemeFiBot
python3.10 -m venv venv || { echo "Gagal dalam membuat virtual environment."; exit 1; }
source venv/bin/activate || { echo "Gagal dalam mengaktifkan virtual environment."; exit 1; }
pip install -r requirements.txt || { echo "Gagal dalam menginstall packages yang dibutuhkan."; exit 1; }
echo "Setup .env file..."
cp .env-example .env || { echo "Gagal dalam mengcopy .env-example ke .env."; exit 1; }
sed -i "s/^API_ID=.*/API_ID=$API_ID/" .env
sed -i "s/^API_HASH=.*/API_HASH=$API_HASH/" .env
echo "Bot Siap Digunakan."