--Mostra os Estudantes e a soma do número de créditos das Cadeiras em que estão inscritos
.mode columns
.headers on
.nullvalue NULL

SELECT PessoaFEUP.nome, SUM(Cadeira.creditos)
FROM (PessoaFEUP JOIN Estudante JOIN EstudanteOcorrenciaCadeira
	JOIN OcorrenciaCadeira JOIN Cadeira)
WHERE PessoaFEUP.id = Estudante.id AND Estudante.id = EstudanteOcorrenciaCadeira.id
	AND EstudanteOcorrenciaCadeira.idOcorrenciaCadeira = OcorrenciaCadeira.idOcorrenciaCadeira
	AND OcorrenciaCadeira.idCadeira = Cadeira.idCadeira
GROUP BY PessoaFEUP.nome
;