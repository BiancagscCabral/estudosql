-- SQL: DDL - CREATE

use farmarciatads039m;

#EXEMPLO de criação de tabelas
create table cliente (
CPF varchar(14) primary key not null,
nome varchar(45) not null,
genero char(1) not null,
email varchar(45) unique null,
telefone varchar(15) unique not null,
dataNasc date null,
`status` boolean null
);


#EXEMPLO de criação de tabelas
create table plano_saude (
cliente_cpf varchar(14) primary key not null,
numero varchar(20) unique not null,
nome varchar(25) not null,
foreign key(Cliente_cpf) references
	cliente(cpf)
    on update cascade
    on delete cascade
);

#comandos DDL 
-- SQL: DDL - ALTER
#alterar tabela
alter table departamento 
add column descricao varchar(150) null;

#descrever alguma tabela
desc departamento;

#alterar tabela
alter table departamento
	change column descricao sobre varchar(155) not null;
    
#dropar a coluna da tabela
alter table departamento
	drop column sobre;
 
 #para adicionar uma pontuacao na tabela do cliente
alter table cliente 
	add column potuacao int null default 0;

#criar coluna selecionando a ordem onde eu quero coloca-lá
alter table cliente
	add column idade int not null after dataNasc,
    change column potuacao pontuacao int not null default 0;

