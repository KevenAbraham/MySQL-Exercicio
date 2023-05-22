CREATE DATABASE db_cds;

USE db_cds;

CREATE TABLE tb_artista (
idArtista INT NOT NULL,
nomeArtista VARCHAR(100) NOT NULL,
CONSTRAINT pk_idArtista PRIMARY KEY (idArtista)
);

INSERT INTO tb_artista VALUES('1', 'Pedro');
INSERT INTO tb_artista VALUES('2', 'Ramon');
INSERT INTO tb_artista VALUES('3', 'Wesley');
INSERT INTO tb_artista VALUES('4', 'Diogo');
INSERT INTO tb_artista VALUES('5', 'Keven');

SELECT * FROM tb_artista;

CREATE TABLE tb_gravadora (
idGravadora INT NOT NULL,
nomeGravadora VARCHAR(50) NOT NULL,
CONSTRAINT pk_idGravadora PRIMARY KEY (idGravadora),
CONSTRAINT uk_nomeGravadora UNIQUE (nomeGravadora) 
);

INSERT INTO tb_gravadora VALUES ('1', 'Detona Funk');
INSERT INTO tb_gravadora VALUES ('2', 'Bailão a Meia Noite');
INSERT INTO tb_gravadora VALUES ('3', 'Casarão');
INSERT INTO tb_gravadora VALUES ('4', 'DJ Markinho');
INSERT INTO tb_gravadora VALUES ('5', 'Portugal Records');

SELECT * FROM tb_gravadora;

CREATE TABLE tb_categoria (
idCategoria INT NOT NULL,
nomeCategoria VARCHAR(50) NOT NULL,
CONSTRAINT pk_idCategaoria PRIMARY KEY (idCategoria),
CONSTRAINT uk_nomeCategoria UNIQUE (nomeCategoria) 
);

SELECT * FROM tb_categoria;

INSERT INTO tb_categoria VALUES('1','Trap');
INSERT INTO tb_categoria VALUES('2','MPB');
INSERT INTO tb_categoria VALUES('3','Gospel');
INSERT INTO tb_categoria VALUES('4','RAP');
INSERT INTO tb_categoria VALUES('5','Samba');

CREATE TABLE tb_estado ( 
siglaEstado CHAR(2) NOT NULL,
nomeEstado VARCHAR(30) NOT NULL,
CONSTRAINT pk_siglaEstado PRIMARY KEY (siglaEstado),
CONSTRAINT uk_nomeEstado UNIQUE (nomeEstado)
);

INSERT INTO tb_estado VALUES('SP', 'São Paulo');
INSERT INTO tb_estado VALUES('RJ', 'Rio de Janeiro');
INSERT INTO tb_estado VALUES('AL', 'Alagoas');
INSERT INTO tb_estado VALUES('PE', 'Pernambuco');
INSERT INTO tb_estado VALUES('SC', 'Santa Catarina');

SELECT * FROM tb_estado;

CREATE TABLE tb_cidade (
idCidade INT NOT NULL,
siglaEstado CHAR(2) NOT NULL,
nomeCidade VARCHAR(100) NOT NULL,
CONSTRAINT pk_idCidade PRIMARY KEY (idCidade)
);

ALTER TABLE tb_cidade ADD CONSTRAINT fk_siglaEstado FOREIGN KEY (siglaEstado) REFERENCES tb_estado(siglaEstado); /* foi */

SELECT * FROM tb_cidade;

INSERT INTO tb_cidade VALUES ('1', 'SP', 'São Paulo');
INSERT INTO tb_cidade VALUES ('2', 'RJ', 'Rio de Janeiro');
INSERT INTO tb_cidade VALUES ('3', 'PE', 'Pernambuco');
INSERT INTO tb_cidade VALUES ('4', 'AL', 'Alagoas');
INSERT INTO tb_cidade VALUES ('5', 'SC', 'Balneário Camboriú');

CREATE TABLE tb_cliente ( 
	idCliente INT NOT NULL,
    codCidade INT NOT NULL,
    nomeCliente VARCHAR(100) NOT NULL,
    enderecoCliente VARCHAR(200) NOT NULL,
    rendaCliente DECIMAL(10,2) NOT NULL,
    sexoCliente ENUM("F", "M") DEFAULT("F"),
    CONSTRAINT pk_idCliente PRIMARY KEY (idCliente),
    CONSTRAINT fk_codCidade FOREIGN KEY (codCidade) REFERENCES tb_cidade(idCidade)
);

SELECT * FROM tb_cliente;

