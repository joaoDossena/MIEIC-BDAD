PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;

--Estudante
DROP TABLE IF EXISTS Estudante;
CREATE TABLE Estudante (
	id REFERENCES PessoaFEUP (id) PRIMARY KEY UNIQUE,
	anoInscricao INTEGER,
	idCurso REFERENCES Curso (idCurso)
);

--Docente
DROP TABLE IF EXISTS Docente;
CREATE TABLE Docente (
	id STRING REFERENCES PessoaFEUP (id) PRIMARY KEY UNIQUE,
	categoria STRING,
	departamento STRING
);

--Curso
DROP TABLE IF EXISTS Curso;
CREATE TABLE Curso (
	idCurso STRING PRIMARY KEY UNIQUE,
	nome STRING,
	grauAcademico STRING,
	duracao INTEGER,
	mediaEntrada INTEGER CHECK (mediaEntrada >= 0 AND mediaEntrada <= 20),
	dataInicio DATE
);

--Cadeira
DROP TABLE IF EXISTS Cadeira;
CREATE TABLE Cadeira (
	cadeiraID STRING PRIMARY KEY UNIQUE,
	nome STRING,
	creditos INTEGER,
	idCurso STRING REFERENCES Curso (idCurso)
);

--OcorrenciaCadeira
DROP TABLE IF EXISTS OcorrenciaCadeira;
CREATE TABLE OcorrenciaCadeira (
	idOcorrenciaCadeira STRING PRIMARY KEY UNIQUE,
	cadeiraID STRING REFERENCES Cadeira (codigo)
);

--Epoca
DROP TABLE IF EXISTS Epoca;
CREATE TABLE Epoca (
	idEpoca STRING PRIMARY KEY UNIQUE,
	anoLetivo STRING,
	semestre STRING CHECK (semestre LIKE "Primeiro" OR "Segundo")
);

--ComponenteAvaliacao
DROP TABLE IF EXISTS ComponenteAvaliacao;
CREATE TABLE ComponenteAvaliacao (
	idComponenteAvaliacao STRING PRIMARY KEY UNIQUE,
	nome STRING,
	idOcorrenciaCadeira STRING REFERENCES OcorrenciaCadeira (idOcorrenciaCadeira)
);

--Nota
DROP TABLE IF EXISTS Nota;
CREATE TABLE Nota (
	idNota STRING PRIMARY KEY UNIQUE,
	nota DOUBLE,
	idComponenteAvaliacao STRING REFERENCES ComponenteAvaliacao (idComponenteAvaliacao)
);

--EstudanteOcorrenciaCadeira
DROP TABLE IF EXISTS EstudanteOcorrenciaCadeira;
CREATE TABLE EstudanteOcorrenciaCadeira (
	id STRING REFERENCES Estudante (id),
	idOcorrenciaCadeira STRING REFERENCES OcorrenciaCadeira (idOcorrenciaCadeira)
);

--EstudanteComponenteAvaliacao
DROP TABLE IF EXISTS EstudanteComponenteAvaliacao;
CREATE TABLE EstudanteComponenteAvaliacao (
	id STRING REFERENCES Estudante (id),
	idComponenteAvaliacao STRING REFERENCES ComponenteAvaliacao (idComponenteAvaliacao)
);

--EstudanteTurmaPratica
DROP TABLE IF EXISTS EstudanteTurmaPratica;
CREATE TABLE EstudanteTurmaPratica (
	id STRING REFERENCES Estudante (id),
	idTurmaPratica STRING REFERENCES TurmaPratica (idTurmaPratica)
);

--DocenteTurmaPratica
DROP TABLE IF EXISTS DocenteTurmaPratica;
CREATE TABLE DocenteTurmaPratica (
	id STRING REFERENCES Docente (id),
	idTurmaPratica STRING REFERENCES TurmaPratica (idTurmaPratica)
);

--CadeiraDocente
DROP TABLE IF EXISTS CadeiraDocente;
CREATE TABLE CadeiraDocente (
	id STRING REFERENCES Docente (id),
	cadeiraID STRING REFERENCES Cadeira (cadeiraID)
);

--OcorrenciaCadeiraEpoca
DROP TABLE IF EXISTS OcorrenciaCadeiraEpoca;
CREATE TABLE OcorrenciaCadeiraEpoca (
	idOcorrenciaCadeira STRING REFERENCES OcorrenciaCadeira (idOcorrenciaCadeira),
	idEpoca STRING REFERENCES Epoca (idEpoca)
);

--TurmaPratica
DROP TABLE IF EXISTS TurmaPratica;
CREATE TABLE TurmaPratica (
	idTurmaPratica STRING PRIMARY KEY UNIQUE,
	numEstudantes INTEGER,
	diaSemana STRING CHECK (diaSemana LIKE "Segunda-Feira" OR "Terça-Feira" OR "Quarta-Feira" OR "Quinta-Feira" OR "Sexta-Feira"),
	horaInicio TIME,
	horaFim TIME,
	cadeiraID STRING REFERENCES Cadeira (cadeiraID)
);

--PessoaFEUP
DROP TABLE IF EXISTS PessoaFEUP;
CREATE TABLE PessoaFEUP (
	id STRING PRIMARY KEY UNIQUE,
	nome STRING,
	morada STRING,
	dataNasc DATE,
	sexo CHAR CHECK (sexo LIKE 'M' OR 'F'),
	NIF INTEGER UNIQUE,
	telefone INTEGER UNIQUE,
	email STRING UNIQUE
);


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
