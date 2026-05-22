#!/bin/bash
zip -P 123 -r arquivos_compactados.zip . -x "comp-local.sh" "arquivos_compactados.zip" "ler-projeto.sh" "conteudo.txt" ".git/*" ".gitignore"