#!/bin/bash
echo "conectando à vpn dos eua (us-free-31)..."

# descobre a pasta atual do script
BASE_DIR=$(dirname "$(readlink -f "$0")")

# desativa o ipv6 para evitar problemas de conectividade
echo "123" | sudo -S sysctl -w net.ipv6.conf.all.disable_ipv6=1 && echo "123" | sudo -S sysctl -w net.ipv6.conf.default.disable_ipv6=1

# passa a senha '123' direto para o sudo sem travar o terminal
echo "123" | sudo -S openvpn --config "$BASE_DIR/us-free-31.protonvpn.udp.ovpn" --auth-user-pass "$BASE_DIR/senha-do-OpenVPN.txt" > /tmp/vpn.log 2>&1 &

echo "comando enviado para o segundo plano. use o ./vpn-teste.sh para confirmar."