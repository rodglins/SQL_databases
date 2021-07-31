
--Common Table Expressions - CTE
--podem ser utilizadas várias tabelas, no exemplo são 2:

SELECT numero, nome FROM banco;
SELECT banco_numero, numero, nome FROM agencia;

WITH tbl_tmp_banco AS (
	SELECT numero, nome
	FROM banco
)
SELECT numero, nome --vem no statment WITH SELECT
FROM tbl_tmp_banco;

--retorna apenas um registro:
WITH params AS (
	SELECT 213 AS banco_numero
), tbl_tmp_banco AS (
	SELECT numero, nome
	FROM banco
	JOIN params ON params.banco_numero = banco.numero
)
SELECT numero, nome
FROM tbl_tmp_banco;

--utilizando sub-select:
SELECT banco.numero, banco.nome
FROM banco
JOIN (
	SELECT 213 AS banco_numero
) params ON params.banco_numero = banco.numero;

--tabela com todos os clientes, todas as transações e seus valores:
WITH clientes_e_transacoes AS (
	SELECT cliente.nome AS cliente_nome,
	tipo_transacao.nome AS tipo_transacao_nome,
	cliente_transacoes.valor AS tipo_transacao_valor
	FROM cliente_transacoes
	JOIN cliente ON cliente.numero = cliente_transacoes.cliente_numero
	JOIN tipo_transacao ON tipo_transacao.id = cliente_transacoes.tipo_transacao_id
)
SELECT cliente_nome, tipo_transacao_nome, tipo_transacao_valor
FROM clientes_e_transacoes;

--tabela com as transações e seus valores do banco ITAÚ:
WITH clientes_e_transacoes AS (
	SELECT cliente.nome AS cliente_nome,
	tipo_transacao.nome AS tipo_transacao_nome,
	cliente_transacoes.valor AS tipo_transacao_valor
	FROM cliente_transacoes
	JOIN cliente ON cliente.numero = cliente_transacoes.cliente_numero
	JOIN tipo_transacao ON tipo_transacao.id = cliente_transacoes.tipo_transacao_id
	JOIN banco ON banco.numero = cliente_transacoes.banco_numero AND banco.nome ILIKE '%Itaú%'
	
)
SELECT cliente_nome, tipo_transacao_nome, tipo_transacao_valor
FROM clientes_e_transacoes;