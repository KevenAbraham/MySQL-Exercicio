CREATE DATABASE Livraria;

USE Livraria;

CREATE TABLE tb_livro (
	pk_idLivro int PRIMARY KEY,
	autor varchar(20),
	titulo varchar(50),
	preco decimal(6,2), 
	genero varchar(20),
	classificacao int,
	tipo varchar(20),
	editora varchar(30),
	capa varchar(20),
	idioma varchar(20),
	idFonrnecedor int,
	estoque int,
	quantidadeVendida int,
	fk_idCliente int,
);

SELECT * FROM tb_livro;

CREATE TABLE tb_cliente (
	pk_idCliente int PRIMARY KEY,
	nome varchar(60),
	email varchar(60),
	telefone varchar(14),
	endereco varchar(80),
	cpf varchar(14),
	cep varchar(14),
	dataNasc varchar(10),
	cidade varchar(50),
	estado varchar(30),
	pais varchar(60),
	fk_idLivro int
    );

SELECT * FROM tb_cliente;

CREATE TABLE tb_fornecedor (
	nome varchar(50),
	cnpj varchar(14),
	fk_idProduto int,
	endereco varchar(80),
	telefone varchar(14),
	email varchar(60),
	cidade varchar(60),
	estado varchar(50),
	pais varchar(40),
	cep varchar(14),
	pk_idForncedor int PRIMARY KEY
);

SELECT * FROM tb_fornecedor;

CREATE TABLE tb_vendedor (
	pk_idVendedor int PRIMARY KEY,
	nomeVendedor varchar(60),
    unidade varchar(50),
    cpf varchar(14),
    dataNasc char(10),
	telefone varchar(14),
    email varchar(60),
    endereco varchar(60),
    salario decimal(6,2),
    dataAdmissao varchar(10),
    cargo varchar(30),
    carga_horaria char(3)  
);
    
SELECT * FROM tb_vendedor;

CREATE TABLE tb_produto (
	pk_idProduto int PRIMARY KEY,
    descricao varchar(150),
    fornecedor varchar(30),
    preco decimal(6,2),
    tipoPorduto varchar(20),
    imposto decimal(5,2)
);
    
SELECT * FROM tb_produto;
    