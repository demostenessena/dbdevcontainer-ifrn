/*markdown
# Comando **SELECT**
*/

/*markdown
### 1\. Consulta todos os dados da tabela _Tempo_ 
*/


SELECT * FROM dbo.Tempo;

/*markdown
### 2\. Consulta campos específicos da tabela _Tempo_
*/

SELECT data_coleta, tempo_min, 
       tempo_max, precip_pluviom 
FROM dbo.Tempo;

"""3\. Consulta campos específicos da tabela _Tempo_ usando _alias_"""

SELECT  t.data_coleta as "data da coleta",
        t.tempo_min as "mínima",
        t.tempo_max as "máxima",
        t.precip_pluviom as "precipitação"
    FROM dbo.Tempo as t;

"""4\. Consulta com paginação dos resultados usando OFFSET e _FETCH_ NEXT"""

-- ## SQL SERVER
SELECT  data_coleta as 'data da coleta',
        tempo_min as mínima,
        tempo_max as máxima,
        precip_pluviom as precipitação
    FROM dbo.Tempo ORDER BY data_coleta ASC, mínima DESC
            OFFSET 8 ROWS FETCH NEXT 4 ROWS ONLY;

-- ## POSTGRESQL
SELECT  data_coleta as "data da coleta",
        tempo_min as "mínima",
        tempo_max as "máxima",
        precip_pluviom as precipitação
    FROM dbo.Tempo OFFSET 8 LIMIT 4;

"""5\. Exibindo as diferentes temperaturas mínimas coletadas."""

SELECT DISTINCT 
    tempo_min as "Temperatura mínima" 
FROM dbo.Tempo;

"""6\. Consulta informações específicas com a combinação das colunas (formatação da saída)"""

-- ## SQL SERVER ##
-- Visualizar as variações das temperaturas nos diferentes dias.
SELECT  data_coleta as 'data da coleta',
        concat((tempo_max - tempo_min), '°C') as 'variação da temperatura'
    FROM dbo.Tempo;

-- ## POSTGRES ##
-- Visualizar as variações das temperaturas nos diferentes dias.
SELECT  data_coleta as "data da coleta",
        concat((tempo_max - tempo_min), '°C') as "variação da temperatura"
    FROM dbo.Tempo;

-- ## POSTGRES ##
-- Visualizar as variações das temperaturas nos diferentes dias.
SELECT  data_coleta as "data da coleta",
        ((tempo_max - tempo_min) || '°C') as "variação da temperatura"
    FROM dbo.Tempo;

-- ## POSTGRES ##
-- Visualizar as variações das temperaturas nos diferentes dias.
SELECT  data_coleta as "data da coleta",
        concat((tempo_max - tempo_min), '°C') as "variação da temperatura"
    FROM dbo.Tempo;

"""7\. Consulta com os operadores de condição"""

-- ## SQL SERVER ##
-- Retorna a data da coleta e a variação da temperatura dos dias com precipitação acima de 20mm.
SELECT data_coleta as 'data da coleta', concat((tempo_max - tempo_min), '°C') as 'variação da temperatura'
    FROM dbo.Tempo
    WHERE precip_pluviom > 20;

-- ## POSTGRESQL ##
-- Retorna a data da coleta e a variação da temperatura dos dias com precipitação acima de 20mm.
SELECT data_coleta as "data da coleta", concat((tempo_max - tempo_min), '°C') as "variação da temperatura"
    FROM dbo.Tempo
    WHERE precip_pluviom > 20;

-- ## SQL SERVER ##
-- Retorna a data da coleta e a variação da temperatura no dia '14 de agosto de 2020'.
SELECT data_coleta as 'data da coleta', concat((tempo_max - tempo_min), '°C') as 'variação da temperatura'
    FROM dbo.Tempo
    WHERE data_coleta = '2020-08-14';

-- ## POSTGRESQL ##
-- Retorna a data da coleta e a variação da temperatura no dia '14 de agosto de 2020'.
SELECT data_coleta as "data da coleta", concat((tempo_max - tempo_min), '°C') as "variação da temperatura"
    FROM dbo.Tempo
    WHERE data_coleta = '2020-08-14';

-- ## SQL SERVER ##
-- Retorna a data da coleta e a variação da temperatura no dia 14 de qualquer mês em qualquer ano.
SELECT data_coleta as 'data da coleta', concat((tempo_max - tempo_min), '°C') as 'variação da temperatura'
    FROM dbo.Tempo
    WHERE day(data_coleta) <> 14;

-- ## POSTGRESQL ##
-- Retorna a data da coleta e a variação da temperatura no dia 14 de qualquer mês em qualquer ano.
SELECT data_coleta as "data da coleta", concat((tempo_max - tempo_min), '°C') as "variação da temperatura"
    FROM dbo.Tempo
    WHERE extract(day from data_coleta) <> 14;

"""8\. Consulta com condição composta."""

-- ## SQL SERVER ##
-- Retorna a data da coleta e a variação da temperatura no dia 14 e a precipitação acima de 20'.
SELECT  data_coleta as 'data da coleta',
        concat((tempo_max - tempo_min), '°C') as 'variação da temperatura'
    FROM dbo.Tempo
    WHERE day(data_coleta) <> 14 AND precip_pluviom > 20;

-- ## POSTGRESQL ##
-- Retorna a data da coleta e a variação da temperatura no dia 14 e a precipitação acima de 20'.
SELECT  data_coleta as "data da coleta",
        concat((tempo_max - tempo_min), '°C') as "variação da temperatura"
    FROM dbo.Tempo
    WHERE extract(day from data_coleta) <> 14 AND precip_pluviom > 20;

