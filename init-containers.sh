#!/bin/bash

# Cores para formatação
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${YELLOW}Iniciando o processo de build e execução do Docker Compose...${NC}"

# Verificar se docker-compose está instalado
if ! command -v docker-compose &> /dev/null; then
    echo -e "${RED}docker-compose não está instalado.${NC}"
    echo -e "${YELLOW}Instalando docker-compose...${NC}"
    sudo apt install docker-compose -y
else
    echo -e "${GREEN}docker-compose já está instalado.${NC}"
fi

# Etapa 1: Construir imagens
echo -e "${YELLOW}Construindo imagens Docker...${NC}"
sudo docker-compose build

if [ $? -eq 0 ]; then
    echo -e "${GREEN}Imagens Docker construídas com sucesso!${NC}"
else
    echo -e "${RED}Erro ao construir as imagens.${NC}"
    exit 1
fi

# Etapa 2: Subir os containers
echo -e "${YELLOW}Subindo os containers com docker-compose...${NC}"
sudo docker-compose up -d

if [ $? -eq 0 ]; then
    echo -e "${GREEN}Containers iniciados com sucesso!${NC}"
    sudo docker ps
else
    echo -e "${RED}Erro ao iniciar os containers.${NC}"
    exit 1
fi
