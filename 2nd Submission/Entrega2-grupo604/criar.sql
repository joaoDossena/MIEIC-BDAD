PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;

--Estudante
DROP TABLE IF EXISTS Estudante;
CREATE TABLE Estudante (
	id STRING REFERENCES PessoaFEUP (id)
			PRIMARY KEY
			NOT NULL,
	anoInscricao INTEGER
				NOT NULL,
	idCurso REFERENCES Curso (idCurso)
			NOT NULL
);

--Docente
DROP TABLE IF EXISTS Docente;
CREATE TABLE Docente (
	id STRING REFERENCES PessoaFEUP (id)
			PRIMARY KEY
			NOT NULL,
	categoria STRING
				NOT NULL,
	departamento STRING
				NOT NULL
);

--Curso
DROP TABLE IF EXISTS Curso;
CREATE TABLE Curso (
	idCurso STRING PRIMARY KEY
					NOT NULL,
	nome STRING
		NOT NULL,
	grauAcademico STRING
					NOT NULL,
	duracao INTEGER
			NOT NULL,
	mediaEntrada DOUBLE 
				CHECK (mediaEntrada >= 0 AND mediaEntrada <= 20)
				NOT NULL,
	dataInicio DATE
				NOT NULL
);

--Cadeira
DROP TABLE IF EXISTS Cadeira;
CREATE TABLE Cadeira (
	idCadeira STRING PRIMARY KEY
						NOT NULL,
	nome STRING
		NOT NULL,
	creditos DOUBLE
			NOT NULL,
	idCurso STRING 
			REFERENCES Curso (idCurso)
			NOT NULL
);

--OcorrenciaCadeira
DROP TABLE IF EXISTS OcorrenciaCadeira;
CREATE TABLE OcorrenciaCadeira (
	idOcorrenciaCadeira STRING PRIMARY KEY
								NOT NULL,
	idCadeira STRING 
			REFERENCES Cadeira (idCadeira)
			NOT NULL
);

--Epoca
DROP TABLE IF EXISTS Epoca;
CREATE TABLE Epoca (
	idEpoca STRING PRIMARY KEY
					NOT NULL,
	anoLetivo STRING
				NOT NULL,
	semestre STRING 
			CHECK (semestre = "Primeiro" OR semestre = "Segundo")
			NOT NULL
);

--ComponenteAvaliacao
DROP TABLE IF EXISTS ComponenteAvaliacao;
CREATE TABLE ComponenteAvaliacao (
	idComponenteAvaliacao STRING PRIMARY KEY
								NOT NULL,
	nome STRING
		NOT NULL,
	idOcorrenciaCadeira STRING 
						REFERENCES OcorrenciaCadeira (idOcorrenciaCadeira)
						NOT NULL
);

--Nota
DROP TABLE IF EXISTS Nota;
CREATE TABLE Nota (
	idNota STRING PRIMARY KEY
					NOT NULL,
	nota DOUBLE
		NOT NULL,
	idComponenteAvaliacao STRING 
						  REFERENCES ComponenteAvaliacao (idComponenteAvaliacao)
						  NOT NULL
);

--EstudanteOcorrenciaCadeira
DROP TABLE IF EXISTS EstudanteOcorrenciaCadeira;
CREATE TABLE EstudanteOcorrenciaCadeira (
	id STRING 
		REFERENCES Estudante (id)
		NOT NULL,
	idOcorrenciaCadeira STRING
		REFERENCES OcorrenciaCadeira (idOcorrenciaCadeira)
		NOT NULL,
	PRIMARY KEY (id, idOcorrenciaCadeira)
);

--EstudanteComponenteAvaliacao
DROP TABLE IF EXISTS EstudanteComponenteAvaliacao;
CREATE TABLE EstudanteComponenteAvaliacao (
	id STRING 
		REFERENCES Estudante (id)
		NOT NULL,
	idComponenteAvaliacao STRING
		REFERENCES ComponenteAvaliacao (idComponenteAvaliacao)
		NOT NULL,
	PRIMARY KEY (id, idComponenteAvaliacao)
);

--EstudanteTurmaPratica
DROP TABLE IF EXISTS EstudanteTurmaPratica;
CREATE TABLE EstudanteTurmaPratica (
	id STRING
		REFERENCES Estudante (id)
		NOT NULL,
	idTurmaPratica STRING
		REFERENCES TurmaPratica (idTurmaPratica)
		NOT NULL,
	PRIMARY KEY (id, idTurmaPratica)
);

--DocenteTurmaPratica
DROP TABLE IF EXISTS DocenteTurmaPratica;
CREATE TABLE DocenteTurmaPratica (
	id STRING 
		REFERENCES Docente (id)
		NOT NULL,
	idTurmaPratica STRING
		REFERENCES TurmaPratica (idTurmaPratica)
		NOT NULL,
	PRIMARY KEY (id, idTurmaPratica)
);

--CadeiraDocente
DROP TABLE IF EXISTS CadeiraDocente;
CREATE TABLE CadeiraDocente (
	id STRING 
		REFERENCES Docente (id)
		NOT NULL,
	idCadeira STRING 
		REFERENCES Cadeira (idCadeira)
		NOT NULL,
	PRIMARY KEY (id, idCadeira)
);

--OcorrenciaCadeiraEpoca
DROP TABLE IF EXISTS OcorrenciaCadeiraEpoca;
CREATE TABLE OcorrenciaCadeiraEpoca (
	idOcorrenciaCadeira STRING 
				REFERENCES OcorrenciaCadeira (idOcorrenciaCadeira)
				NOT NULL,
	idEpoca STRING 
				REFERENCES Epoca (idEpoca)
				NOT NULL,
	PRIMARY KEY (idOcorrenciaCadeira, idEpoca)
);

--TurmaPratica
DROP TABLE IF EXISTS TurmaPratica;
CREATE TABLE TurmaPratica (
	idTurmaPratica STRING PRIMARY KEY
					NOT NULL,
	numEstudantes INTEGER
				NOT NULL,
	diaSemana STRING 
	CHECK (diaSemana in 
		("Segunda-Feira", "Terça-Feira", "Quarta-Feira", "Quinta-Feira", "Sexta-Feira"))
		NOT NULL,
	horaInicio TIME
				NOT NULL,
	horaFim TIME
			NOT NULL,
	idCadeira STRING
			REFERENCES Cadeira (idCadeira)
			NOT NULL
);

--PessoaFEUP
DROP TABLE IF EXISTS PessoaFEUP;
CREATE TABLE PessoaFEUP (
	id STRING PRIMARY KEY
		UNIQUE 
		NOT NULL,
	nome STRING
		NOT NULL,
	morada STRING
		NOT NULL,
	dataNasc DATE
		NOT NULL,
	sexo CHAR 
		CHECK (sexo = 'M' OR sexo = 'F')
		NOT NULL,
	NIF INTEGER 
		UNIQUE
		NOT NULL,
	telefone INTEGER 
			UNIQUE 
			NOT NULL,
	email STRING
		CHECK (email LIKE '%@%.%')
		UNIQUE
);


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
