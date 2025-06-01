#!/bin/bash

# Cores
RED='\033[0;31m'      # Erro ❌
GREEN='\033[0;32m'    # Sucesso ✅
YELLOW='\033[1;33m'   # Informação ℹ️
NC='\033[0m'          # Sem cor

clear
echo -e "\n${YELLOW}🚀 Iniciando a configuração do ambiente para o projeto *VITA* da empresa WhenSix...${NC}\n"

# Atualizar os pacotes
echo -e "${YELLOW}📦 Atualizando lista de pacotes...${NC}"
sudo apt update
echo -e "${GREEN}✅ Pacotes atualizados com sucesso!\n${NC}"

# Verificar Node.js
echo -e "${YELLOW}🧪 Verificando instalação do Node.js...${NC}"
node --version
if [ $? = 0 ]; then
   echo -e "${GREEN}✔️ Node.js já está instalado!${NC}\n"
else
   echo -e "${YELLOW}🔄 Instalando curl para obter Node.js...${NC}"
   sudo apt install curl -y
   echo -e "${YELLOW}⬇️ Baixando instalador do Node.js...${NC}"
   curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
   echo -e "${YELLOW}⚙️ Instalando Node.js...${NC}"
   sudo apt install -y nodejs
   echo -e "${GREEN}✅ Node.js instalado com sucesso!\n${NC}"
fi

# Verificar Git
echo -e "${YELLOW}🧪 Verificando instalação do Git...${NC}"
git --version
if [ $? = 0 ]; then
   echo -e "${GREEN}✔️ Git já está instalado!${NC}\n"
else
   echo -e "${YELLOW}⬇️ Instalando Git...${NC}"
   sudo apt install git -y
   echo -e "${GREEN}✅ Git instalado com sucesso!\n${NC}"
fi

# Verificar Java
echo -e "${YELLOW}🧪 Verificando instalação do Java...${NC}"
java -version &>/dev/nul
if [ $? = 0 ]; then
   echo -e "${GREEN}✔️ Java já está instalado!${NC}\n"
else
   echo -e "${RED}❌ Java não está instalado.${NC}"
   echo -e "${YELLOW}❓ Gostaria de instalar o Java agora? [s/n]${NC}"
   read get
   if [ "$get" == "s" ]; then
      echo -e "${YELLOW}⬇️ Instalando Java (OpenJDK 21)...${NC}"
      sudo apt install openjdk-21-jdk -y
      echo -e "${GREEN}✅ Java instalado com sucesso!\n${NC}"
   else
      echo -e "${RED}🚫 Instalação do Java cancelada. Encerrando o script.${NC}\n"
      exit 1
   fi
fi

# Confirmar versões do Java
echo -e "${YELLOW}🔎 Verificando versão do Java...${NC}"
java -version
javac -version
echo -e "\n"

# Verificar Docker
echo -e "${YELLOW}🧪 Verificando instalação do Docker...${NC}"
docker --version
if [ $? = 0 ]; then
   echo -e "${GREEN}✔️ Docker já está instalado!${NC}\n"
else
   echo -e "${YELLOW}⬇️ Instalando Docker...${NC}"
   sudo apt install docker.io -y
   sudo systemctl start docker
   sudo systemctl enable docker
   echo -e "${GREEN}✅ Docker instalado e iniciado com sucesso!\n${NC}"
fi

# Verificar Docker Compose
echo -e "${YELLOW}🧪 Verificando instalação do Docker Compose...${NC}"
docker compose version &>/dev/null
if [ $? = 0 ]; then
   echo -e "${GREEN}✔️ Docker Compose já está instalado!${NC}\n"
else
   echo -e "${YELLOW}⬇️ Instalando Docker Compose CLI plugin...${NC}"
   sudo apt install docker-compose-plugin -y
   echo -e "${GREEN}✅ Docker Compose instalado com sucesso!\n${NC}"
fi

# Clonar repositório
echo -e "${YELLOW}📁 Verificando repositório VITA...${NC}"
if [ -d "VITA" ]; then
   echo -e "${YELLOW}🔁 Repositório já clonado. Pulando etapa de clonagem.${NC}\n"
else
   echo -e "${YELLOW}⬇️ Clonando repositório do projeto VITA...${NC}"
   git clone https://github.com/WhenSix/VITA.git &>/dev/null
   echo -e "${GREEN}✅ Repositório clonado com sucesso!\n${NC}"
fi

# Instalar dependências
echo -e "${YELLOW}📦 Instalando dependências do Node.js...${NC}"
cd VITA
npm install
echo -e "${GREEN}✅ Dependências instaladas com sucesso!${NC}"

echo -e "\n${GREEN}🎉 Ambiente configurado com sucesso para o projeto VITA!${NC}\n"
