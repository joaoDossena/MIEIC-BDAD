--Lista id, nome e número de cadeiras em que os Docentes lecionam
.mode columns
.headers on
.nullvalue NULL

SELECT PessoaFEUP.id, PessoaFEUP.nome, COUNT(idCadeira)
FROM CadeiraDocente NATURAL JOIN Docente NATURAL JOIN PessoaFEUP
WHERE CadeiraDocente.id = Docente.id AND Docente.id = PessoaFEUP.id
GROUP BY PessoaFEUP.id
;