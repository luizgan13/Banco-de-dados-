CREATE DATABASE SGE;
	USE SGE;
/*Criando a primeira tabela*/    
CREATE TABLE alunos (
     id_aluno int auto_increment primary key,
	 nome varchar (100),
	 data_nasc date
);
/*Adicionando Coluna na primeira tabela*/
alter table Alunos
ADD column email varchar (50);
/*Criando a segunda  tabela*/  

alter table Alunos
ADD column id_curso int;
ALTER TABLE Alunos
drop column id_cruso;

alter table Alunos
add constraint fk_alunos_curso
foreign key (id_curso) references Cursos(id_curso);

/*Criando a segunda tabela*/   
create table Cursos ( 
	id_curso int auto_increment primary key,
    nome_curso varchar (50),
    carga_horaria int,
    disciplinas varchar (75), 
    horarios datetime
);

/*Adicionando Coluna na segunda tabela*/    
alter table Cursos 
ADD column preco decimal (10,2);

/*inserindo valores na tabela*/
insert into cursos(id_curso,nome_curso,preco)
values
(1, "Engenharia da Computação",3518.10),
(2,  "Análise Desenolvimento de Sistemas", 2758),
(3,  "Ciência da Computação ",1800);

/*inserindo valores na outra tabela*/
insert into alunos(id_aluno,nome,data_nasc)
values
(33, "Wesley Soldado",'2006-07-21'),
(22,  "Luiz Nascimento", '2005-05-18'),
(1,  "Camila Veloso", '1995-06-23');

/*Criando a terceira tabela de professores*/
CREATE TABLE professores (
    id_professor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    idade INT,
    email VARCHAR(50) UNIQUE
);

/*Adicionando valores na tabela de professores)*/
INSERT INTO professores (nome, idade, email)
VALUES
('Cefras Mandu', 25, 'cefras.mandu@sge.com'),
('Walney Negreiros', 33, 'ney.negreiros@grau.com'),
('Ramon Silva', 24, 'ramon.silva@sgeprof.com');

/*Criando a quarta tabela dos funcionários*/
CREATE TABLE funcionarios (
     id_funcionario int auto_increment primary key,
     nome varchar (100) not null,
     data_admissao date,
     cargo varchar (50),
     salario decimal (10,2),
     departamento varchar (50)
	);
    
/*Adicionando valores na tabela funcionários*/
insert into funcionarios (nome, data_admissao, cargo, salario, departamento)
values
('Jose Breno', '2013-03-03', 'Secretário', 3500.00, 'Secretaria'),
('Bruno Lima', '2022-04-15', 'Analista Financeiro', 4800.00, 'Financeiro'),
('Thamires Da Paz ', '2025-12-01', 'Coordenadora de RH', 6500.00, 'Recursos Humanos');

/*realizando consultas*/

SELECT nome, data_nasc
FROM alunos;

SELECT nome, cargo, data_admissao 
FROM funcionarios 
WHERE data_admissao > '2020-01-01';

SELECT nome, email, idade
FROM professores
WHERE idade > 30;

SELECT
    C.nome_curso AS Curso,
    COUNT(A.id_aluno) AS Total_Alunos
FROM
    Cursos C
LEFT JOIN
    alunos A ON C.id_curso = A.id_curso
GROUP BY
    C.nome_curso
ORDER BY
    Total_Alunos DESC;
