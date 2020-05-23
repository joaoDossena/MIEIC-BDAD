--Lista os horários de início e fim das turmas práticas 01 do curso MIEIC, ordenados por duração da aula
.mode columns
.headers on
.nullvalue NULL

SELECT horaInicio, horaFim, idTurmaPratica
FROM TurmaPratica
WHERE idTurmaPratica LIKE 'MIEIC-%01' 
ORDER BY (horaFim - horaInicio)
ASC
;