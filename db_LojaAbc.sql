show databases;

-- Deleta o DB caso exista, e mostra os DBs armazenados 
--! NÃO USAR EM UM AMBIENTE DE PRODUÇÃO !
DROP DATABASE dblojaabc;

-- Cria o DB referenciado e mostra os DBs atualizados
CREATE DATABASE dblojaabc;
-- Acessa o DB especifico e visualiza as tabelas dele
USE dblojaabc;

-- Cria as tabelas no banco
CREATE TABLE tbfornecedores(
  idFornc int,
  nome varchar(100),
  email varchar(100),
  telefone char(11)
);
CREATE TABLE tbprodutos(
  idProduct int,
  descricao varchar(100),
  valor decimal(9,2),
  quantidade int,
  dataEntr date,
  horaEntr time,
  validade datetime
);
CREATE TABLE tbfuncionarios(
  idFunc int,
  nome varchar(100),
  email varchar(100),
  cpf char(14),
  endereco varchar(100),
  numero char(10),
  bairro varchar(100),
  cep char(9),
  cidade varchar(100),
  estado char(2),
  telefone char(10),
  dataNasc date,
  salario decimal(9,2)
);
CREATE TABLE tbcarros(
  idCar int,
  nome varchar(100),
  placa char(7),
  cor varchar(100)
);
CREATE TABLE tbdiaria(
  idDay int,
  dataEntr date,
  horaEntr time,
  dataSaida date,
  horaSaida time
);

-- Inserir registros no banco 
--! (os dados inseridos devem seguir a ordem de inserção dos campos)
INSERT INTO tbfuncionarios(idFunc,nome,email,cpf,endereco,numero,bairro,cep,cidade,estado,telefone,dataNasc,salario)values(1,'Franscisca da Silva','francisca.silva@email.com','123.456.789-10','Rua ExDr Antonio Bento','355','Santo Amaro','0470-000','São Paulo','SP','91234-5678','2000/10/31',1500.50);

SELECT * FROM tbfuncionarios;

-- Mostra as TABLAS do banco; mostra os campos das tabelas
show tables;
DESC tbprodutos;
DESC tbfornecedores;
DESC tbfuncionarios;
DESC tbcarros;
DESC tbdiaria;