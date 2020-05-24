SELECT * FROM TurmaPratica;

INSERT INTO EstudanteTurmaPratica (id, idTurmaPratica) VALUES ('UP201800001', 'MIEIC-BDAD03');
UPDATE TurmaPratica
SET numEstudantes = numEstudantes + 1
WHERE idTurmaPratica = 'MIEIC-BDAD03';


DELETE FROM EstudanteTurmaPratica WHERE id = 'UP201800001' AND idTurmaPratica = 'MIEIC-BDAD03';

SELECT * FROM TurmaPratica;
