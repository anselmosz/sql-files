-- Deleta o banco caso exista, e em seguida cria ele
drop database dbzoo;
create database dbzoo;

-- Mostra se o banco foi criado e acessa ele em seguida
show databases;
use dbzoo;

-- Cria a tabela de animais e seus campos, em seguida mostra as tabelas no banco dbzoo
create table tbanimais(
  codAnimal int,
  tipo char(15),
  nome char(30),
  idade int,
  valor decimal(10,2)
);
show tables;

-- Visualiza os registros existentes, em seguida insere registros nos campos
select * from tbanimais;
insert into tbanimais(codAnimal,tipo,nome,idade,valor)values(1,'cachorro','Djudi',3,300.00);
insert into tbanimais(codAnimal,tipo,nome,idade,valor)values(2,'cachorro','Sula',5,300.00);
insert into tbanimais(codAnimal,tipo,nome,idade,valor)values(3,'cachorro','Sarina',7,300.00);
insert into tbanimais(codAnimal,tipo,nome,idade,valor)values(4,'gato','Pipa',2,500.00);
insert into tbanimais(codAnimal,tipo,nome,idade,valor)values(5,'gato','Sarangue',2,500.00);
insert into tbanimais(codAnimal,tipo,nome,idade,valor)values(6,'gato','Clarences',1,500.00);
insert into tbanimais(codAnimal,tipo,nome,idade,valor)values(7,'coruja','Agnes',0,700.00);
insert into tbanimais(codAnimal,tipo,nome,idade,valor)values(8,'coruja','Arabela',1,700.00);
insert into tbanimais(codAnimal,tipo,nome,idade,valor)values(9,'sapo','Quash',1,100.00);
insert into tbanimais(codAnimal,tipo,nome,idade,valor)values(1,'peixe','Fish',0,100.00);

-- Vizualiza todos os registros depois de os registros serem inseridos na tabela
select * from tbanimais;

-- Vizualiza os campos de "tipo" e "nome"
select tipo, nome from tbanimais;

-- Vizualiza os campos de "tipo", "nome" e "idade"
select tipo, nome, idade from tbanimais;

-- Vizualiza os campos de "tipo" com o alias 'tipo de animal', e "nome" com o alias 'nome do animal', apresentado todos os registros
select tipo as 'tipo de animal', nome as 'nome do animal' from tbanimais;

-- Vizualiza os campos de "tipo" com o alias 'tipo de animal', "nome" com o alias 'nome do animal', e idade com o alias 'tempo de vida' apresentado todos os registros
select tipo as 'tipo de animal', nome as 'nome do animal', idade as 'tempo de vida' from tbanimais;

-- Vizualiza os campos de "tipo", "nome" e "idade" com o alias 'tempo de vida', além de criar o campo virtual "procedência" 
select 'animal domestico' as 'procedencia', tipo, nome, idade as 'tempo de vida' from tbanimais;

-- Vizualiza os campos e registros, e cria os campos virtuais "valor original" e "valor de venda" que aumenta em 10% o valor original dos registros do campo valor 
select tipo, nome, idade, valor as 'valor original', valor * 1.10 as 'valor de venda' from tbanimais;

-- Vizualiza a tabela e seus registros apenas com o "tipo", "valor original" e "valor de venda"
select tipo, valor as 'valor original', valor * 1.10 as 'valor de venda' from tbanimais;