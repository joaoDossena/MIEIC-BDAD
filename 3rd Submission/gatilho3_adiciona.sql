--Atualizar numero de estudantes da turma pratica quando um aluno é eliminado da ocorrenciaTurmaPratica
DROP TRIGGER IF EXISTS AtualizarNumEstudantesDEL;
CREATE TRIGGER AtualizarNumEstudantesDEL
	AFTER DELETE ON EstudanteTurmaPratica
	FOR EACH ROW
	BEGIN
		UPDATE TurmaPratica
		SET numEstudantes = numEstudantes -1
		WHERE TurmaPratica.idTurmaPratica = Old.idTurmaPratica;
	END;