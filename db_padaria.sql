drop database dbpadaria;
create database dbpadaria;
show databases;

use dbpadaria;

create table tbfuncionarios(
  codFunc int not null auto_increment,
  nome varchar(100),
  rg char(12) unique,
  cpf char(14) unique not null,
  carteira char(11)not null,
  email varchar(50),
  telefone char(14),
  endereco varchar(100),
  numero char(5),
  bairro varchar(100),
  cep char(9) not null,
  cidade varchar(50),
  estado char(2),
  cargo varchar(50),
  salario decimal(9,2) default 0 check(salario >= 0),
  primary key(codFunc)
);
desc tbfuncionarios;

create table tbfornecedores(
  codForn int not null auto_increment,
  empresa varchar(100),
  nomeContato varchar(100),
  email varchar(100),
  telefone char(14),
  cnpj char(14) not null,
  endereco varchar(100),
  numero char(5),
  bairro varchar(100),
  cep char(9) not null,
  cidade varchar(50),
  estado char(2),
  primary key(codForn)
);
desc tbfornecedores;

create table tbprodutos(
  codProdt int not null auto_increment,
  descricao varchar(100),
  quantidade int default 0 check(quantidade >= 0),
  categoria varchar(100),
  lote char(4) not null,
  validade date not null,
  preco decimal(9,2) default 0 check(preco >= 0),
  codForn int not null,
  primary key(codProdt),
  foreign key(codForn)references tbfornecedores(codForn)
);
desc tbprodutos;

create table tbcompras(
  codCompra int not null auto_increment,
  valor decimal(9,2) default 0 check(valor >= 0),
  codProdt int not null,
  primary key(codCompra),
  foreign key(codProdt)references tbprodutos(codProdt)
);
desc tbcompras;

create table tbCartaoCompra(
  codCartao int not null auto_increment,
  cliente varchar(100),
  dataCompra date,
  horaCompra time,
  payType varchar(50),
  codFunc int not null,
  codCompra int not null,
  primary key(codCartao),
  foreign key(codFunc)references tbfuncionarios(codFunc),
  foreign key(codCompra)references tbcompras(codCompra)
);
desc tbCartaoCompra;

-- Insert na tabela de funcionários
insert into tbfuncionarios(
  nome,
  rg,
  cpf,
  carteira,
  email,
  telefone,
  endereco,
  numero,
  bairro,
  cep,
  cidade,
  estado,
  cargo,
  salario
) values
('Ana Silva', '123456789', '123.456.789-00', '123456', 'ana.silva@email.com', '(11)98765-4321', 'Rua A, 123', '10', 'Centro', '01010-010', 'Sao Paulo', 'SP', 'Caixa', 1500.00),
('Joao Santos', '987654321', '987.654.321-00', '654321', 'joao.santos@email.com', '(11)91234-5678', 'Rua B, 456', '15', 'Jardim Paulista', '02020-020', 'Sao Paulo', 'SP', 'Caixa', 1600.00),
('Maria Oliveira', '456789123', '456.789.123-00', '789123', 'maria.oliveira@email.com', '(11)93456-7890', 'Rua C, 789', '20', 'Vila Mariana', '03030-030', 'Sao Paulo', 'SP', 'Atendente', 1400.00),
('Carlos Souza', '123987456', '123.987.456-00', '987456', 'carlos.souza@email.com', '(11)95678-1234', 'Rua D, 101', '25', 'Vila Progredior', '04040-040', 'Sao Paulo', 'SP', 'Padeiro', 1800.00),
('Fernanda Costa', '321654987', '321.654.987-00', '654987', 'fernanda.costa@email.com', '(11)96543-2109', 'Rua E, 202', '30', 'Bairro Alto', '05050-050', 'Sao Paulo', 'SP', 'Auxiliar de Limpeza', 1200.00);
select * from tbfuncionarios;

-- Insert na tabela de fornecedores
insert into tbfornecedores(
  empresa,
  nomeContato,
  email,
  telefone,
  cnpj,
  endereco,
  numero,
  bairro,
  cep,
  cidade,
  estado
) values
('Distribuidora SP', 'Roberto Silva', 'roberto.silva@distsp.com', '(11)99876-5432', '12.345.678/0001-90', 'Rua Alvarenga, 100', '10', 'Vila Industrial', '01010-100', 'Sao Paulo', 'SP'),
('Atacadao', 'Juliana Pereira', 'juliana.pereira@atacadao.com.br', '(11)98765-4321', '23.456.789/0001-01', 'Est. de Itapecerica, 2000', '20', 'Bela Vista', '01310-200', 'Sao Paulo', 'SP'),
('Sonda Supermercados', 'Carlos Souza', 'carlos.souza@sonda.com.br', '(11)93654-7890', '34.567.890/0001-12', 'Rua dos Jabutis, 150', '30', 'Alto da Lapa', '01440-300', 'Sao Paulo', 'SP'),
('Vencedor Atacadista', 'Fernanda Costa', 'fernanda.costa@vencedoratc.com', '(11)96543-2109', '45.678.901/0001-23', 'Rua das Flores, 250', '40', 'Jardim das Pedras', '02230-400', 'Sao Paulo', 'SP'),
('Varejo Now', 'Paulo Alves', 'paulo.alves@varejonow.com', '(11)98765-4321', '56.789.012/0001-34', 'Avenida Rio, 500', '50', 'Centro', '23010-500', 'Sao Paulo', 'SP');
select * from tbfornecedores;

