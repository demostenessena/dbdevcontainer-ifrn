SELECT * FROM dbo.Cidade;

INSERT INTO dbo.Cidade(id, nome, estado)
  VALUES (1, 'Natal','RN');

delete from dbo.cidade;

INSERT INTO dbo.Cidade(nome, estado)
VALUES ('Recife','PE'),
      ('Fortaleza','CE');

INSERT INTO dbo.Cidade (nome, estado)
  VALUES ('Macaíba','RN'), ('Mossoró','RN'); 

INSERT INTO dbo.Localizacao
VALUES (-5.825,-35.425,2);  

INSERT INTO dbo.Localizacao
VALUES (-8.042,-35.009,4),(-3.791,-38.598,5);

INSERT INTO dbo.Central
VALUES ('CMT01'),('CMT02');

INSERT INTO
dbo.Tempo(tempo_min, tempo_max, 
        precip_pluviom, data_coleta, id_cidade)
    VALUES
        (25,29,10,'2020-08-12',1),
        (25, 29, null, '2020-08-13', 1),
        (26, 31, 20, '2020-08-14', 1),

        (26, 29, 15, '2020-08-12', 4),
        (26, 30, 15, '2020-08-13', 4),
        (26, 30, 20, '2020-08-14', 4),

        (27, 30, 10, '2020-08-12', 5),
        (27, 31, null, '2020-08-13', 5),
        (26, 31, 30, '2020-08-14', 5);


INSERT INTO dbo.TempoCentral(id_tempo, codigo_central)
    VALUES
        (1, 'CMT01'),
        (1, 'CMT02'),
        (2, 'CMT01'),
        (3, 'CMT02'),
        (4, 'CMT02'),
        (4, 'CMT01'),
        (5, 'CMT01'),
        (6, 'CMT01'),
        (7, 'CMT01'),
        (8, 'CMT02'),
        (9, 'CMT02');

INSERT INTO dbo.Cliente (cpf, nome, email) VALUES
    ('01234567890', 'C Heusser', 'cheusser@email'),
    ('01234567891', 'F Machado', null),
    ('01234567892', 'S Silva', null);