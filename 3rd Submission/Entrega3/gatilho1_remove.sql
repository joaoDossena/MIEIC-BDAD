PRAGMA FOREIGN_KEYS = OFF;

DROP TRIGGER IF EXISTS AtualizarNumEstudantes;
DELETE FROM EstudanteTurmaPratica WHERE id = 'UP201800001' AND idTurmaPratica = 'MIEIC-BDAD03';
UPDATE TurmaPratica
SET numEstudantes = numEstudantes -1
WHERE TurmaPratica.idTurmaPratica = 'MIEIC-BDAD03';
