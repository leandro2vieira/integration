-- PostgreSQL
CREATE SEQUENCE exportrefugo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
	CACHE 1;

CREATE TABLE public.exportrefugo (
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
  horario TIMESTAMP,
  motivo VARCHAR(30),
  codigo_lote VARCHAR(32) DEFAULT '',
  quantidade DECIMAL(20,10),
  quantidade2 DECIMAL(20,10) DEFAULT 0,
  quantidade3 DECIMAL(20,10) DEFAULT 0,
  taxa_de_conversao DECIMAL(20,10) DEFAULT 1,
  classificacao VARCHAR(30),
  etapa_causa VARCHAR(30),
  maquina_causa VARCHAR(30),
  CONSTRAINT exportrefugo_pkey PRIMARY KEY(id)
) 
WITH (oids = false);