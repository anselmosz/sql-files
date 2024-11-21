drop database dbloja;
create database dbloja;
show databases;

use dbloja

create table tbfuncionarios(
  codFunc int not null auto_increment,
  nome varchar(100) not null,
  rg char(13) unique,
  cpf char(14) not null unique,
  sexo char(1) default 'F' check(sexo in('F','M')),
  salario decimal(9,2) default 0 check(salario >=0),
  primary key(codFunc)
);

create table tbclientes(
  codCli int not null auto_increment,
  nome varchar(50),
  email varchar(50),
  telCel char(10),
  primary key(codCli)
);

create table tbfornecedores(
  codForn int not null auto_increment,
  nome varchar(100),
  email varchar(100),
  telefone char(10),
  cnpj char(14) not null unique,
  primary key(codForn)
);

create table tbusers(
  codUsr int not null auto_increment,
  nome varchar(50) not null,
  senha varchar(20) not null,
  codFunc int not null,
  primary key(codUsr),
  foreign key(codFunc)references tbfuncionarios(codFunc)
);

create table tbprodutos(
  codProd int not null auto_increment,
  descricao varchar(100) not null,
  lote char(12),
  validade date,
  dataEntr date,
  horaEntr time,
  quantidade int,
  preco decimal(9,2),
  codForn int not null,
  primary key(codProd),
  foreign key(codForn)references tbfornecedores(codForn)
);

create table tbvendas(
  codVenda int not null auto_increment,
  valor decimal(9,2),
  dataVenda date,
  horaVenda time,
  quantidade int,
  codUsr int not null,
  codProd int not null,
  codCli int not null,
  primary key(codVenda),
  foreign key(codUsr)references tbusers(codUsr),
  foreign key(codProd)references tbprodutos(codProd),
  foreign key(codCli)references tbclientes(codCli)
);

desc tbfuncionarios;
desc tbclientes;
desc tbfornecedores;
desc tbusers;
desc tbprodutos;
desc tbvendas;

insert into tbfuncionarios(nome,rg,cpf,sexo,salario)values('Matheus Anselmo','00.111.222-33','213.654.587-89','M',1414.00);
insert into tbfuncionarios(nome,rg,cpf,sexo,salario)values('Angelica Mendes','22.555.999-33','455.519.359-94','F',1200.00);
insert into tbfuncionarios(nome,rg,cpf,sexo,salario)values('Gustavo Hermes','11.222.333-44','799.855.147-71','M',3440.00);
insert into tbfuncionarios(nome,rg,cpf,sexo,salario)values('Andrea Doria ','66.478.222-55','544.951.347-14','F',2700.00);

insert into tbclientes(nome,email,telcel)values('Joana Antunes','joana.ant@gmail.com','93312-2131');
insert into tbclientes(nome,email,telcel)values('Katia Assad','katia.assad@gmail.com','93464-9479');
insert into tbclientes(nome,email,telcel)values('Jor El','jor.el@gmail.com','95427-6741');

insert into tbfornecedores(nome,email,telefone,cnpj)values('Armarinho Fernando','armarinho.ferando@hotmail.com','94621-6712','84.455.544/0001-91');
insert into tbfornecedores(nome,email,telefone,cnpj)values('Hortifruti Fernando','hft.ferando@hotmail.com','97852-3584','74.654.321/0001-78');
insert into tbfornecedores(nome,email,telefone,cnpj)values('Tenda Atacado','tenda.atacado@hotmail.com','95153-7622','97.324.012/0001-31');
insert into tbfornecedores(nome,email,telefone,cnpj)values('Guarani Fernando','guarani.ferando@hotmail.com','97852-3584','72.321.684/0001-45');

insert into tbprodutos(descricao,lote,validade,dataEntr,horaEntr,quantidade,preco,codForn)values('Mesa de escritorio','123456789012','2026/04/22','2024/04/22','09:47:00',400,120.00,1);
insert into tbprodutos(descricao,lote,validade,dataEntr,horaEntr,quantidade,preco,codForn)values('Batata Doce','123456789012','2026/04/22','2024/04/22','09:47:00',400,10.00,2);
insert into tbprodutos(descricao,lote,validade,dataEntr,horaEntr,quantidade,preco,codForn)values('Fardo de acucar','123456789012','2026/04/22','2024/04/22','09:47:00',400,20.00,3);
insert into tbprodutos(descricao,lote,validade,dataEntr,horaEntr,quantidade,preco,codForn)values('Cabo par metalico tranc 300m','123456789012','2026/04/22','2024/04/22','09:47:00',400,120.00,4);
insert into tbprodutos(descricao,lote,validade,dataEntr,horaEntr,quantidade,preco,codForn)values('Conector RJ-45','123456789012','2026/04/22','2024/04/22','09:47:00',400,5.00,1);

insert into tbusers(nome,senha,codFunc)values('matheus.anselmo','12345678',1);
insert into tbusers(nome,senha,codFunc)values('angelica.mendes','12345678',2);
insert into tbusers(nome,senha,codFunc)values('gustavo.hermes','12345678',3);
insert into tbusers(nome,senha,codFunc)values('andrea.doria','12345678',4);

insert into tbvendas(valor,quantidade,dataVenda,horaVenda,codUsr,codProd,codCli)values(240.00,2,'2024/11/22','08:42:00',1,1,3);
insert into tbvendas(valor,quantidade,dataVenda,horaVenda,codUsr,codProd,codCli)values(20.00,2,'2024/11/22','08:10:00',2,2,1);
insert into tbvendas(valor,quantidade,dataVenda,horaVenda,codUsr,codProd,codCli)values(100.00,5,'2024/11/22','13:10:00',3,3,2);
insert into tbvendas(valor,quantidade,dataVenda,horaVenda,codUsr,codProd,codCli)values(500.00,100,'2024/11/22','17:00:00',2,5,1);
insert into tbvendas(valor,quantidade,dataVenda,horaVenda,codUsr,codProd,codCli)values(50.00,5,'2024/11/22','18:12:00',2,2,1);

select * from tbfuncionarios;
select * from tbusers;
select * from tbclientes;
select * from tbfornecedores;
select * from tbprodutos;
select * from tbvendas;

select func.nome as 'Nome do Funcionario',usu.nome as 'Nome de Usuario' from tbusers as usu inner join tbfuncionarios as func on usu.codFunc = func.codFunc;

select func.nome as 'Nome do Funcionario',usu.nome as 'Nome de Usuario' from tbusers as usu inner join tbfuncionarios as func on usu.codFunc = func.codFunc where func.codFunc = 2;