INSERT INTO tb_cliente VALUES ('1', '1', 'João Kleber', 'R. Amarildo, 234', '1200.34', 'M');
INSERT INTO tb_cliente VALUES ('2', '2', 'Julia Maria', 'Rua Bogotá, 543', '4545.20', 'F');
INSERT INTO tb_cliente VALUES ('3', '3', 'Neymar Junior', 'Rua Avestruz Da Meia Noite', '852692.25', 'M');
INSERT INTO tb_cliente VALUES ('4', '4', 'Ancara Messi', 'Rua Barcelona, 5432', '1236485.78', 'M');
INSERT INTO tb_cliente VALUES ('5', '5', 'Marcia Fernandes', 'Rua Beliche, 7654', '250.99', 'F');

CREATE TABLE tb_conjugue (
idConjugue INT NOT NULL,
nomeConjugue VARCHAR(100) NOT NULL,
rendaConjugue DECIMAL(10,2) NOT NULL,
sexoConjugue ENUM("F", "M") DEFAULT("F"),
CONSTRAINT pk_idConjugue PRIMARY KEY (idConjugue)
);

INSERT INTO tb_conjugue VALUES ('1', 'Maiara Josefina', '554.99', 'F');
INSERT INTO tb_conjugue VALUES ('2', 'Caio Vitor', '7845.95', 'M');
INSERT INTO tb_conjugue VALUES ('3', 'Bruna Vitoria', '3614.32', 'F');
INSERT INTO tb_conjugue VALUES ('4', 'Maria Joaquina', '486.82', 'F');
INSERT INTO tb_conjugue VALUES ('5', 'Marcio Fagundes', '1659.99', 'M');

SELECT * FROM tb_conjugue;

CREATE TABLE tb_funcionario (
	idFuncionario INT NOT NULL,
    nomeFuncionario VARCHAR(60) NOT NULL,
    enderecoFuncionario VARCHAR(200) NOT NULL,
    salarioFuncionario DECIMAL(10,2) NOT NULL,
    sexoFuncionario ENUM("F", "M") DEFAULT ("F"),
    CONSTRAINT pk_idFuncionario PRIMARY KEY (idFuncionario)    
);

INSERT INTO tb_funcionario VALUES ('1', 'Keven Abraham de Souza', 'Rua Skenaro, 968', '19876.65', 'M');
INSERT INTO tb_funcionario VALUES ('2', 'Raphael Veiga', 'Rua Marcondes II, 7845', '250956.24', 'M');
INSERT INTO tb_funcionario VALUES ('3', 'Rafaela Ballerini', 'Rua Arigatô, 9563', '3146.69', 'F'); 
INSERT INTO tb_funcionario VALUES ('4', 'Mariana Moura', 'Rua Josefino da Silva', '845989.55', 'F');
INSERT INTO tb_funcionario VALUES ('5', 'Roberta Ferreira Machado', 'Rua Augusto Fagundes', '56268.98', 'F');

SELECT * FROM tb_funcionario;

CREATE TABLE tb_dependente (
	idDependente INT NOT NULL,
	codFuncionario INT NOT NULL,
    nomeDepartamento VARCHAR(100) NOT NULL,
    sexoDependente ENUM("F", "M") DEFAULT("F") NOT NULL
);

ALTER TABLE tb_dependente ADD COLUMN nomeDependente VARCHAR(60);
ALTER TABLE tb_dependente ADD CONSTRAINT fk_codFuncionario FOREIGN KEY (idDependente) REFERENCES tb_funcionario(idFuncionario);
ALTER TABLE tb_dependente ADD CONSTRAINT pk_idDependente PRIMARY KEY (idDependente);

INSERT INTO tb_dependente VALUES ('1', '1', 'Desginer', 'F');
INSERT INTO tb_dependente VALUES ('2', '2', 'DBA', 'F');
INSERT INTO tb_dependente VALUES ('3', '3', 'Contador', 'M');
INSERT INTO tb_dependente VALUES ('4', '4', 'Policial', 'M');
INSERT INTO tb_dependente VALUES ('5', '5', 'Dentista', 'F');

UPDATE tb_dependente SET nomeDependente = 'Moquidésia da Silva' WHERE idDependente = '1';
UPDATE tb_dependente SET nomeDependente = 'Carlinhos Corinthians' WHERE idDependente = '2';
UPDATE tb_dependente SET nomeDependente = 'Juninho Pernambucano' WHERE idDependente = '3';
UPDATE tb_dependente SET nomeDependente = 'Paulinho' WHERE idDependente = '4';
UPDATE tb_dependente SET nomeDependente = 'Rodrigo Faro' WHERE idDependente = '5';

SELECT * FROM tb_dependente;

