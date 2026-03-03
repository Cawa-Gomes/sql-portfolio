CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    data_nascimento DATE NOT NULL
);

CREATE TABLE apolices (
    id SERIAL PRIMARY KEY,
    cliente_id INT NOT NULL,
    tipo_seguro VARCHAR(20) NOT NULL,
    valor_base DECIMAL(10,2) NOT NULL,
    percentual_risco DECIMAL(5,2) NOT NULL CHECK (percentual_risco <= 50),
    valor_final DECIMAL(10,2),
    status VARCHAR(20) DEFAULT 'ATIVA',

    CONSTRAINT fk_cliente
        FOREIGN KEY (cliente_id)
        REFERENCES clientes(id),

    CONSTRAINT chk_tipo
        CHECK (tipo_seguro IN ('VIDA', 'AUTO', 'RESIDENCIAL'))
);
