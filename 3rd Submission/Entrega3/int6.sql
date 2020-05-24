--Mostra a média de número de estudantes nas Turmas Práticas com aula na Terça-Feira
.mode columns
.headers on
.nullvalue NULL

SELECT AVG(numEstudantes)
FROM TurmaPratica
WHERE diaSemana = 'Terça-Feira'
;