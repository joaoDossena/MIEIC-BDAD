--Quando um docente é removido da turma pratica, e se nao houver mais nenhum docente entao é adicionado um docente qualquer
PRAGMA foreign_keys = ON;

Drop Trigger IF EXISTS AtualizarNumEstudantes;
Create Trigger AtualizarNumEstudantes
	AFTER INSERT ON EstudanteTurmaPratica
	FOR EACH ROW
	Begin
		update TurmaPratica
		set numEstudantes = numEstudantes + 1
		where TurmaPratica.idTurmaPratica = NEW.idTurmaPratica;
	End;