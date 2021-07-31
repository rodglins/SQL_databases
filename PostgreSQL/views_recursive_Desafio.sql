--view recursiva
--desafio, obter a lista relacionando o nome do gerente com o subordinado:

CREATE TABLE IF NOT EXISTS funcionarios (
	id SERIAL,
	nome VARCHAR(50),
	gerente INTEGER,
	PRIMARY KEY (id),
	FOREIGN KEY (gerente) REFERENCES funcionarios (id)
);

INSERT INTO funcionarios (nome, gerente) VALUES('Acelmo',null);
INSERT INTO funcionarios (nome, gerente) VALUES('Beatriz',1);
INSERT INTO funcionarios (nome, gerente) VALUES('Magno',1);
INSERT INTO funcionarios (nome, gerente) VALUES('Cremilda',2);
INSERT INTO funcionarios (nome, gerente) VALUES('Wagner',4);

CREATE OR REPLACE RECURSIVE VIEW vw_funcionarios2(id, gerente, funcionario) AS (
	SELECT id, CAST('' AS VARCHAR) AS gerente, nome
	FROM funcionarios
	WHERE gerente IS NULL
	
	UNION ALL
	
	SELECT funcionarios.id, gerentes.nome, funcionarios.nome
	FROM funcionarios
	JOIN vw_funcionarios2 ON vw_funcionarios2.id = funcionarios.gerente
	JOIN funcionarios gerentes ON gerentes.id = vw_funcionarios2.id
);

SELECT id,gerente, funcionario
FROM vw_funcionarios2