
use atividade2; 

CREATE TABLE vendas (
    id_vendas INT AUTO_INCREMENT PRIMARY KEY,
    produto VARCHAR(100) NOT NULL,
    categoria VARCHAR(100) NOT NULL,
    quantidade INT NOT NULL,
    preco_unidade DECIMAL(10, 2) NOT NULL,
    data_venda DATE
);

INSERT INTO vendas(produto, categoria, quantidade, preco_unidade, data_venda) VALUES
('Arroz', 'Alimentos', 5, 10.00, '2024-09-01'),
('Feijão', 'Alimentos', 3, 7.50, '2024-09-02'),
('Sabão', 'Limpeza', 2, 12.00, '2024-09-02'),
('Café', 'Alimentos', 6, 8.00, '2024-09-03'),
('Detergente', 'Limpeza', 4, 5.00, '2024-09-03'),
('Leite', 'Alimentos', 10, 4.50, '2024-09-04'),
('Sabonete', 'Higiene', 6, 3.00, '2024-09-04'),
('Pão', 'Alimentos', 15, 1.50, '2024-09-05'),
('Shampoo', 'Higiene', 1, 15.00, '2024-09-05'),
('Creme dental', 'Higiene', 3, 8.00, '2024-09-06');

SELECT COUNT(*) AS total_vendas_alimentos
FROM vendas
WHERE categoria = 'Alimentos';

SELECT COUNT(*) AS total_vendas
FROM vendas;

SELECT AVG(preco_unidade) AS preco_medio
FROM vendas; 

SELECT AVG(quantidade) AS quantidade_media
FROM vendas;

SELECT MIN(preco_unidade) FROM vendas;

SELECT MAX(quantidade) AS maior_quantidade
FROM vendas;
SELECT MIN(quantidade) AS menor_quantidade
FROM vendas;

SELECT MAX(quantidade * preco_unidade) AS maior_valor_venda
FROM vendas;

SELECT AVG(quantidade * preco_unidade) AS media_valor_vendas_higiene
FROM vendas
WHERE categoria = 'Higiene';

ALTER TABLE vendas MODIFY COLUMN preco_unidade DECIMAL(10, 2);
