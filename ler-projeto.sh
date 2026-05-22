#!/bin/bash

# define o nome do arquivo de relatório na pasta local atual
ARQUIVO_RELATORIO="conteudo.txt"

# limpa o arquivo de relatório se ele já existir na pasta local
> "$ARQUIVO_RELATORIO"

echo "=== ARQUITETURA DO PROJETO ===" >> "$ARQUIVO_RELATORIO"
# gera a árvore da pasta local ignorando arquivos temporários e os próprios scripts
tree -I "node_modules|.git|__pycache__|venv|$ARQUIVO_RELATORIO|ler-projeto.sh|comp-local.sh" >> "$ARQUIVO_RELATORIO"

echo -e "\n=== CONTEÚDO DOS ARQUIVOS ===" >> "$ARQUIVO_RELATORIO"

# loop para ler os arquivos da pasta local atual e subpastas
find . -type f ! -path "*/.*" ! -name "node_modules*" ! -name "__pycache__*" ! -name "venv*" ! -name "$ARQUIVO_RELATORIO" ! -name "ler-projeto.sh" ! -name "comp-local.sh" | while read -r arquivo; do
    echo -e "\n----------------------------------------" >> "$ARQUIVO_RELATORIO"
    echo "Arquivo: $arquivo" >> "$ARQUIVO_RELATORIO"
    echo -e "----------------------------------------\n" >> "$ARQUIVO_RELATORIO"
    cat "$arquivo" >> "$ARQUIVO_RELATORIO"
done

echo "Mapeamento concluído! O resultado foi salvo em: ./"$ARQUIVO_RELATORIO""