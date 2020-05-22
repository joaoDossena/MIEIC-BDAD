# MIEIC-BDAD
Activities done for the subject of Databases @FEUP 2019/2020 (2020/1)

## To do:
  - [ ] 3rd submission (G and H) [May 24th] **(Vale 50% da nota)**
    - [ ] G - Interrogação da Base de dados
    - [ ] H - Adição de gatilhos à base de dados
  - [ ] Consertar problemas da submissão anterior:
    - [ ] diagrama de classes UML: As associações entre Docente e Cadeira e entre TurmaPratica e Cadeira deviam ser antes com OcorrenciaCadeira em vez de Cadeira
    - [ ] diagrama de classes UML: A nota devia ser um atributo da associação entre Estudante e ComponenteAvaliação
    - [ ] A associação entre OcorrenciaCadeira e Epoca devia ser \*-1
    - [ ] O atributo chave externa idOcorrenciaCadeira-> OcorrenciaCadeira está a mais na relação ComponenteAvaliacao
    - [ ] email também é chave da relação PessoaFEUP
    - [ ] NIF é um atributo primo da relação PessoaFEUP
    - [ ] em Pessoa FEUP, nif deve ser unico; telefone deve ser unico; email deve ser unico, então as dependencias funcionais deviam refletir isso mesmo
    - [x] Um atributo ser simultaneamente PRIMARY KEY e UNIQUE é redundante
    - [ ] Não definiram a chave primária das tabelas EstudanteOcorrenciaCadeira, EstudanteComponenteAvaliacao, EstudanteTurmaPratica, DocenteTurmaPratica, CadeiraDocente e OcorrenciaCadeiraEpoca

### G. Interrogação da Base de dados:
Para esta tarefa deve ser definido um conjunto de interrogações pertinentes para o contexto da base de dados. Por exemplo, uma interrogação que liste os países existentes numa base de dados de uma biblioteca é menos pertinente do que uma interrogação que lista os livros mais requisitados num dado período. Deste conjunto, devem ser selecionadas 10 interrogações que:
  - sejam diferentes entre si (por exemplo, ter uma interrogação que lista o nome dos clientes na base de dados e outra que lista o nome das empresas na base de dados é equivalentea ter apenas 1 interrogação);
  - na sua construção façam uso da maiordiversidade de operadores SQL;
  - sejam de complexidade distinta.

As 10 interrogações devem ser listadas, de forma ordenada e em linguagem natural, no relatório. Tal como na criação da base de dados, as interrogações devem começar por ser testadas interactivamente através do cliente de linha de comando do SQLite. 

As interrogações devem ser eficientes. Sempre que possível devem privilegiar as junções às sub-interrogações. Cada uma das 10 interrogações deve ser escrita num ficheiro próprio: int1.sql, int2.sql, ..., int10.sql. No início destes ficheiros devem ser incluídas as seguintes instruções para tornar o resultado mais legível:
  - .mode columns
  - .headers on
  - .nullvalue NULL
Os nomes dos ficheiros devem corresponder à ordenação das interrogações mencionadas no relatório.

### H. Adição de gatilhos à base de dados:
Por fim, devem ser definidos 3 gatilhos que sejam úteis para a monitorização e manutenção da base de dados. Pelo menos um dos gatilhos deve implementar uma restrição. Para cada gatilho devem ser criados 3 ficheiros: gatilhoN_adiciona.sql,gatilhoN_remove.sqle gatilhoN_verifica.sql, com N = 1, 2 ou 3.

Em gatilhoN_adiciona.sql, deve ser incluídaa instrução SQL que permitecriar o gatilho. Caso a restrição para a qualse está a criar o gatilho possa ser violada por mais do que um tipo de modificação à base de dados, pode ser necessáriocriar mais do que um gatilho para garantir a restrição. Se o gatilho descobrir que uma restrição está a ser violada, pode modificar a base de dados de forma a garantir que a violação é anuladaou pode desencadear um erro. Um gatilho SQLite pode desencadear um erro através de:
  SELECT raise(rollback, ‘<mensagem de erro>’);

Quando esta instrução é executada, a ação que desencadeou o gatilho é desfeita e é apresentada a mensagem de erro pretendida.

No ficheiro gatilhoN_remove.sql deve ser incluída a instrução que elimina o gatilho da base de dados. No ficheiro gatilhoN_verifica.sql devem ser incluídas as instruções SQL que permitem confirmar que o gatilho está bem implementado. Por exemplo, se o gatilho inserir um tuplo na relação R2 sempre que seja inserido um tuplo na relação R1, este ficheiro deverá ter instruções semelhantes a:
  SELECT * FROM TABLER2;INSERT INTO R1VALUES(valor1, valor2, ...);
  SELECT * FROM TABLE R2;

No relatório deve descrever sucintamente,de forma ordenada e em linguagem natural,os 3 gatilhos implementados.
Os nomes dos ficheiros devem corresponderà ordenação das interrogações mencionadas no relatório. Em cada um dos ficheiros, deve ser ativada a verificação de integridade referencial.