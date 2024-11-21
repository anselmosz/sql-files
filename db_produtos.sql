drop database dbprodutos;
create database dbprodutos;

use dbprodutos;

create table tbproduto(
  codigo int,
  nome varchar(50),
  tipo varchar(25),
  quantidade int,
  preco decimal(10,2)
);

insert into tbproduto(codigo, nome, tipo, quantidade, preco)values(1,'IMPRESSORA','INFORMATICA',200,600.00);
insert into tbproduto(codigo, nome, tipo, quantidade, preco)values(2,'CAMERA DIGITAL','DIGITAIS',300,400.00);
insert into tbproduto(codigo, nome, tipo, quantidade, preco)values(3, 'DVD-PLAYER','ELETRONICOS',250, 500.00);
insert into tbproduto(codigo, nome, tipo, quantidade, preco)values(4,'MONITOR','INFORMATICA',400,900.00);
insert into tbproduto(codigo, nome, tipo, quantidade, preco)values(5,'TELEVISOR','ELETRONICOS', 350, 650.00);
insert into tbproduto(codigo, nome, tipo, quantidade, preco)values(6,'FILMADORA DIGITAL','DIGITAIS',500,700.00);
insert into tbproduto(codigo, nome, tipo, quantidade, preco)values(7,'CELULAR','TELEFONE',450,850.00);
insert into tbproduto(codigo, nome, tipo, quantidade, preco)values(8,'TECLADO','INFORMATICA',300,450.00);
insert into tbproduto(codigo, nome, tipo, quantidade, preco)values(9,'VIDEOCASSETE','ELETRONICOS',200,300.00);
insert into tbproduto(codigo, nome, tipo, quantidade, preco)values(10,'MOUSE','INFORMATICA',400,60.00);

desc tbproduto;
select * from tbproduto;

-- 1. Aumente em 12% o valor dos produtos cujos nomes iniciem com a letra 'F'
update tbproduto set preco = preco *1.12 where nome like'f%';
select nome, preco from tbproduto where nome like'f%';

-- 2. Aumentar em 50 unidades todos os produtos cujo valor seja maior que 400 e inferior a 600
update tbproduto set quantidade = quantidade +50 where preco between 400 and 600;
select nome, quantidade from tbproduto where preco between 400 and 600;

-- 3. Aplicar um desconto de 50% para todos os produtos em que as unidades de estoque sejam maiores que 300
update tbproduto set preco = preco *0.5 where quantidade > 300;
select nome, preco from tbproduto where quantidade > 300;

-- 4. Exiba o produto de CODIGO = 4 
select * from tbproduto where codigo = 4;

-- 5. Exibir todos os produtos que não tenham a letra 'Y' 
select * from tbproduto where nome not like'%y%';

-- 6. Exibir todos os produtos que se iniciem com nome 'MO' e tenham como tipo as letras 'MA'
select * from tbproduto where nome like'mo%' and tipo like'%ma%';