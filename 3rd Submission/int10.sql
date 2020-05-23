--
.mode columns
.headers on
.nullvalue NULL

SELECT departamento, COUNT(DISTINCT Docente.id)
FROM Docente JOIN CadeiraDocente
WHERE Docente.categoria = 'Professor Auxiliar'
GROUP BY departamento
ORDER BY COUNT(DISTINCT Docente.id) DESC
;