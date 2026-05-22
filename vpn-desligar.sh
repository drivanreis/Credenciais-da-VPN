#!/bin/bash
echo "desconectando da vpn..."

# envia a senha para o sudo derrubar o processo do openvpn
echo "123" | sudo -S killall openvpn

echo "restaurando as configurações de ipv6 do sistema..."
# reativa o ipv6 voltando o valor para 0 (0 significa ativo/não desabilitado)
echo "123" | sudo -S sysctl -w net.ipv6.conf.all.disable_ipv6=0 && echo "123" | sudo -S sysctl -w net.ipv6.conf.default.disable_ipv6=0

echo "vpn desligada e ipv6 restaurado com sucesso."