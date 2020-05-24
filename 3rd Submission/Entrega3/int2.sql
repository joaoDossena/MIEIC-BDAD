--Lista os tuplos nota, idCadeira, tal que a nota seja menor que 10
.mode columns
.headers on
.nullvalue NULL

SELECT DISTINCT nota, idCadeira
FROM (Nota JOIN OcorrenciaCadeira JOIN ComponenteAvaliacao)
WHERE ( (Nota.idComponenteAvaliacao = ComponenteAvaliacao.idComponenteAvaliacao)
AND (ComponenteAvaliacao.idOcorrenciaCadeira = OcorrenciaCadeira.idOcorrenciaCadeira)
AND (Nota.nota < 10) )
ORDER BY nota ASC;