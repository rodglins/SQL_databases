--Funções:

--AVG
--COUNT
--MAX
--MIN
--SUM

--transações:
SELECT valor FROM cliente_transacoes;
--média transações:
SELECT AVG(valor) FROM cliente_transacoes;

--total clientes:
SELECT COUNT(numero)
FROM cliente;

--relaciona o numero de pessoas que usam o gmail:
SELECT COUNT(numero), email
FROM cliente
WHERE email ILIKE '%gmail.com'
GROUP BY email;

--Maior valor de transação:
SELECT MAX(valor)
FROM cliente_transacoes;

--Menor valor de transação;
SELECT MIN(valor)
FROM cliente_transacoes;

--Maior valor por tipo de transacao:
SELECT MAX(valor), tipo_transacao_id
FROM cliente_transacoes
GROUP BY tipo_transacao_id;

--Menor valor por tipo de transacao:
SELECT MIN(valor), tipo_transacao_id
FROM cliente_transacoes
GROUP BY tipo_transacao_id;

SELECT column_name, data_type FROM information_schema.columns WHERE table_name = 'banco';
--faz a contagem, so traz as contagens maior que 150 e ignora o ultimo registro, uil para identificar registros duplicados numa tabela
SELECT COUNT (id), tipo_transacao_id
FROM cliente_transacoes
GROUP BY tipo_transacao_id
HAVING COUNT(id) > 150; 

--soma todos os valores:
SELECT SUM(valor)
FROM cliente_transacoes;

--Soma os registos por tipo de transacao em ordem Ascendente por id:
SELECT SUM(valor), tipo_transacao_id
FROM cliente_transacoes
GROUP BY tipo_transacao_id
ORDER BY tipo_transacao_id ASC;

--Soma os registos por tipo de transacao em ordem Descendente pelo maior valor:
SELECT SUM(valor), tipo_transacao_id
FROM cliente_transacoes
GROUP BY tipo_transacao_id
ORDER BY sum DESC;