CREATE TABLE tb_titulo (
	idTitulo INT NOT NULL,
    idCategoria INT NOT NULL,
    idGravadora INT NOT NULL,
    nomeCD VARCHAR(60) NOT NULL,
    valorCD DECIMAL(10,2) NOT NULL,
    CONSTRAINT pk_idTitulo PRIMARY KEY (idTitulo),
    CONSTRAINT fk_idCategoria FOREIGN KEY (idCategoria) REFERENCES tb_categoria(idCategoria),
    CONSTRAINT fk_idGravadora FOREIGN KEY (idGravadora) REFERENCES tb_gravadora(idGravadora)
);

ALTER TABLE tb_titulo ADD COLUMN qtdEstoque INT NOT NULL;

UPDATE tb_titulo SET qtdEstoque = '1000' WHERE idTitulo = '1';
UPDATE tb_titulo SET qtdEstoque = '4851' WHERE idTitulo = '2';
UPDATE tb_titulo SET qtdEstoque = '203' WHERE idTitulo = '3';
UPDATE tb_titulo SET qtdEstoque = '845' WHERE idTitulo = '4';
UPDATE tb_titulo SET qtdEstoque = '324' WHERE idTitulo = '5';

INSERT INTO tb_titulo VALUES ('1', '1', '1', 'Amado Batista', '15.99');
INSERT INTO tb_titulo VALUES ('2', '2', '2', 'Cantos da Torcida do Palmeiras', '26.99');
INSERT INTO tb_titulo VALUES ('3', '3', '3', 'Flamingo', '12.85');
INSERT INTO tb_titulo VALUES ('4', '4', '4', 'Mineirinho', '0.75');
INSERT INTO tb_titulo VALUES ('5', '5', '5', 'Carros Trilogia', '55.36');

SELECT * FROM tb_titulo;

CREATE TABLE tb_pedido (
	idPedidos INT NOT NULL,
    idFuncionario INT NOT NULL,
    dataPedido DATE NOT NULL,
    valorPedido DECIMAL(10,2) NOT NULL,
	CONSTRAINT pk_idPedidos PRIMARY KEY (idPedidos),
    CONSTRAINT pk_idFuncionario FOREIGN KEY (idFuncionario) REFERENCES tb_funcionario(idFuncionario)
);

INSERT INTO tb_pedido VALUES ('1', '1', '2012-05-21', '153.36');
INSERT INTO tb_pedido VALUES ('2', '2', '2015-09-20', '973.48');
INSERT INTO tb_pedido VALUES ('3', '3', '2020-02-06', '746.23');
INSERT INTO tb_pedido VALUES ('4', '4', '2020-04-18', '75.85');
INSERT INTO tb_pedido VALUES ('5', '5', '2018-05-03', '14.37');

SELECT * FROM tb_pedido;

CREATE TABLE tb_tituloPedido (
	numPedido INT NOT NULL,
    codTitulo INT NOT NULL,
    qtdCD INT NOT NULL,
    valCD DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_numPedido FOREIGN KEY (numPedido) REFERENCES tb_pedido(idPedidos),
    CONSTRAINT fk_codTitulo FOREIGN KEY (codTitulo) REFERENCES tb_titulo(idTitulo)
);

INSERT INTO tb_tituloPedido VALUES ('1', '1', '200', '145.45');
INSERT INTO tb_tituloPedido VALUES ('2', '2', '100', '320.45');
INSERT INTO tb_tituloPedido VALUES ('3', '3', '150', '250.54');
INSERT INTO tb_tituloPedido VALUES ('4', '4', '74', '36.88');
INSERT INTO tb_tituloPedido VALUES ('5', '5', '98', '75.85');

SELECT * FROM tb_tituloPedido;

CREATE TABLE tb_tituloArtista (
	codTitulo INT NOT NULL,
    codArtista INT NOT NULL,
    CONSTRAINT fk_codArtista FOREIGN KEY (codArtista) REFERENCES tb_artista(idArtista),
    CONSTRAINT fk_codigoTitulo FOREIGN KEY (codTitulo) REFERENCES tb_titulo(idTitulo)
);

INSERT INTO tb_tituloArtista VALUES ('1', '1');
INSERT INTO tb_tituloArtista VALUES ('2', '2');
INSERT INTO tb_tituloArtista VALUES ('3', '3');
INSERT INTO tb_tituloArtista VALUES ('4', '4');
INSERT INTO tb_tituloArtista VALUES ('5', '5');

SELECT * FROM tb_tituloArtista;

SELECT tb_categoria.nomeCategoria, tb_titulo.nomeCD FROM tb_categoria JOIN tb_titulo ON tb_categoria.idCategoria = tb_titulo.idCategoria;
/* SELECIONE O 'nomeCategoria' DA TABELA tb_categoria E O 'nomeCD' da TABELA tb_titulo DA TABELA 'tb_categoria'. JUNTE OS CAMPOS DA TABELA 
tb_titulo AONDE O ID DA CATEGORIA DA TABELA tb_categoria SEJAM IGUAIS AOS IDs DE CATEGORIA NA TABELA tb_titulo*/