-- Insert na tabela de produtos
insert into tbprodutos(
  descricao,
  quantidade,
  categoria,
  lote,
  validade,
  preco,
  codForn
) values 
('Presunto', 100, 'Frios', 'L001', '2025-12-31', 15.50, 1),
  
('Queijo Mussarela', 150, 'Laticinios', 'L002', '2024-06-30', 18.00, 1),
  
('Refrigerante de Laranja', 200, 'Refrigerantes', 'L003', '2024-07-25', 4.50, 1),
  
('Sanduiche Natural', 80, 'Lanches', 'L004', '2025-11-20', 12.00, 1),
  
('Sorvete de Morango', 120, 'Sorvetes', 'L005', '2025-05-30', 8.00, 1),
  
('Chester Defumado', 80, 'Frios', 'L006', '2025-01-15', 22.00, 2),
  
('Leite Integral', 300, 'Laticinios', 'L007', '2024-12-31', 3.00, 2),
  
('Chicletes de Tutti Frutti', 500, 'Chicletes', 'L008', '2025-06-10', 1.50, 2),
  
('Chocolate ao Leite', 150, 'Chocolates', 'L009', '2025-03-20', 5.00, 2),
  
('Refrigerante de Cola', 200, 'Refrigerantes', 'L010', '2024-10-10', 5.00, 2),
  
('Cigarros', 50, 'Diversos', 'L011', '2024-12-20', 15.00, 3),
  
('Leite Condensado', 100, 'Laticinios', 'L012', '2025-03-15', 6.00, 3),
  
('Chocolates Amargo', 200, 'Chocolates', 'L013', '2025-06-05', 7.00, 3),
  
('Balas de Caramelo', 350, 'Balas', 'L014', '2025-08-10', 2.50, 3),
  
('Sorvete de Chocolate', 80, 'Sorvetes', 'L015', '2024-11-30', 8.50, 3),
  
('Presunto de Pernil', 120, 'Frios', 'L016', '2025-04-30', 18.00, 4),
  
('Iogurte Grego', 200, 'Laticinios', 'L017', '2024-09-15', 6.50, 4),
  
('Lanche de Carne', 60, 'Lanches', 'L018', '2024-12-01', 10.00, 4),
  
('Chicletes de Menta', 150, 'Chicletes', 'L019', '2025-02-20', 1.75, 4),
  
('Refrigerante de Guarana', 100, 'Refrigerantes', 'L020', '2025-07-10', 4.00, 4),
  
('Cigarros', 200, 'Diversos', 'L021', '2025-01-10', 16.00, 5),
  
('Queijo Prato', 300, 'Laticinios', 'L022', '2025-05-05', 20.00, 5),
  
('Refrigerante de Limao', 150, 'Refrigerantes', 'L023', '2024-08-20', 4.20, 5),
  
('Balas de Goma', 400, 'Balas', 'L024', '2024-12-10', 3.00, 5),
  
('Sanduiche de Frango', 250, 'Lanches', 'L025', '2025-06-25', 14.00, 5);

select * from tbprodutos;

-- Insert na tabela de compraas
insert into tbcompras(
  valor,
  codProdt
) values 
(14.00, 25),
(9.00, 3),
(21.00, 13),
(30.00, 11),
(20.00, 18);
select * from tbcompras;

-- Insert na tabela de cartoes de compra
insert into tbCartaoCompra(
  cliente,
  dataCompra,
  horaCompra,
  payType,
  codFunc,
  codCompra
) values 
('Vincent', '2024-11-25', '10:07:00', 'Credito', 1, 4),
('Fernanda Montenegro', '2024-11-20', '11:21:00', 'Dinheiro', 2, 5),
('Marcelus Wallace', '2024-11-21', '11:24:00', 'Pix', 2, 3),
('Dorian Gray','2024-11-25', '10:37:00','Debito', 1, 2),
('Victor Frankenstein','2024-11-21', '09:00:00', 'Dinheiro', 2, 1);
select * from tbCartaoCompra;


--* Pesquisas avançadas nas tabelas / Updates

select compra.valor, cartao.dataCompra, cartao.payType, cartao.cliente from tbCartaoCompra as cartao
inner join tbcompras as compra
on cartao.codCompra = compra.codCompra;

select nome, cpf, cargo, codFunc from tbfuncionarios;

select forn.telefone, forn.cnpj, forn.endereco, prod.descricao, prod.lote, prod.preco from tbprodutos as prod
inner join tbfornecedores as forn
on prod.codforn = forn.codforn;

select func.nome, cartao.codCompra, func.codFunc from tbCartaoCompra as cartao
inner join tbfuncionarios as func
on cartao.codFunc = func.codFunc;

select func.nome, prod.codProdt, vend.payType, vend.dataCompra from tbCartaoCompra as vend
inner join tbfuncionarios as func
on vend.codFunc = func.codFunc
inner join tbcompras as prod
on vend.codCompra = prod.codCompra;

--* Update na tabela funcionários

update tbfuncionarios set salario = 1800.00 where cargo = 'Caixa'; -- atualiza o salario da linha que contém o campo "cargo" igual a 'Caixa'
select * from tbfuncionarios where cargo = 'Caixa';

update tbfuncionarios set endereco = 'Rua Z, 000', numero = '150', bairro = 'Capao Redondo' where nome like '%j%'; -- Atualiza os dados de endereço da linha que possui a letra 'J' no campo "nome"
select * from tbfuncionarios where nome like '%j%';

--* Update na tabela de produtos

update tbprodutos set quantidade+50 where categoria = 'Frios' and codForn in(1 or 2);
