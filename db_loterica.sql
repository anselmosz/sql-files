-- Deleta o banco caso ele exista
drop database dbloterica;
-- Cria o banco dentro do servidor
create database dbloterica; 
show databases;

-- Acessa o banco criado
use dbloterica;

-- Cria a tabela de funcionarios e seus campos dentro do banco
create table tbfuncionarios(
  idFunc int,
  nome varchar(100),
  email varchar(100),
  tel char(10),
  cpf char(14),
  idade int,
  salario decimal(9,2)
);

show tables;
desc tbfuncionarios;

-- Insere registros dentro dos campos específicados na tabela enfatizada
insert into tbfuncionarios(idFunc,nome,email,tel,cpf)values(1,'Joao Fulano','joao.fulano@gmail.com','91234-5678','123.456.789-01');

insert into tbfuncionarios(idFunc,nome,email,tel,cpf)values(2,'Maria Celestina','maria.celestina@gmail.com','93214-5678','987.654.123-00');

insert into tbfuncionarios(idFunc,nome,email,tel,cpf)values(3,'Eduardo Botelho','edu.botelho@gmail.com','97864-5612','321.564.978-88');

insert into tbfuncionarios(nome,email)values('Paulo Antunes','pauloant@gmail.com');

insert into tbfuncionarios(idFunc,email)values(5,'rodrigo.andre@gmail.com');
insert into tbfuncionarios(idFunc,email)values(5,'rodrigo.andre@gmail.com');
insert into tbfuncionarios(idFunc,email)values(5,'rodrigo.andre@gmail.com');

-- Visualiza os dados nos campos da tabela
select * from tbfuncionarios;