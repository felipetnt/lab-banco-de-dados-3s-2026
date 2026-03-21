-- Criar banco
CREATE DATABASE biblioteca_pessoal;

-- Usar banco
USE biblioteca_pessoal;

CREATE TABLE usuario (
  id_usuario INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(255),
  email VARCHAR(255) UNIQUE,
  senha VARCHAR(255),
  data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE autor (
  id_autor INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL UNIQUE,
  ano_nascimento YEAR,
  ano_morte YEAR,
  apresentacao TEXT,
  data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE editora (
  id_editora INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL UNIQUE,
  cidade VARCHAR(64),
  estado VARCHAR(64),
  pais VARCHAR(64),
  data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE categoria (
  id_categoria INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(128) NOT NULL UNIQUE,
  descricao TEXT,
  data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE livro (
  id_livro INT PRIMARY KEY AUTO_INCREMENT,

  id_usuario INT,
  id_autor INT,
  id_editora INT,
  id_categoria INT,

  titulo VARCHAR(255),
  sinopse TEXT,
  ano_publicacao YEAR,
  lido BOOLEAN,

  data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

  CONSTRAINT fk_livro_usuario
    FOREIGN KEY (id_usuario)
    REFERENCES usuario(id_usuario)
    ON DELETE CASCADE,

  CONSTRAINT fk_livro_autor
    FOREIGN KEY (id_autor)
    REFERENCES autor(id_autor)
    ON DELETE RESTRICT,

  CONSTRAINT fk_livro_editora
    FOREIGN KEY (id_editora)
    REFERENCES editora(id_editora)
    ON DELETE RESTRICT,

  CONSTRAINT fk_livro_categoria
    FOREIGN KEY (id_categoria)
    REFERENCES categoria(id_categoria)
    ON DELETE RESTRICT
);
