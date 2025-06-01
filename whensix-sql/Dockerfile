# Buscando imagem base mysql
FROM mysql:8.0

# Definindo configurações de ambiente
ENV MYSQL_ROOT_PASSWORD=urubu100
ENV MYSQL_DATABASE=whensix
ENV MYSQL_USER=whensix
ENV MYSQL_PASSWORD=urubu100

# Expondo porta MySQL
EXPOSE 3306

# Rodando script mysql das tabelas
COPY ./whensix-dados/whensix.sql /docker-entrypoint-initdb.d/