CREATE DATABASE db_escola;

use db_escola;

CREATE TABLE alunos (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    idade INT,
    serie VARCHAR(50)
);

INSERT INTO alunos (nome, idade, serie)
VALUES
('Pedro Henrique', 15, '1º Ano EM'),
('Juliana Paes', 13, '8º Ano'),
('Rafaela Souza', 16, '2º Ano EM'),
('Lucas Oliveira', 14, '9º Ano'),
('Isabela Alves', 13, '8º Ano');

SELECT * FROM alunos;

SELECT nome, idade FROM alunos;

SELECT * FROM alunos WHERE serie = '8º Ano';

UPDATE alunos
SET idade = 14
WHERE nome = 'Juliana Paes';

SELECT * FROM alunos WHERE nome = 'Juliana Paes';

SET SQL_SAFE_UPDATES=0;
DELETE FROM alunos WHERE nome = 'Lucas Oliveira';
SET SQL_SAFE_UPDATES=1;

SELECT * FROM alunos;

CREATE TABLE professores (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    materia VARCHAR(50)
);

INSERT INTO professores (nome, materia)
VALUES
('Carlos Drummond', 'Português'),
('Monica Teixeira', 'Matemática'),
('Alexandre Costa', 'História');

SELECT * FROM professores;