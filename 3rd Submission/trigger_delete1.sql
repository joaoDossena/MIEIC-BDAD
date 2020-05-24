PRAGMA FOREIGN_KEYS = OFF;

Drop Trigger IF EXISTS AtualizarNumEstudantes;
Delete from EstudanteTurmaPratica where id = 'UP201800001' And idTurmaPratica = 'MIEIC-BDAD02';
Update TurmaPratica
Set numEstudantes = numEstudantes -1
Where TurmaPratica.idTurmaPratica = 'MIEIC-BDAD02';
