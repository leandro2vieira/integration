CREATE SEQUENCE exportparada_id_seq
    START WITH 1
    INCREMENT BY 1;

CREATE TABLE exportparada (
  id NUMBER(10)
  CONSTRAINT exportparada_pkey PRIMARY KEY,
  data_geracao TIMESTAMP,
  empresa NUMBER(10),
  origem VARCHAR2(30),
  op VARCHAR2(30),
  estagio NUMBER(10),
  sequencia_producao NUMBER(10),
  produto VARCHAR2(30),
  maquina VARCHAR2(30),
  grupomaquina VARCHAR2(30),
  ferramenta VARCHAR2(30),
  operador VARCHAR2(30),
  turno NUMBER(10),
  reg NUMBER(10) DEFAULT 0,
  inicio TIMESTAMP,
  fim TIMESTAMP,
  duracao NUMBER(19),
  motivo VARCHAR2(30),
  setup CHAR(1) DEFAULT 0
);