drop database dbestacionamento;
show databases;
create database dbestacionamento;
use dbestacionamento

CREATE table tbusuarios(
  codUsr int,
  usrNome varchar(30),
  usrPass varchar(8)
);

CREATE TABLE tbfuncionarios(
  idFunc int,
  nome varchar(100),
  email varchar(100),
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

desc tbcarros;
desc tbdiaria;
desc tbfuncionarios;
desc tbusuarios;

show tables;

-- Altera a tabela e adiciona um novo campo
alter table tbfuncionarios
add cpf char(14);
desc tbfuncionarios;

-- remove o campo da tabela
alter table tbcarros
drop column nome;

alter table tbcarros
add modelo varchar(100);
desc tbcarros;