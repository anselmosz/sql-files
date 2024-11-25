drop database dbpadaria;
create database dbpadaria;
show databases;

use dbpadaria;

create table tbfuncionarios(
  codFunc int not null auto_increment,
  nome varchar(100) not null,
  rg char(12) unique,
  cpf char(14) unique not null,
  carteira char(11) not null,
  email varchar(50),
  telefone char(10),
  endereco varchar(100),
  numero char(5),
  bairro varchar(100),
  cep char(9) not null,
  cidade varchar(50),
  estado char(2).
  cargo varchar(50)
  salario decimal(9,2) default 0 check(salario >= 0),
  primary key(codFunc)
);

create table tbusuarios(
  codUsr int not null auto_increment,
  nome varchar(50),
  senha varchar(20),
  primary key(codUsr),
  foreign key(codFunc)
);