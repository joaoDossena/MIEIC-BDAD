--Conta quantos Docentes têm um id de antes do ano 2000
.mode columns
.headers on
.nullvalue NULL

SELECT COUNT(*)
FROM Docente
WHERE id < 'UP20000000'
ORDER BY id
DESC
;