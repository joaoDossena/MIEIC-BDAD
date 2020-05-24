--Quando um Estudante é adicionado na classe EstudanteTurmaPratica, o atributo numEstudantes é incrementado por 1. 
PRAGMA foreign_keys = ON;

DROP TRIGGER IF EXISTS AtualizarNumEstudantes;
CREATE TRIGGER AtualizarNumEstudantes
	AFTER INSERT ON EstudanteTurmaPratica
	FOR EACH ROW
	BEGIN
		UPDATE TurmaPratica
		SET numEstudantes = numEstudantes + 1
		WHERE TurmaPratica.idTurmaPratica = NEW.idTurmaPratica;
	END;
