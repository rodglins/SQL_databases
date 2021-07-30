SELECT numero,nome,ativo FROM banco;
SELECT banco_numero,numero,nome FROM agencia;
SELECT numero,nome,email FROM cliente;
SELECT id, nome FROM tipo_transacao;
SELECT banco_numero,agencia_numero,numero,cliente_numero FROM conta_corrente;
SELECT banco_numero,agencia_numero,cliente_numero FROM cliente_transacoes;
SELECT * FROM cliente_transacoes --CUIDADO:Não usar em produção. Não é uma boa pratica.

--gera um relatório de todos os campos da tabela, estrutura da tabela:
SELECT * FROM information_schema.columns WHERE table_name = 'banco'; 

--gera um relatório dos nomes das colunas da tabela com tipos de dados:
SELECT column_name, data_type FROM information_schema.columns WHERE table_name = 'banco';

