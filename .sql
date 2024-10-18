CREATE DATABASE atividade;

use atividade; 


CREATE TABLE Produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL
);

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(100)
    );

CREATE TABLE IF NOT EXISTS vendas (
    id_venda INT AUTO_INCREMENT PRIMARY KEY ,
    id_cliente INT NOT NULL,
    id_produto INT NOT NULL, 
    quantidade INT NOT NULL,
    data_venda DATE,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto)
);

INSERT INTO Produtos (nome, preco) VALUES 
('lapis', 35.00),
('borracha', 40.00),
('caderno', 45.00),
('caneta', 20.00),
('livro', 10.00);

INSERT INTO clientes (Nome, email, telefone) VALUES 
('richelle', 'richelle@example.com', '81988987632'),
('bianca', 'bianca@example.com', '82376542687'),
('larissa', 'larissa@example.com', '98765343576'),
('luciene', 'luciene@example.com', '76398673576'),
('evandro', 'evandro@example.com', '24567869342');

INSERT INTO vendas (id_cliente, id_produto, quantidade, data_venda) VALUES 
(1,1,2, '15-09-24'),
(2,2,3, '22-07-24'),
(3,3,4, '08-06-24'),
(4,4,5, '27-05-24'),
(5,5,6, '10-09-24');

UPDATE Produtos
SET preco = 59
WHERE id_produto = 1;

UPDATE clientes
SET telefone = 88625920
WHERE id_cliente = 1;

DELETE FROM
vendas
WHERE id_venda = 5;

DELETE FROM
clientes
WHERE id_cliente = 5;

CREATE TABLE Categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

INSERT INTO Categorias (nome) VALUES ('smartphone');


CREATE TABLE Produto_Categoria (
    id_produto INT,
    id_categoria INT,
    PRIMARY KEY (id_produto, id_categoria),
    FOREIGN KEY (id_produto) REFERENCES Produtos(id_produto),
    FOREIGN KEY (id_categoria) REFERENCES Categorias(id_categoria)
);

INSERT INTO Produto_Categoria (id_produto, id_categoria) VALUES
(1,1),
(2,1);

SELECT p.id_produto, p.nome, p.preco
FROM Produtos p
JOIN Produto_Categoria pc ON p.id_produto = pc.id_produto
JOIN Categorias c ON pc.id_categoria = c.id_categoria
WHERE c.nome = 'smartphone';

SELECT v.id_venda, v.data_venda, c.Nome AS cliente, p.nome AS produto, v.quantidade
FROM vendas v
JOIN clientes c ON v.id_cliente = c.id_cliente
JOIN Produtos p ON v.id_produto = p.id_produto
WHERE v.data_venda = '2015-09-24';

SELECT p.nome AS produto, SUM(v.quantidade) AS total_vendas
FROM vendas v
JOIN Produtos p ON v.id_produto = p.id_produto
GROUP BY p.id_produto, p.nome;

SELECT SUM(preco) AS produtos_total
FROM produtos;

SELECT c.Nome AS cliente, SUM(v.quantidade * p.preco) AS receita_total
FROM vendas v
JOIN Produtos p ON v.id_produto = p.id_produto
JOIN clientes c ON v.id_cliente = c.id_cliente
GROUP BY c.id_cliente, c.Nome;

SELECT *
FROM produtos
ORDER BY nome ASC;

SELECT *
FROM produtos
ORDER BY nome DESC;

