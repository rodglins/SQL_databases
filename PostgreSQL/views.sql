SELECT numero,nome,ativo
FROM banco;

CREATE OR REPLACE VIEW vw_bancos AS (
	SELECT numero, nome, ativo
	FROM banco
);

SELECT numero, nome, ativo
FROM vw_bancos;

CREATE OR REPLACE VIEW vw_bancos_2 (banco_numero, banco_nome, banco_ativo) AS (
	SELECT numero, nome, ativo
	FROM banco
);

SELECT banco_numero, banco_nome, banco_ativo
FROM vw_bancos_2;

INSERT INTO vw_bancos_2 (banco_numero, banco_nome, banco_ativo)
VALUES (51, 'Banco Boa Ideia', TRUE);

SELECT banco_numero, banco_nome, banco_ativo FROM vw_bancos_2 WHERE banco_numero = 51;
SELECT numero, nome, ativo FROM banco WHERE numero = 51;

UPDATE vw_bancos_2 SET banco_ativo = FALSE WHERE banco_numero = 51;

DELETE FROM vw_bancos_2 WHERE banco_numero = 51;


--view temporária
CREATE OR REPLACE TEMPORARY VIEW vw_agencia AS (
	SELECT nome FROM agencia
);
SELECT nome FROM vw_agencia;

---


CREATE OR REPLACE VIEW vw_bancos_ativos AS (
	SELECT numero, nome, ativo
	FROM banco
	WHERE ativo IS TRUE	
) WITH LOCAL CHECK OPTION;
--Insert gera erro devido (LOCAL CHECK OPTION):
INSERT INTO vw_bancos_ativos (numero, nome, ativo) VALUES (51, 'Banco Boa Ideia', FALSE);

--cria view
CREATE OR REPLACE VIEW vw_bancos_com_a AS (
	SELECT numero, nome, ativo
	FROM vw_bancos_ativos
	WHERE nome ILIKE 'a%'	
) WITH LOCAL CHECK OPTION;

--recupera os dados da view:
SELECT numero, nome, ativo FROM vw_bancos_com_a;

--com erro porque o nome começa com B
INSERT INTO vw_bancos_com_a (numero, nome, ativo) VALUES (333, 'Beta Omega', TRUE);
--OK
INSERT INTO vw_bancos_com_a (numero, nome, ativo) VALUES (333, 'Alfa Omega', TRUE);
--com erro devido a (WITH LOCAL CHECK OPTION) na view. se remover , funcionará:
INSERT INTO vw_bancos_com_a (numero, nome, ativo) VALUES (331, 'Alfa Gama', FALSE);



------------
--sem o primeiro (LOCAL CHECK OPTION) o insert funciona mesmo sendo FALSE:
CREATE OR REPLACE VIEW vw_bancos_ativos AS (
	SELECT numero, nome, ativo
	FROM banco
	WHERE ativo IS TRUE	
);
--cria view
CREATE OR REPLACE VIEW vw_bancos_com_a AS (
	SELECT numero, nome, ativo
	FROM vw_bancos_ativos
	WHERE nome ILIKE 'a%'	
) WITH LOCAL CHECK OPTION;

--recupera os dados da view:
SELECT numero, nome, ativo FROM vw_bancos_com_a;

--OK, mesmo sendo FALSE o insert não gera ERRO:
INSERT INTO vw_bancos_com_a (numero, nome, ativo) VALUES (331, 'Alfa Gama', FALSE);


-----------


--sem o primeiro LOCAL CHECK OPTION, porém com CASCADE: 
CREATE OR REPLACE VIEW vw_bancos_ativos AS (
	SELECT numero, nome, ativo
	FROM banco
	WHERE ativo IS TRUE	
);
--cria view
CREATE OR REPLACE VIEW vw_bancos_com_a AS (
	SELECT numero, nome, ativo
	FROM vw_bancos_ativos
	WHERE nome ILIKE 'a%'	
) WITH CASCADED CHECK OPTION;

--recupera os dados da view:
SELECT numero, nome, ativo FROM vw_bancos_com_a;

--Gera erro , pois o CASCADE eleva a regra para todos os views:
INSERT INTO vw_bancos_com_a (numero, nome, ativo) VALUES (334, 'Alfa Gama Beta2', FALSE);


