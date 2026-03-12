CREATE DATABASE biblioteca;

CREATE TABLE tb_user(
  id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(150) NOT NULL,
  cpf VARCHAR(11) NOT NULL UNIQUE,
  email VARCHAR(150) NOT NULL,
  data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE tb_user 
ADD telefone VARCHAR(20);

ALTER TABLE tb_user
DROP COLUMN telefone;

INSERT INTO tb_user (nome, cpf, email, data_cadastro)
VALUES ('Felipe', '12345678900', 'felipe123@gmail.com', NOW());

SELECT * FROM tb_user;

UPDATE tb_user SET nome = 'Felipes' WHERE id = 1;

DELETE FROM tb_user WHERE id = 1;


CREATE TABLE tb_book(
  id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  review TEXT,
  author VARCHAR(128) NOT NULL,
  publisher VARCHAR(128) NOT NULL,
  category VARCHAR(128),
  publication_year YEAR
  );

ALTER TABLE tb_book 
ADD subtitle VARCHAR(255);

ALTER TABLE tb_book
DROP COLUMN subtitle;

INSERT INTO tb_book (title, review, author, publisher, category, publication_year)
VALUES ('Pequeno Principe', 'empty', 'Antoine de Saint-Exupéry', 'Faro Editorial', 'infanto-juvenil', NOW());

SELECT * FROM tb_book;

UPDATE tb_book SET title = 'O Pequeno Principe' WHERE id = 1;

DELETE FROM tb_book WHERE id = 1;
