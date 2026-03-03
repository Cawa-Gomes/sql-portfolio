INSERT INTO clientes (nome, cpf, data_nascimento)
VALUES 
('João Silva', '111.111.111-11', '1980-05-10'),
('Maria Souza', '222.222.222-22', '1955-03-22');

INSERT INTO apolices (cliente_id, tipo_seguro, valor_base, percentual_risco)
VALUES
(1, 'VIDA', 1000, 10),
(2, 'AUTO', 2000, 20);
