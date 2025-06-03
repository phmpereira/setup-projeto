#!/bin/bash

# Configurações
CONTAINER_NAME="whensix-mysql-container"
DB_NAME="whensix"
DB_USER="whensix"
DB_PASS="urubu100"
TABLE_NAME="tb_dado"

JAR_PATH="./whensix-projeto.jar"  # caminho para seu .jar local

# Cores para o terminal
GREEN="\033[0;32m"
RED="\033[0;31m"
YELLOW="\033[1;33m"
BLUE="\033[0;34m"
NC="\033[0m" # Sem cor

echo -e "${BLUE}🚀 Iniciando o script...${NC}"

# 1. Truncate na tabela dentro do container MySQL
echo -e "${YELLOW}🧹 Limpando a tabela ${TABLE_NAME} no banco ${DB_NAME} dentro do container ${CONTAINER_NAME}...${NC}"

sudo docker exec -i $CONTAINER_NAME mysql -u$DB_USER -p$DB_PASS $DB_NAME -e "TRUNCATE TABLE $TABLE_NAME;"

if [ $? -ne 0 ]; then
  echo -e "${RED}❌ Erro ao truncar a tabela.${NC}"
  exit 1
fi

echo -e "${GREEN}✅ Tabela truncada com sucesso!${NC}"

# 2. Rodar o .jar localmente
echo -e "${YELLOW}🎬 Executando o .jar ${JAR_PATH}...${NC}"

sudo java -jar $JAR_PATH

if [ $? -ne 0 ]; then
  echo -e "${RED}❌ Erro ao executar o .jar.${NC}"
  exit 1
fi

echo -e "${GREEN}🎉 Execução do .jar finalizada com sucesso!${NC}"
