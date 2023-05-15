CREATE DATABASE Curso;

USE Curso;

CREATE TABLE tb_Instrutor (
cod_inst INT AUTO_INCREMENT PRIMARY KEY,
nome varchar(60),
sexo_inst ENUM('M', 'F'),
data_nasc date,
data_admissao date,
sal_inst DECIMAL(10,2));

INSERT INTO tb_Instrutor VALUES (null, 'WESLEY', 'M', '2005-11-12', '2023-01-11', '7980.52');
INSERT INTO tb_Instrutor VALUES (null, 'PEDRO', 'M', '2003-05-08', '2013-07-21', '6804.26');
INSERT INTO tb_Instrutor VALUES (null, 'JULIA', 'F', '2003-05-10', '2007-08-30', '9587.52');
INSERT INTO tb_Instrutor VALUES (null, 'ISABELLY', 'F', '2005-11-19', '2005-12-19', '10586.52');
INSERT INTO tb_Instrutor VALUES (null, 'DIOGO', 'M', '2007-10-15', '2021-04-08', '4515.52');
INSERT INTO tb_Instrutor VALUES (null, 'KEVEN', 'M', '2004-02-20', '2020-02-18', '9354.52');
INSERT INTO tb_Instrutor VALUES (null, 'RAMON', 'M', '2005-01-02', '2019-01-31', '5159.52');
INSERT INTO tb_Instrutor VALUES (null, 'MIGUEL', 'M', '2003-08-09', '2014-01-30', '4521.52');
INSERT INTO tb_Instrutor VALUES (null, 'DEBORA', 'F', '1980-02-13', '2007-06-19', '3258.52');
INSERT INTO tb_Instrutor VALUES (null, 'JOAO', 'M', '2004-04-06', '2003-09-25', '5215.52');
INSERT INTO tb_Instrutor VALUES (null, 'ADRIANA', 'F', '2000-07-06', '2007-07-06', '4526.52');
INSERT INTO tb_Instrutor VALUES (null, 'RAPHAEL VEIGA', 'M', '2005-11-12', '1999-11-06', '251486.52');
INSERT INTO tb_Instrutor VALUES (null, 'RONY', 'M', '2003-05-08', '2021-09-15', '321561.26');
INSERT INTO tb_Instrutor VALUES (null, 'LEILA PEREIRA', 'F', '1980-05-10', '2022-04-17', '1356758.52');
INSERT INTO tb_Instrutor VALUES (null, 'GUSTAVO GOMEZ', 'M', '1980-11-19', '2026-06-15', '215463.52');
INSERT INTO tb_Instrutor VALUES (null, 'PIQUEREZ', 'M', '1980-10-15', '2020-03-31', '984510.52');
INSERT INTO tb_Instrutor VALUES (null, 'WEVERTON', 'M', '1980-02-20', '1995-04-15', '485636.52');
INSERT INTO tb_Instrutor VALUES (null, 'GABRIEL MENINO', 'M', '1980-01-02', '2004-07-20', '89466.52');
INSERT INTO tb_Instrutor VALUES (null, 'RICHARD RIOS', 'M', '1980-08-09', '2005-06-08', '154256.52');
INSERT INTO tb_Instrutor VALUES (null, 'DUDU', 'M', '1980-02-13', '2006-07-06', '456218.52');
INSERT INTO tb_Instrutor VALUES (null, 'MARCOS ROCHA', 'M', '1980-04-06', '2009-03-09', '56556.52');
INSERT INTO tb_Instrutor VALUES (null, 'ENDRICK', 'M', '2006-07-06', '2008-01-09', '105859.52');

SELECT * FROM tb_Instrutor;

ALTER TABLE tb_Instrutor ADD COLUMN nacionalidade varchar(50); 

ALTER TABLE tb_Instrutor ADD COLUMN email varchar(60);

ALTER TABLE tb_Instrutor ADD COLUMN celular varchar(14);

ALTER TABLE tb_Instrutor DROP COLUMN data_nasc;

UPDATE tb_Instrutor SET nacionalidade = 'Brasileira';

UPDATE tb_Instrutor SET sal_inst = sal_inst + '320' WHERE data_admissao < '2013-01-01';

UPDATE tb_Instrutor SET sal_inst = sal_inst + '100' WHERE sexo_inst = 'F';

DELETE FROM tb_Instrutor WHERE cod_inst = '10';

DELETE FROM tb_Instrutor WHERE cod_inst = '15';

DELETE FROM tb_Instrutor WHERE cod_inst = '20';


