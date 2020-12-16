-- PostgreSQL
CREATE SEQUENCE exportcomponente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE public.exportcomponente (
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
  codigo VARCHAR(32),
  versao VARCHAR(64),
  codigo_barras VARCHAR(64),
  tipo VARCHAR(2),
  lote VARCHAR(32),
  quantidade NUMERIC(20,10) DEFAULT 0,
  atributo NUMERIC(20,10) DEFAULT 0,
  atributo2 NUMERIC(20,10) DEFAULT 0,
  atributo3 NUMERIC(20,10) DEFAULT 0,
  taxa_de_conversao NUMERIC(20,10) DEFAULT 1,
  inicio TIMESTAMP,
  CONSTRAINT exportcomponente_pkey PRIMARY KEY(id)
) 
WITH (oids = false);