#!/bin/bash

# Trava de segurança: para instalar pacotes no Ubuntu, o script precisa rodar como root/sudo
if [ "$(id -u)" -ne 0 ]; then
    echo "[!] Erro: Para garantir a instalação das ferramentas no Ubuntu, execute com 'sudo'."
    exit 1
fi

# AUTOMAÇÃO UBUNTU: Verifica se o traceroute está instalado, se não, instala silenciosamente
if ! command -v traceroute &> /dev/null; then
    echo "[*] Ubuntu detectado sem 'traceroute'. Instalando dependência..."
    apt-get update -y &>/dev/null
    apt-get install traceroute -y &>/dev/null
fi

echo "=== testando ip e localização ==="
echo "----------------------------------------"
curl -s https://ipapi.co/json/ | grep -E '"ip"|"country_name"|"org"'
echo "----------------------------------------"

echo -e "\n=== testando rota de pacotes (traceroute) ==="
# Faz um rastreamento rápido de 5 saltos para ver o caminho do túnel
traceroute -m 5 1.1.1.1