SELECT tb_pedido.idPedidos, tb_cliente.nomeCliente FROM tb_pedido JOIN tb_cliente ON tb_pedido.idPedidos = tb_cliente.idCliente;

SELECT f.nomeFuncionario AS Funcionario, d.nomeDependente FROM tb_funcionario AS f JOIN tb_dependente AS d ON f.idFuncionario = d.idDependente;

SELECT f.nomeFuncionario AS Nome_Funcionario, p.valorPedido AS Valor_Dos_Pedidos FROM tb_funcionario AS f JOIN tb_pedido AS p ON f.idFuncionario = p.idPedidos;

SELECT cliente.nomeCliente AS Cliente, cidade.nomeCidade AS Nome_Cliente FROM tb_cliente AS cliente JOIN tb_cidade AS cidade ON cliente.idCliente = cidade.idCidade
WHERE sexoCliente = 'F';

SELECT c.nomeCD AS CD, g.nomeGravadora AS Gravadora FROM tb_titulo AS c JOIN tb_gravadora AS g ON c.idTitulo = g.idGravadora WHERE c.nomeCD LIKE 'C%';

SELECT g.nomeGravadora AS Gravadora, cd.nomeCD AS Nome_CD, cd.valorCD AS Valor_CD, cd.qtdEstoque AS Quantidade
FROM tb_gravadora AS g 
JOIN tb_titulo AS cd ON g.idGravadora = cd.idTitulo
WHERE qtdEstoque < 500;

SELECT n.nomeCliente AS Cliente, v.valorPedido
FROM tb_cliente AS n
JOIN tb_pedido AS v ON n.idCliente = v.idPedidos
WHERE n.sexoCliente = 'F' AND YEAR(v.dataPedido) = 2015;

SELECT p.idPedidos AS Numero_Pedido, p.valorPedido AS Valor_Pedido, p.dataPedido AS Data_Pedido, n.nomeFuncionario as Nome_Funcionario
FROM tb_pedido AS p
JOIN tb_funcionario AS n ON p.idPedidos = n.idFuncionario
WHERE YEAR(p.dataPedido) = 2020 AND TRIM(SUBSTRING_INDEX(n.nomeFuncionario, ' ', 1)) = 'Rafaela';

SELECT c.nomeCliente AS Nome_Cliente, p.idPedidos AS Num_Pedido, p.valorPedido AS Valor_Pedido
FROM tb_cliente AS c
JOIN tb_pedido AS p ON c.idCliente = p.idPedidos
WHERE p.valorPedido = (
	SELECT MAX(valorPedido)
    FROM tb_pedido
)
LIMIT 1;

SELECT DISTINCT a.nomeArtista AS Artista, c.nomeCategoria AS Categoria
FROM tb_artista AS A
JOIN tb_categoria AS c ON a.idArtista = c.idCategoria;

SELECT n.idCliente AS ID_Cliente, n.nomeCliente AS Nome_Cliente, f.idFuncionario AS ID_Funcionario, f.nomeFuncionario
FROM tb_cliente AS n
JOIN tb_funcionario AS f ON n.idCliente = f.idFuncionario;

SELECT c.nomeCliente AS Nome_Cliente, cd.nomeCD AS Nome_CD
FROM tb_cliente AS c
JOIN tb_titulo AS cd ON c.idCliente = cd.idTitulo;

SELECT cd.nomeCD AS Nome_CD, g.nomeGravadora AS Gravadora, c.nomeCategoria AS Categoria
FROM tb_titulo AS cd
JOIN tb_gravadora AS g ON cd.idTitulo = g.idGravadora
JOIN tb_categoria AS c ON g.idGravadora = c.idCategoria;

SELECT f.nomeFuncionario AS Funcionario, d.nomeDependente AS Dependente, c.nomeCliente AS Cliente, co.nomeConjugue
FROM tb_funcionario AS f
JOIN tb_dependente AS d ON f.idFuncionario = d.idDependente
JOIN tb_cliente AS c ON d.idDependente = c.idCliente 
JOIN tb_conjugue AS co ON c.idCliente = co.idConjugue;

SELECT c.nomeCliente AS Cliente, f.nomeFuncionario AS Funcionario, cd.nomeCD AS Nome_CD, cat.nomeCategoria AS Categoria, g.nomeGravadora AS Gravadora
FROM tb_cliente AS c
JOIN tb_funcionario AS f ON c.idCliente = f.idFuncionario
JOIN tb_titulo AS cd ON f.idFuncionario = cd.idTitulo
JOIN tb_categoria AS cat ON cd.idTitulo = cat.idCategoria
JOIN tb_gravadora AS g ON cat.idCategoria = g.idGravadora;