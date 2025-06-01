CREATE DATABASE IF NOT EXISTS whensix

-- Create tb_enderecos table
CREATE TABLE IF NOT EXISTS tb_enderecos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    rua VARCHAR(100) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    bairro VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado VARCHAR(2) NOT NULL,
    cep VARCHAR(9) NOT NULL
);

-- Create tb_empresas table
CREATE TABLE IF NOT EXISTS tb_empresas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    razao_social VARCHAR(255) NOT NULL,
    cnpj VARCHAR(18) NOT NULL UNIQUE,
    codigo_ativacao VARCHAR(64),
    tb_enderecos_id INT,
    FOREIGN KEY (tb_enderecos_id) REFERENCES tb_enderecos(id)
);

-- Create tb_usuario table
CREATE TABLE IF NOT EXISTS tb_usuario (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome_usuario VARCHAR(45) NOT NULL,
    email_usuario VARCHAR(200) NOT NULL UNIQUE,
    telefone_usuario CHAR(11),
    dt_nasc_usuario DATE,
    dt_criacao DATETIME,
    login_usuario VARCHAR(45) NOT NULL UNIQUE,
    senha_usuario VARCHAR(255) NOT NULL,
    master_usuario TINYINT,
    fk_empresas INT,
    tb_enderecos_id INT,
    FOREIGN KEY (fk_empresas) REFERENCES tb_empresas(id),
    FOREIGN KEY (tb_enderecos_id) REFERENCES tb_enderecos(id)
);

-- Create tb_log table
CREATE TABLE IF NOT EXISTS tb_log (
    id_log INT PRIMARY KEY AUTO_INCREMENT,
    msg_log VARCHAR(45) NOT NULL,
    dt_log DATETIME NOT NULL
);

-- Create tb_dado table
CREATE TABLE IF NOT EXISTS tb_dado (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cdg_cidade INT,
    idade INT,
    sexo INT,
    peso FLOAT,
    altura INT,
    frequencia_refri INT,
    qtd_refri INT,
    tipo_refri INT,
    alcoolismo TINYINT,
    freq_alcool INT,
    exercicio_fisico TINYINT,
    tipo_exercicio_fisico INT,
    freq_exercicio_fisico INT,
    fumante TINYINT,
    pesorake DOUBLE,
    imc FLOAT,
    excepeso TINYINT,
    obesidade TINYINT,
    depressao TINYINT
);
