-- SQL Server
CREATE SEQUENCE exportcomponente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE;

CREATE TABLE exportcomponente (
  id INTEGER,
  data_geracao DATETIME,
  empresa INTEGER,
  origem VARCHAR(30),
  op VARCHAR(30),
  estagio INTEGER,
  sequencia_producao INTEGER,
  produto VARCHAR(30),
  maquina VARCHAR(30),
  grupomaquina VARCHAR(30),
  ferramenta VARCHAR(30),
  operador VARCHAR(30),
  turno INTEGER,
  reg INTEGER DEFAULT 0,
  codigo VARCHAR(32),
  versao VARCHAR(64),
  codigo_barras VARCHAR(64),
  tipo VARCHAR(2),
  lote VARCHAR(32),
  quantidade DECIMAL(20,10) DEFAULT 0,
  atributo DECIMAL(20,10) DEFAULT 0,
  atributo2 DECIMAL(20,10) DEFAULT 0,
  atributo3 DECIMAL(20,10) DEFAULT 0,
  taxa_de_conversao DECIMAL(20,10) DEFAULT 1,
  inicio DATETIME,
  CONSTRAINT exportcomponente_pkey PRIMARY KEY(id)
);