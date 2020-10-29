CREATE TABLE IMPORTGRUPOMAQUINA (
  id        SERIAL       NOT NULL,
  nome      VARCHAR(30)  NOT NULL,
  descricao VARCHAR(128) NOT NULL,
  status_imp VARCHAR(1) not null);


  CREATE TABLE IMPORTMAQUINA
(
  id                  SERIAL          NOT NULL,
  empresa             INTEGER         NOT NULL,
  codigo              VARCHAR(30)     NOT NULL,
  descricao           VARCHAR(128)    NOT NULL,
  linear              BOOLEAN         NOT NULL,
  grupo               VARCHAR(32),
  ativa               BOOLEAN         NOT NULL,
  fator_velocidade    NUMERIC(20, 10) NOT NULL,
  status_imp          VARCHAR(32)     NOT NULL
  );
  
  
  
CREATE TABLE IMPORTOPERADOR
(
  id      SERIAL       NOT NULL,
  empresa INTEGER      NOT NULL,
  codigo  VARCHAR(30)  NOT NULL,
  nome    VARCHAR(128) NOT NULL,
  ativo   BOOLEAN      NOT NULL,
  status_imp VARCHAR(1) NOT NULL
);




CREATE TABLE IMPORTMOTIVOREFUGO
(
  id        SERIAL       NOT NULL,
  empresa   INTEGER      NOT NULL,
  codigo    VARCHAR(30)  NOT NULL,
  descricao VARCHAR(128) NOT NULL,
  qualidade BOOLEAN      NOT NULL,
  status_imp VARCHAR(1) not null
  );

  
  
  CREATE TABLE IMPORTMOTIVOPARADA
(
  id             SERIAL       NOT NULL,
  empresa        INTEGER      NOT NULL,
  codigo         VARCHAR(30)  NOT NULL,
  descricao      VARCHAR(128) NOT NULL,
  abreviacao     VARCHAR(16)  NOT NULL,
  senha          VARCHAR(32)  NOT NULL,
  cor            VARCHAR(7)   NOT NULL,
  programada     BOOLEAN      NOT NULL,
  ativa          BOOLEAN      NOT NULL,
  setup          BOOLEAN      NOT NULL,
  status_imp     VARCHAR(1)   NOT NULL
);


CREATE TABLE IMPORTFERRAMENTA
(
  id                        SERIAL          NOT NULL,
  empresa                   INTEGER         NOT NULL,
  codigo                    VARCHAR(30)     NOT NULL,
  descricao                 VARCHAR(128),
  coeficiente_multiplicacao NUMERIC(20, 10) NOT NULL,
  depreciacao               NUMERIC(20, 10) NOT NULL,
  tempo_ciclo               INTEGER         NOT NULL,
  limite_ciclo              INTEGER         NOT NULL,
  limite_parada             INTEGER         NOT NULL,
  tempo_insercao            BIGINT          NOT NULL,
  tempo_remocao             BIGINT          NOT NULL,
  status_imp                VARCHAR(1)      NOT NULL
);



CREATE TABLE IMPORTFERRAMENTAPRODUTO
(
  id                        SERIAL          NOT NULL,
  empresa                   INTEGER         NOT NULL,
  maquina                   VARCHAR(30),
  produto                   VARCHAR(30),
  derivacao                 VARCHAR(30),
  codigo_operacao           VARCHAR(30),
  descricao                 VARCHAR(128),
  coeficiente_multiplicacao NUMERIC(20, 10) NOT NULL,
  depreciacao               NUMERIC(20, 10) NOT NULL,
  tempo_ciclo               INTEGER         NOT NULL,
  limite_ciclo              INTEGER         NOT NULL,
  limite_parada             INTEGER         NOT NULL,
  tempo_insercao            BIGINT          NOT NULL,
  tempo_remocao             BIGINT          NOT NULL,
  tipo_cadastro             VARCHAR(1) DEFAULT 'I',
  situacao                  INTEGER         NOT NULL,
  status_imp                VARCHAR(1) NOT NULL
  );

  
  
  CREATE TABLE IMPORTPRODUTO
(
  id        SERIAL       NOT NULL,
  empresa   INTEGER      NOT NULL,
  codigo    VARCHAR(30)  NOT NULL,
  descricao VARCHAR(128) NOT NULL,
  status_imp VARCHAR(1) NOT NULL
  );

  
  
  CREATE TABLE IMPORTSUBPRODUTO
(
  id        SERIAL       NOT NULL,
  empresa   INTEGER      NOT NULL,
  codigo    VARCHAR(30)  NOT NULL,
  descricao VARCHAR(128) NOT NULL,
  status_imp VARCHAR(1) NOT NULL
);



CREATE TABLE IMPORTOP
(
  id               SERIAL          NOT NULL,
  empresa          INTEGER         NOT NULL,
  origem           VARCHAR(30)     NOT NULL DEFAULT 0,
  codigo           VARCHAR(30)     NOT NULL,
  descricao        VARCHAR(128),
  produto          VARCHAR(30),
  subproduto       VARCHAR(30),
  derivacao        VARCHAR(30),
  pedido           INTEGER DEFAULT 1,
  unidade_medida   VARCHAR(128) DEFAULT 'PC',
  nome_cliente     VARCHAR(128),
  quantidade       NUMERIC(20, 10) NOT NULL DEFAULT 1,
  master_op        VARCHAR(30),
  fracao_master    NUMERIC(10, 9)  NOT NULL DEFAULT 1,
  data_limite      TIMESTAMP WITH TIME ZONE,
  prioridade       NUMERIC(20, 10) NOT NULL DEFAULT 1,
  status_imp       VARCHAR(1) NOT NULL

);



CREATE TABLE IMPORTSEQUENCIAPRODUCAO
(
  id                   SERIAL          NOT NULL,
  empresa              INTEGER         NOT NULL,
  origem               VARCHAR(30) DEFAULT 0,
  codigo               VARCHAR(30) NOT NULL,
  sequencia            INTEGER         NOT NULL,
  estagio              INTEGER         NOT NULL,
  maquina              VARCHAR(30),
  ferramenta           varchar(30),
  codigo_operacao      VARCHAR(30),
  quantidade           NUMERIC(20, 10) NOT NULL,
  data_prevista_inicio TIMESTAMP WITH TIME ZONE,
  data_prevista_fim    TIMESTAMP WITH TIME ZONE,
  setup_previsto       BIGINT          NOT NULL,
  tempo_previsto       BIGINT          NOT NULL,
  status_imp           VARCHAR(1) NOT NULL
);