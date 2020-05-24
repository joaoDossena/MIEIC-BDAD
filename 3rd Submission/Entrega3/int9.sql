--Lista as Estudantes que se inscreveram na FEUP em 2018 e que podem participar da Tuna Feminina da FEUP (Todas as mulheres)
.mode columns
.headers on
.nullvalue NULL

SELECT id, nome
FROM PessoaFEUP NATURAL JOIN Estudante
WHERE PessoaFEUP.sexo = 'F' AND Estudante.anoInscricao = 2018

;