"""9\. Consulta com a verificação da existência de um valor em um campo."""

-- Retorna o CPF e nome dos clientes que não possuem e-mail.
SELECT cpf, nome
    FROM dbo.Cliente
    WHERE email is not null;

"""10\. Consulta com a verificação de um padrão de texto (operador _LIKE_)"""

-- Retorna os dados dos clientes que a letra 'a' não seja a quarta letra do nome.
SELECT * FROM dbo.Cliente WHERE nome NOT LIKE '___a%';

-- ## SQL SERVER ##
-- Retorna os dados dos clientes que a quarta letra do nome é 'a' ou 'i'.
SELECT * FROM dbo.Cliente WHERE nome LIKE '___[ai]%';

-- ## POSTGRESQL ##
-- Retorna os dados dos clientes que a quarta letra do nome é 'a' ou 'i'.
SELECT * FROM dbo.Cliente WHERE nome LIKE '___a%' OR nome LIKE '___i%';

-- ## POSTGRESQL ##
-- Retorna os dados dos clientes que possuem o caracter % no nome.
SELECT * FROM dbo.Cliente WHERE nome LIKE '%\_%';

"""11\. Consulta com a verificação de um valor em um conjunto pré-determinado (operador _IN_)."""

-- Retornar os dados das coletas com a precipitação de 15, 30 ou 35mm.
SELECT precip_pluviom, data_coleta
    FROM dbo.Tempo
    WHERE precip_pluviom  not IN (15,30,35);

"""12\. Consulta com a verificação de um valor dentro de limite máximo e mínimo (operador _BETWEEN_)."""

-- Retornar os dados das coletas com a precipitação entre 15 e 30mmm.
SELECT precip_pluviom, data_coleta
    FROM dbo.Tempo
    WHERE precip_pluviom BETWEEN 15 AND 30;

"""13\. Comparação entre o operador _BETWEEN_ e a combinação dos operadores \>= e _\<=_."""

-- Retornar os dados das coletas com a precipitação entre 15 e 30mmm.
SELECT precip_pluviom, data_coleta
    FROM dbo.Tempo
    WHERE precip_pluviom >= 15 AND 
          precip_pluviom <= 30;

"""14\. Consulta com ordenação do resultado (operador _ORDER BY_ com _ASC_ ou _DESC_)."""

/* Retornar os dados das coletas com a precipitação entre 15 e 30mmm. Os dados devem
ser ordenados pela data da coleta e pela precipitação pluviométrica. */
SELECT precip_pluviom, data_coleta
    FROM dbo.Tempo
    WHERE precip_pluviom >= 15 AND 
          precip_pluviom <= 30
    ORDER BY data_coleta DESC, 
             precip_pluviom ASC;

"""15\. Consulta utilizando o operador de agrupamento (_GROUP BY_ com _HAVING_)."""

-- ### SQL SERVER
-- A média das temperaturas máxima de agosto de 2020.
SELECT avg(tempo_max)
    FROM dbo.Tempo WHERE month(data_coleta) = 08 AND year(data_coleta) = 2020;

-- ### POSTGRESQL
-- A média das temperaturas máxima de agosto de 2020.
SELECT avg(tempo_max)
FROM dbo.Tempo 
WHERE extract(month from data_coleta) = 08 AND
      extract(year from data_coleta) = 2020;

-- Retorna a quantidade de coletas realizadas por dia.
SELECT data_coleta as 'Data da coleta', count(*) as 'Quantidade'
    FROM dbo.Tempo
    GROUP BY data_coleta;

-- Retorna a quantidade de coletas realizadas por dia, exceto no dia 12 de agosto de 2020.
SELECT data_coleta as "Data da coleta",
       tempo_max as "Temperatura",
       count(*) as "Quantidade"
FROM dbo.Tempo
GROUP BY data_coleta, tempo_max
ORDER BY data_coleta asc;

"""16\. Consulta utilizando as funções de agregamento (ou agregadas)."""

-- Retorna a média e a soma das temperaturas máximas.
SELECT  avg(tempo_max) as 'Média',
        sum(tempo_max) as 'Soma das temperaturas máximas'
    FROM dbo.Tempo;

"""17\. Criando a combinação dos resultados de consultas (operadores _UNION_, _INTERSECT_ e _EXCEPT_)."""

-- Retorna as temperaturas máximas coletas nos dias 12 e 14 de agosto de 2020.
SELECT tempo_max
    FROM dbo.Tempo
    WHERE data_coleta = '2020-08-12'
UNION
SELECT tempo_max
    FROM dbo.Tempo
    WHERE data_coleta = '2020-08-14';

"""18\. Consulta com consultas aninhadas."""

-- Retorna os dados das coletas realizadas na cidade de Natal ou Recife.
SELECT data_coleta, tempo_max, tempo_min
    FROM dbo.Tempo
    WHERE id_cidade IN
        (SELECT id FROM dbo.Cidade WHERE
                    nome = 'Natal' OR
                    nome = 'Recife');

-- Retorna os dados das coletas realizadas na cidade de Natal ou Recife.
SELECT data_coleta, tempo_max, tempo_min
FROM dbo.Tempo, dbo.Cidade c
WHERE id_cidade = c.id and 
    (c.nome = 'Natal' or c.nome = 'Recife');
        