#!/bin/bash
echo "=== iniciando compactação segura ==="

# descobre o diretório onde o script está localizado
BASE_DIR=$(dirname "$(readlink -f "$0")")
cd "$BASE_DIR"

# define o nome do arquivo de saída
OUTPUT_FILE="conteudo.zip"
SENHA_ZIP="251284"

# remove versões anteriores do zip para evitar duplicados
if [ -f "$OUTPUT_FILE" ]; then
    rm "$OUTPUT_FILE"
fi

echo "criptografando arquivos sensíveis..."
# -e ativa a criptografia, -P passa a senha e -x ignora o próprio script de compactação
zip -e -P "$SENHA_ZIP" "$OUTPUT_FILE" *.ovpn *.txt *.sh -x "compact.sh"

echo "=== arquivo $OUTPUT_FILE gerado com sucesso com criptografia ==="