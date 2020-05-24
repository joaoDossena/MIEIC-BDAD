Select * from TurmaPratica;

INSERT INTO EstudanteTurmaPratica (id, idTurmaPratica) VALUES ('UP201800001', 'MIEIC-BDAD02');
Update TurmaPratica
Set numEstudantes = numEstudantes +1
Where TurmaPratica.idTurmaPratica = 'MIEIC-BDAD02';

Select * from TurmaPratica;

Delete from EstudanteTurmaPratica where id = 'UP201800001' And idTurmaPratica = 'MIEIC-BDAD02';

Select * from TurmaPratica;
