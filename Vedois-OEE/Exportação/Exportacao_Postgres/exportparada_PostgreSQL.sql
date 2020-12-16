-- PostgreSQL
CREATE SEQUENCE exportparada_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE public.exportparada (
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
  duracao BIGINT,
  motivo VARCHAR(30),
  setup BOOLEAN DEFAULT FALSE,
  CONSTRAINT exportparada_pkey PRIMARY KEY(id)
) 
WITH (oids = false);


