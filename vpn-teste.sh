#!/bin/bash
echo "=== testando ip e localização ==="
echo "----------------------------------------"
curl -s https://ipapi.co/json/ | grep -E '"ip"|"country_name"|"org"'
echo "----------------------------------------"

echo -e "\n=== testando rota de pacotes (traceroute) ==="
# faz um rastreamento rápido de 5 saltos para ver o caminho do túnel
traceroute -m 5 1.1.1.1