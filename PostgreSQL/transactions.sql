SELECT numero, nome, ativo FROM banco ORDER BY numero;
UPDATE banco SET ativo = FALSE WHERE numero = 0;

BEGIN;
UPDATE banco SET ativo = TRUE WHERE numero = 0;
SELECT numero, nome, ativo FROM banco WHERE numero = 0
ROLLBACK;

BEGIN ;
UPDATE banco SET ativo = TRUE WHERE numero = 0
COMMIT;

--Magno passa a ser subordinado a Beatriz
BEGIN;
UPDATE funcionarios SET gerente = 2 WHERE id = 3;
SAVEPOINT sf_func;
UPDATE funcionarios SET gerente = null; --erro
ROLLBACK TO sf_func; --desfazendo erro
UPDATE funcionarios SET gerente = 3 WHERE id = 5;
COMMIT;

--conferindo resultado:
SELECT id, nome, gerente
FROM funcionarios;


