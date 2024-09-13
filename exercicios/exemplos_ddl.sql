CREATE SCHEMA dbo;

CREATE TABLE dbo.Cidade
(
  nome VARCHAR(150) NOT NULL,
  estado CHAR(2) NOT NULL,
  id INT GENERATED BY DEFAULT AS IDENTITY,
  CONSTRAINT cidade_pk PRIMARY KEY (id),
  CONSTRAINT nome_estado_un UNIQUE (nome, estado)
);

CREATE TABLE dbo.Localizacao
(
  latitude FLOAT NOT NULL,
  longitude FLOAT NOT NULL,
  id_cidade INT NOT NULL,
  CONSTRAINT localizacao_pk PRIMARY KEY (latitude, longitude),
  CONSTRAINT localizacao_cidade_fk FOREIGN KEY (id_cidade)
              REFERENCES dbo.Cidade(id)
);

CREATE TABLE dbo.Central
(
  codigo CHAR(5) NOT NULL,
  CONSTRAINT central_pk PRIMARY KEY (codigo)
);

CREATE TABLE dbo.Tempo
(
  id INT GENERATED ALWAYS AS IDENTITY,
  tempo_min INT NOT NULL,
  tempo_max INT NOT NULL,
  precip_pluviom FLOAT NULL,
  data_coleta DATE NOT NULL,
  id_cidade INT NOT NULL,
  CONSTRAINT tempo_pk PRIMARY KEY (id),
  CONSTRAINT tempo_cidade_fk
    FOREIGN KEY (id_cidade) REFERENCES dbo.Cidade(id),
  CONSTRAINT data_cidade_un
    UNIQUE (data_coleta, id_cidade)
);

CREATE TABLE IF NOT EXISTS dbo.TempoCentral
(
  id_tempo INT NOT NULL,
  codigo_central CHAR(5) NOT NULL,
  CONSTRAINT tempocentral_pk
    PRIMARY KEY (codigo_central, id_tempo),
  CONSTRAINT tempocentral_central_fk
    FOREIGN KEY (codigo_central) REFERENCES dbo.Central(codigo),
  CONSTRAINT tempocentral_tempo_fk
    FOREIGN KEY (id_tempo) REFERENCES dbo.Tempo(id)
);

CREATE TABLE dbo.Cliente (
    cpf char(11) not null,
    nome varchar(150) not null,
    email varchar(150) null,
    primary key(cpf)
);