CREATE SEQUENCE exportcomponente_id_seq
    START WITH 1
    INCREMENT BY 1;

CREATE TABLE exportcomponente (
  id NUMBER(10)
  CONSTRAINT exportcomponente_pkey PRIMARY KEY,
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
  codigo VARCHAR2(32),
  versao VARCHAR2(64),
  codigo_barras VARCHAR2(64),
  tipo VARCHAR2(2),
  lote VARCHAR2(32),
  quantidade NUMBER(20,10) DEFAULT 0,
  atributo NUMBER(20,10) DEFAULT 0,
  atributo2 NUMBER(20,10) DEFAULT 0,
  atributo3 NUMBER(20,10) DEFAULT 0,
  taxa_de_conversao NUMBER(20,10) DEFAULT 1,
  inicio TIMESTAMP
);