--view recursiva

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

--O resultado é o Ancelmo
SELECT id, nome, gerente FROM funcionarios;
SELECT id, nome, gerente FROM funcionarios WHERE gerente IS NULL;
--não retorna nada:
SELECT id,nome,gerente FROM funcionarios WHERE id = 999;
--retorna o gerente (APENAS EXEMPLO):
SELECT id, nome, gerente FROM funcionarios WHERE gerente IS NULL
UNION ALL
SELECT id,nome,gerente FROM funcionarios WHERE id = 999;

--retorna a hierarquia correta:
CREATE OR REPLACE RECURSIVE VIEW vw_funcionarios(id, gerente, funcionario) AS (
	SELECT id, gerente, nome
	FROM funcionarios
	WHERE gerente IS NULL -- retorna o id 1
	
	UNION ALL
	
	SELECT funcionarios.id, funcionarios.gerente, funcionarios.nome
	FROM funcionarios
	JOIN vw_funcionarios ON vw_funcionarios.id = funcionarios.gerente
);

SELECT id, gerente, funcionario
FROM vw_funcionarios;




