CREATE OR REPLACE FUNCTION calcular_valor_final()
RETURNS TRIGGER AS $$
DECLARE
    idade INT;
BEGIN
    SELECT EXTRACT(YEAR FROM AGE(c.data_nascimento))
    INTO idade
    FROM clientes c
    WHERE c.id = NEW.cliente_id;

    NEW.valor_final := NEW.valor_base +
                       (NEW.valor_base * NEW.percentual_risco / 100);

    IF idade > 60 THEN
        NEW.valor_final := NEW.valor_final * 1.05;
    END IF;

    IF NEW.tipo_seguro = 'AUTO' THEN
        NEW.valor_final := NEW.valor_final + 200;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
