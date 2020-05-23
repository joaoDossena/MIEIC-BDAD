--Mostra os Cursos com, respectivamente, maior e menor médias de entrada
.mode columns
.headers on
.nullvalue NULL

SELECT idCurso, mediaEntrada
FROM Curso
WHERE mediaEntrada = (SELECT MAX(mediaEntrada) FROM Curso) 
OR mediaEntrada = (SELECT MIN(mediaEntrada) FROM Curso) 
ORDER BY mediaEntrada
DESC
;