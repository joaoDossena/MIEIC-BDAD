--Atualizar numero de estudantes da turma pratica quando um aluno é eliminado da ocorrenciaTurmaPratica
Drop Trigger IF EXISTS AtualizarNumEstudantesDEL;
Create Trigger AtualizarNumEstudantesDEL
	AFTER Delete ON EstudanteTurmaPratica
	FOR EACH ROW
	Begin
		update TurmaPratica
		set numEstudantes = numEstudantes -1
		where TurmaPratica.idTurmaPratica = Old.idTurmaPratica;
	End;