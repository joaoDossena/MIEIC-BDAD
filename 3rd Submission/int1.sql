--Lista os nomes dos Estudantes da FEUP por ordem alfabética, como numa lista de chamada
.mode columns
.headers on
.nullvalue NULL

SELECT nome 
FROM (PessoaFEUP INNER JOIN Estudante) 
WHERE (PessoaFEUP.id = Estudante.id) 
ORDER BY nome;