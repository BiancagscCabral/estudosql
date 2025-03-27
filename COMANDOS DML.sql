#COMANDOS DML

-- SQL: DML - INSERT	
 alter table cliente 
 drop idade;

use farmarciatads039m;

#serve para inserir na tabela
insert into cliente(cpf, nome, sexo, email, telefone, dataNasc)
value("715,571,511-77", "Josué Heitor Oliveira", 'M' , "jho@gmail.com" , "(81)99508-0895" , '2005-10-31');

desc cliente;
select  * FROM CLIENTE