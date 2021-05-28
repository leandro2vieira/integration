CREATE SEQUENCE exportproducao_id_seq
    START WITH 1
    INCREMENT BY 1;

CREATE TABLE exportproducao (
  id NUMBER(10) not null
  CONSTRAINT exportproducao_pkey
  PRIMARY KEY,
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
  data_geracao TIMESTAMP(3),
  inicio TIMESTAMP,
  fim TIMESTAMP,
  duracao NUMBER(10),
  codigo_lote VARCHAR2(32) DEFAULT '',
  quantidade NUMBER(20,10),
  quantidade2 NUMBER(20,10) DEFAULT 0,
  quantidade3 NUMBER(20,10) DEFAULT 0,
  taxa_de_conversao NUMBER(20,10) DEFAULT 1
);