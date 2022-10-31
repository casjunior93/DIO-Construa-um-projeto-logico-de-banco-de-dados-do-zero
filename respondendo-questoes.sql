-- Recuperações simples com SELECT Statement

SELECT * FROM cliente;

-- Filtros com WHERE Statement

SELECT * FROM ordem WHERE idCliente = 3;

-- Crie expressões para gerar atributos derivados - desconto de 10% no valor da ordem

SELECT valor as valor_normal, round(valor*0.9, 2) as com_desconto, round(valor*0.1, 2) as desconto FROM ordem;

-- Defina ordenações dos dados com ORDER BY

SELECT * FROM ordem ORDER BY valor DESC;

-- Condições de filtros aos grupos – HAVING Statement

SELECT count(idOrdem) as qtde_compras, idCliente as cliente, SUM(valor) as valor
FROM ordem
GROUP BY cliente
HAVING valor >= 70;

-- Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados

SELECT count(o.idOrdem) AS qtde_compras, SUM(o.valor) AS valor_total,  c.nome AS nome_cliente, 
	c.endereco AS endereco
FROM ordem o
INNER JOIN cliente c ON c.idCliente = o.idCliente
GROUP BY o.idCliente
HAVING valor_total >= 70;

-- Quantos ordens foram feitos por cada cliente?

SELECT count(o.idOrdem) AS qtde_pedidos, c.nome  AS nome_cliente
FROM ordem o
INNER JOIN cliente c ON c.idCliente = o.idCliente
GROUP BY o.idCliente;
