SHOW DATABASES;
USE oficina;
SHOW TABLES;

-- Inserindo Clientes
DESC cliente;

INSERT INTO cliente (nome, telefone, endereco) VALUES 
	('Carlos Alberto Silva Júnior', '35999823344', 'Rua A, 53, Bairro B, Andradas-MG'),
    ('Isaac', '35999823346', 'Rua C, 53, Bairro D, Andradas-MG'),
    ('Rosilene', '35999826744', 'Rua E, 53, Bairro F, Andradas-MG');
    
-- Inserindo Veiculos
DESC veiculo;

INSERT INTO veiculo (placa, cor, idCliente, modelo, montadora) VALUES 
	('FFF4567', 'Preto', 1, 'Classic', 'Chevrolet'),
    ('DDD3456', 'Branco', 2, 'Gol', 'Volkswagen'),
    ('JJJ6789', 'Vermelho', 3, 'Ecosport', 'Ford');
    
-- Inserindo Serviços
DESC servico;

INSERT INTO servico (nome, valor, descricao) VALUES 
	('Troca de óleo', '30.00', ''),
    ('Alinhamento', '20', 'Por pneu'),
    ('Balanceamento', '20', 'Por pneu');
    
-- Inserindo Peças
DESC peca;

INSERT INTO peca (nome, valor, descricao) VALUES 
	('Filtro de óleo', '30.00', ''),
    ('Pneu', '320.00', ''),
    ('Bico de pneu', '5.00', ''),
    ('Óleo de motor', '35.00', '');
    
-- Inserindo Mecânico
DESC mecanico;

INSERT INTO mecanico (nome, codigo, endereco, especialidade) VALUES 
	('João', '001', 'Rua H, 32, Bairro J, Andradas-MG', 'Troca de óleo'),
    ('Pedro', '002', 'Rua L, 56, Bairro V, Andradas-MG', 'Alinhamento e balanceamento de pneus');
    
-- Inserindo Serviço por Mecânico
DESC servico_por_mecanico;

INSERT INTO servico_por_mecanico (idServicos, idMecanico) VALUES 
	(1, 1),
    (2, 2),
    (3, 2);
    
-- Inserindo Ordem
DESC ordem;

INSERT INTO ordem (idCliente, status, data_emissao, valor, numero, data_conclusao) VALUES 
	(1, 'Em andamento', '2022-10-28', '80.00', '001', NULL),
    (2, 'Finalizado', '2022-10-29', '65.00', '003', '2022-10-30'),
    (3, 'Finalizado', '2022-10-28', '65.00', 004, '2022-10-30');
    
-- Inserindo Ordem por mecanico
DESC ordem_por_mecanico;

INSERT INTO ordem_por_mecanico (idOrdem, idMecanico) VALUES 
	(1, 2),
    (2, 1),
    (3, 1);
    
-- Inserindo Peça por Ordem
DESC peca_por_ordem;

INSERT INTO peca_por_ordem (idPeca, idOrdem) VALUES 
	(3, 1),
    (4, 2),
    (4, 3);
    
-- Inserindo Serviço por Ordem
DESC servico_por_ordem;

INSERT INTO servico_por_ordem (idServicos, idOrdem) VALUES 
	(2, 1),
    (3, 1),
    (1, 2),
    (1, 3);
    
-- Inserindo Veiculo por Ordem
DESC veiculo_por_ordem;

INSERT INTO veiculo_por_ordem (idVeiculo, idOrdem) VALUES 
	(1, 1),
    (2, 2),
    (3, 3);
    
