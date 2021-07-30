--numero de registros
SELECT count(1) FROM banco; --151
SELECT count(1) FROM agencia; --296

--lista todos os bancos e agências
SELECT banco.numero, banco.nome, agencia.numero, agencia.nome
FROM banco
JOIN agencia ON agencia.banco_numero = banco.numero;

--retorna a quantidade de agencias
SELECT count (banco.numero)
FROM banco
JOIN agencia ON agencia.banco_numero = banco.numero;

--lista bancos que possuem agencias e quantidade em cada um
SELECT banco.numero
FROM banco
JOIN agencia ON agencia.banco_numero = banco.numero
GROUP BY banco.numero;

--retorna a quantidade de bancos com agencias
SELECT count(distinct banco.numero)
FROM banco
JOIN agencia ON agencia.banco_numero = banco.numero;

--retorna todos os bancos com relação com a agencia e os que não tem. Alguns bancos não tem agência.
SELECT banco.numero, banco.nome, agencia.numero, agencia.nome
FROM banco
LEFT JOIN agencia ON agencia.banco_numero = banco.numero;

--Usando o right porem com os dados invertidos gera o mesmo resultado:
SELECT agencia.numero, agencia.nome, banco.numero,banco.nome
FROM agencia
RIGHT JOIN banco ON banco.numero = agencia.banco_numero;

--Usando o LEFT na mesma ordem que a anterior, prioriza os dados da agência, e não lista os bancos sem relacionamento:
SELECT agencia.numero, agencia.nome, banco.numero,banco.nome
FROM agencia
LEFT JOIN banco ON banco.numero = agencia.banco_numero;

--forçamentos os relacionamentos e recupera tudo.
SELECT banco.numero, banco.nome, agencia.numero, agencia.nome
FROM banco
FULL JOIN agencia ON agencia.banco_numero = banco.numero;

CREATE TABLE IF NOT EXISTS teste_a (
	id serial primary key, 
	valor VARCHAR(10)
);

CREATE TABLE IF NOT EXISTS teste_b (
	id serial primary key, 
	valor VARCHAR(10)
);

INSERT INTO teste_a (valor) VALUES ('teste1');
INSERT INTO teste_a (valor) VALUES ('teste2');
INSERT INTO teste_a (valor) VALUES ('teste3');
INSERT INTO teste_a (valor) VALUES ('teste4');

INSERT INTO teste_b (valor) VALUES ('teste_a');
INSERT INTO teste_b (valor) VALUES ('teste_b');
INSERT INTO teste_b (valor) VALUES ('teste_c');
INSERT INTO teste_b (valor) VALUES ('teste_d');

--criando um alias para nomes muito grandes, porem dificulta a leitura
SELECT tbla.valor, tblb.valor
FROM teste_a tbla
CROSS JOIN teste_b tblb;

DROP TABLE IF EXISTS teste_a;
DROP TABLE IF EXISTS teste_b;

--faz um join de 4 tabelas: banco, agencia, contacorrente, cliente:
SELECT banco.nome,
	   agencia.nome,
	   conta_corrente.numero,
	   conta_corrente.digito,
	   cliente.nome
	   FROM banco
	   JOIN agencia ON agencia.banco_numero = banco.numero
	   JOIN conta_corrente 
	   --ON conta_corrente.banco_numero = agencia.banco_numero #é igual a:
	   ON conta_corrente.banco_numero = banco.numero
	   AND conta_corrente.agencia_numero = agencia.numero --POSSO TER COTA DE NUMERO IGUAIS E DIGITOS DIFERENTES
	   JOIN cliente
	   ON cliente.numero = conta_corrente.cliente_numero;
	
	
