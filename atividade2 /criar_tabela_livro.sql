CREATE TABLE livro (
  id_livro INT PRIMARY KEY AUTO_INCREMENT,
  titulo VARCHAR(255) NOT NULL,
  sinopse TEXT,
  autor VARCHAR(128) NOT NULL,
  editora VARCHAR(128) NOT NULL,
  categoria VARCHAR(128),
  ano_publicacao YEAR
);
