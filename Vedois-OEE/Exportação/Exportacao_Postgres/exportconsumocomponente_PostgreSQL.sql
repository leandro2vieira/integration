-- PostgreSQL
CREATE SEQUENCE exportconsumocomponente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE public.exportconsumocomponente (
  id INTEGER,
  data_geracao TIMESTAMP,
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
  inicio TIMESTAMP,
  fim TIMESTAMP,
  duracao INTEGER,
  codigo_lote VARCHAR(32) DEFAULT '',
  codigo_barras VARCHAR(32),
  quantidade DECIMAL(20,10),
  quantidade2 DECIMAL(20,10) DEFAULT 0,
  quantidade3 DECIMAL(20,10) DEFAULT 0,
  taxa_de_conversao DECIMAL(20,10) DEFAULT 1,
  CONSTRAINT exportconsumocomponente_pkey PRIMARY KEY(id)
) 
WITH (oids = false);



