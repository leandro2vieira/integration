CREATE SEQUENCE exportproducao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE;

CREATE TABLE exportproducao (
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
  inicio DATETIME,
  fim DATETIME,
  duracao INTEGER,
  codigo_lote VARCHAR(32) DEFAULT '',
  quantidade DECIMAL(20,10),
  quantidade2 DECIMAL(20,10) DEFAULT 0,
  quantidade3 DECIMAL(20,10) DEFAULT 0,
  taxa_de_conversao DECIMAL(20,10) DEFAULT 1,
  CONSTRAINT exportproducao_pkey PRIMARY KEY(id)
) ;


