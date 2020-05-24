--Quando um docente é removido da turma pratica, e se nao houver mais nenhum docente entao é adicionado um docente qualquer
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