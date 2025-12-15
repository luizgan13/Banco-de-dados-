

/* =========================================
   CRIAÇÃO DO BANCO DE DADOS
========================================= */
DROP DATABASE IF EXISTS clinicaMedicaDB;
CREATE DATABASE clinicaMedicaDB;
USE clinicaMedicaDB;

/* =========================================
   TABELA MÉDICO
========================================= */
CREATE TABLE medico (
    CRM VARCHAR(10) PRIMARY KEY,
    NOME VARCHAR(50) NOT NULL,
    EMAIL VARCHAR(80) NOT NULL,
    TELEFONE VARCHAR(15) UNIQUE,
    DATA_NASC DATE,
    ESPECIALIZACAO VARCHAR(25)
);

/* =========================================
   TABELA PACIENTE
========================================= */
CREATE TABLE paciente (
    ID INT PRIMARY KEY,
    CPF VARCHAR(15) UNIQUE,
    NOME VARCHAR(100),
    ENDERECO VARCHAR(75),
    TELEFONE VARCHAR(15) UNIQUE,
    TIPO_EXAME VARCHAR(25)
);

/* =========================================
   TABELA CONSULTA
========================================= */
CREATE TABLE consulta (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ID_MEDICO VARCHAR(10) NOT NULL,
    ID_PACIENTE INT NOT NULL,
    DATA_CONSULT DATE NOT NULL,
    VALOR DOUBLE NOT NULL,
    TIPO_PAG VARCHAR(20),
    FOREIGN KEY (ID_MEDICO) REFERENCES medico(CRM),
    FOREIGN KEY (ID_PACIENTE) REFERENCES paciente(ID)
);

/* =========================================
   TABELA EXAME
========================================= */
CREATE TABLE exame (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ID_MEDICO VARCHAR(10) NOT NULL,
    ID_PACIENTE INT NOT NULL,
    DATA_EXAME DATE,
    VALOR DOUBLE NOT NULL,
    TIPO_PAG VARCHAR(20),
    TIPO_EXAME VARCHAR(50),
    FOREIGN KEY (ID_MEDICO) REFERENCES medico(CRM),
    FOREIGN KEY (ID_PACIENTE) REFERENCES paciente(ID)
);

/* =========================================
   INSERTS - MÉDICOS
========================================= */
INSERT INTO medico (CRM, NOME, EMAIL, TELEFONE, DATA_NASC, ESPECIALIZACAO)
VALUES
('111222-PB', 'Carlos Eduardo Nunes', 'carlos.nunes@clinica.com', '83991112233', '1980-03-12', 'Neurologia'),
('222333-PB', 'Fernanda Lopes Araujo', 'fernanda.araujo@clinica.com', '83992223344', '1987-06-25', 'Endocrinologia'),
('333444-PB', 'Marcos Vinicius Pereira', 'marcos.pereira@clinica.com', '83993334455', '1975-10-18', 'Urologia'),
('444555-PB', 'Juliana Mendes Costa', 'juliana.costa@clinica.com', '83994445566', '1991-01-09', 'Oftalmologia'),
('555666-PB', 'Paulo Henrique Rocha', 'paulo.rocha@clinica.com', '83995556677', '1984-08-30', 'Psiquiatria');

/* =========================================
   INSERTS - PACIENTES
========================================= */
INSERT INTO paciente (ID, CPF, NOME, ENDERECO, TELEFONE, TIPO_EXAME)
VALUES
(1, '111.222.333-44', 'Ana Paula Martins', 'Rua das Palmeiras, 45 - Alto Branco', '83996667788', 'Ultrassom'),
(2, '222.333.444-55', 'Bruno Cesar Almeida', 'Av. Floriano Peixoto, 980 - Centro', '83997778899', 'Hemograma'),
(3, '333.444.555-66', 'Camila Torres Lima', 'Rua Rio Grande do Norte, 210 - Liberdade', '83998889900', 'Ressonância Magnética'),
(4, '444.555.666-77', 'Diego Araujo Santos', 'Rua Santa Catarina, 88 - Cruzeiro', '83990001122', 'Tomografia'),
(5, '555.666.777-88', 'Elaine Rodrigues Pacheco', 'Rua Maranhão, 150 - Catolé', '83991122334', 'Eletrocardiograma'),
(6, '666.777.888-99', 'Felipe Gonçalves Ribeiro', 'Rua Sergipe, 300 - Conceição', '83992233445', 'Raio-X'),
(7, '777.888.999-00', 'Gabriela Farias Melo', 'Rua Amazonas, 55 - Prata', '83993344556', 'Endoscopia'),
(8, '888.999.000-11', 'Henrique Batista Cunha', 'Rua Paraíba, 410 - Centro', '83994455667', 'Hemograma'),
(9, '999.000.111-22', 'Isabela Nogueira Freitas', 'Rua Bahia, 72 - Bodocongó', '83995566778', 'Ultrassom'),
(10, '000.111.222-33', 'João Lucas Monteiro', 'Rua Alagoas, 95 - Malvinas', '83996677889', 'Tomografia');

/* =========================================
   UPDATE
========================================= */
UPDATE paciente
SET TELEFONE = '83999999999'
WHERE ID = 2;

/* =========================================
   CONSULTAS SELECT
========================================= */
SELECT * FROM paciente;

SELECT NOME, ESPECIALIZACAO
FROM medico;

SELECT *
FROM paciente
WHERE ID = 1;

ALTER TABLE paciente
ADD DATA_NASC DATE;

SELECT *
FROM paciente
WHERE DATA_NASC > '2000-01-01';

SELECT *
FROM medico
WHERE ESPECIALIZACAO = 'Neurologia';
