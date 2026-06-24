CREATE DATABASE escritorio_advocacia;
USE escritorio_advocacia;

CREATE TABLE tb_especialidade (
    id_especialidade INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE tb_advogado (
    id_advogado INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    numero_oab VARCHAR(20) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    email VARCHAR(150) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    id_especialidade INT NOT NULL,

    CONSTRAINT fk_advogado_especialidade
        FOREIGN KEY (id_especialidade)
        REFERENCES tb_especialidade(id_especialidade)
);

CREATE TABLE tb_cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    email VARCHAR(150) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL
);

CREATE TABLE tb_secretaria (
    id_secretaria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    email VARCHAR(150) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL
);

CREATE TABLE tb_contrato (
    id_contrato INT AUTO_INCREMENT PRIMARY KEY,
    numero_contrato VARCHAR(30) NOT NULL UNIQUE,
    valor_honorarios DECIMAL(10,2) NOT NULL,

    id_cliente INT NOT NULL,
    id_advogado INT NOT NULL,
    id_especialidade INT NOT NULL,

    CONSTRAINT fk_contrato_cliente
        FOREIGN KEY (id_cliente)
        REFERENCES tb_cliente(id_cliente),

    CONSTRAINT fk_contrato_advogado
        FOREIGN KEY (id_advogado)
        REFERENCES tb_advogado(id_advogado),

    CONSTRAINT fk_contrato_especialidade
        FOREIGN KEY (id_especialidade)
        REFERENCES tb_especialidade(id_especialidade)
);
