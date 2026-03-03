CREATE TRIGGER trigger_calcular_valor
BEFORE INSERT ON apolices
FOR EACH ROW
EXECUTE FUNCTION calcular_valor_final();
