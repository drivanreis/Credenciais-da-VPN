#!/bin/bash

echo "=== Conectando à VPN dos EUA (us-free-31) ==="

# 1. Trava de segurança Root (Essencial no Ubuntu para OpenVPN e Sysctl)
if [ "$(id -u)" -ne 0 ]; then
    echo "[!] Erro: Este script precisa ser executado com sudo."
    echo "Exemplo: sudo $0"
    exit 1
fi

# 2. Descobre a pasta atual do script de forma dinâmica
BASE_DIR=$(dirname "$(readlink -f "$0")")

# 3. Desativa o IPv6 (Como o script já roda como root, não precisa de 'echo 123 | sudo')
sysctl -w net.ipv6.conf.all.disable_ipv6=1 >/dev/null
sysctl -w net.ipv6.conf.default.disable_ipv6=1 >/dev/null
echo "[*] IPv6 desativado com sucesso."

# CORREÇÃO: Remove o log antigo para evitar o erro de "Permissão negada"
rm -f /tmp/vpn.log

# 4. Inicia o OpenVPN de forma nativa em segundo plano (--daemon)
# Isso evita usar o '&' do Bash, que quebra o sudo no Ubuntu
openvpn --config "$BASE_DIR/us-free-31.protonvpn.udp.ovpn" \
        --auth-user-pass "$BASE_DIR/senha-do-OpenVPN.txt" \
        --daemon \
        > /tmp/vpn.log 2>&1

echo "[*] Comando enviado para o segundo plano nativo do sistema."
echo "[*] Use o seu script de teste para confirmar se o IP mudou!"