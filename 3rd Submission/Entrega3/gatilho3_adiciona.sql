--Quando é eliminado um Estudante na classe EstudanteTurmaPratica, o número de estudantes é decrementado por 1.
DROP TRIGGER IF EXISTS AtualizarNumEstudantesDEL;
CREATE TRIGGER AtualizarNumEstudantesDEL
	AFTER DELETE ON EstudanteTurmaPratica
	FOR EACH ROW
	BEGIN
		UPDATE TurmaPratica
		SET numEstudantes = numEstudantes -1
		WHERE TurmaPratica.idTurmaPratica = Old.idTurmaPratica;
	END;
