create table importferramenta
(
    id                        int not null
        constraint importferramenta_pkey
            primary key,
    empresa                   int             default 1,
    codigo                    varchar(30),
    descricao                 varchar(128),
    coeficiente_multiplicacao decimal(20, 10),
    depreciacao               decimal(20, 10) default 0,
    tempo_ciclo               int,
    limite_ciclo              int,
    limite_parada             int,
    tempo_insercao            bigint          default 0,
    tempo_remocao             bigint          default 0,
    status_imp                varchar(1)
        check ([status_imp] = 'I' OR [status_imp] = 'U' OR [status_imp] = 'N')
)
go

create table importferramenta_id_table
(
    id int identity
        primary key
)
go

create table importferramentaproduto
(
    id                        int not null
        constraint importferramentaproduto_pkey
            primary key,
    empresa                   int             default 1,
    maquina                   varchar(30),
    produto                   varchar(30),
    derivacao                 varchar(30),
    codigo_operacao           varchar(30),
    descricao                 varchar(128),
    coeficiente_multiplicacao decimal(20, 10),
    depreciacao               decimal(20, 10) default 0,
    tempo_ciclo               int,
    limite_ciclo              int,
    limite_parada             int,
    tempo_insercao            int             default 0,
    tempo_remocao             bigint          default 0,
    tipo_cadastro             varchar(1)      default 'I'
        check ([tipo_cadastro] = 'I' OR [tipo_cadastro] = 'M'),
    situacao                  int             default 0,
    status_imp                varchar(1)
        check ([status_imp] = 'I' OR [status_imp] = 'U' OR [status_imp] = 'N')
)
go

create table importferramentaproduto_id_table
(
    id int identity
        primary key
)
go

create table importgrupomaquina
(
    id         int not null
        constraint importgrupomaquina_pkey
            primary key,
    nome       varchar(32),
    descricao  varchar(128),
    status_imp varchar(1)
        check ([status_imp] = 'I' OR [status_imp] = 'U' OR [status_imp] = 'N')
)
go

create table importgrupomaquina_id_table
(
    id int identity
        primary key
)
go

create table importmaquina
(
    id               int not null
        constraint importmaquina_pkey
            primary key,
    empresa          int             default 1,
    codigo           varchar(30),
    descricao        varchar(128),
    linear           bit             default 'false',
    grupo            varchar(32),
    ativa            bit             default 'false',
    fator_velocidade decimal(20, 10) default 1,
    status_imp       varchar(1)
        check ([status_imp] = 'I' OR [status_imp] = 'U' OR [status_imp] = 'N')
)
go

create table importmaquina_id_table
(
    id int identity
        primary key
)
go

create table importmotivoparada
(
    id         int not null
        constraint importmotivoparada_pkey
            primary key,
    empresa    int default 1,
    codigo     varchar(30),
    descricao  varchar(128),
    abreviacao varchar(16),
    senha      varchar(32),
    cor        varchar(1),
    programada bit default 'False',
    ativa      bit default 'True',
    setup      bit default 'False',
    status_imp varchar(1)
        check ([status_imp] = 'I' OR [status_imp] = 'U' OR [status_imp] = 'N')
)
go

create table importmotivoparada_id_table
(
    id int identity
        primary key
)
go

create table importmotivorefugo
(
    id         int not null
        constraint importmotivorefugo_pkey
            primary key,
    empresa    int default 1,
    codigo     varchar(30),
    descricao  varchar(128),
    qualidade  bit default 'False',
    status_imp varchar(1)
        check ([status_imp] = 'I' OR [status_imp] = 'U' OR [status_imp] = 'N')
)
go

create table importmotivorefugo_id_table
(
    id int identity
        primary key
)
go

create table importop
(
    id             int not null
        constraint importop_pkey
            primary key,
    empresa        int             default 1,
    origem         varchar(30)     default 0,
    codigo         varchar(30),
    descricao      varchar(128),
    produto        varchar(30),
    subproduto     varchar(30),
    derivacao      varchar(30),
    pedido         int             default 1,
    unidade_medida varchar(128)    default 'PC',
    nome_cliente   varchar(128)    default '',
    quantidade     decimal(20, 10) default 1,
    master_op      varchar(30),
    fracao_master  decimal(10, 9)  default 1,
    data_limite    datetime,
    prioridade     decimal(20, 10) default 1,
    situacao       varchar(1)
        check ([situacao] = 'L' OR [situacao] = 'F' OR [situacao] = 'C'),
    status_imp     varchar(1)
        check ([status_imp] = 'I' OR [status_imp] = 'U' OR [status_imp] = 'N')
)
go

create table importop_id_table
(
    id int identity
        primary key
)
go

create table importoperador
(
    id         int not null
        constraint importoperador_pkey
            primary key,
    empresa    int default 1,
    codigo     varchar(30),
    nome       varchar(128),
    ativo      bit default 'True',
    status_imp varchar(1)
        check ([status_imp] = 'I' OR [status_imp] = 'U' OR [status_imp] = 'N')
)
go

create table importoperador_id_table
(
    id int identity
        primary key
)
go

create table importproduto
(
    id         int not null
        constraint importproduto_pkey
            primary key,
    empresa    int default 1,
    codigo     varchar(30),
    descricao  varchar(128),
    status_imp varchar(1)
        check ([status_imp] = 'I' OR [status_imp] = 'U' OR [status_imp] = 'N')
)
go

create table importproduto_id_table
(
    id int identity
        primary key
)
go

create table importsequenciaproducao
(
    id                   int not null
        constraint importsequenciaproducao_pkey
            primary key,
    empresa              int         default 1,
    origem               varchar(30) default 0,
    codigo               varchar(30),
    sequencia            int,
    estagio              int,
    maquina              varchar(30),
    ferramenta           varchar(30),
    codigo_operacao      varchar(30),
    quantidade           decimal(20, 10),
    data_prevista_inicio datetime,
    data_prevista_fim    datetime,
    setup_previsto       bigint      default 0,
    tempo_previsto       bigint      default 0,
    taxa_de_conversao    int,
    unidade_medida       varchar(4),
    situacao             varchar(1),
        check ([situacao] = 'L' OR [situacao] = 'F' OR [situacao] = 'C')
        check ([situacao] = 'L' OR [situacao] = 'F' OR [situacao] = 'C'),
    status_imp           varchar(1)
        check ([status_imp] = 'I' OR [status_imp] = 'U' OR [status_imp] = 'N')
        check ([status_imp] = 'I' OR [status_imp] = 'U' OR [status_imp] = 'N')
    
)
go

create table importsequenciaproducao_id_table
(
    id int identity
        primary key
)
go

create table importsubproduto
(
    id         int not null
        constraint importsubproduto_pkey
            primary key,
    empresa    int default 1,
    codigo     varchar(30),
    descricao  varchar(128),
    status_imp varchar(1)
        check ([status_imp] = 'I' OR [status_imp] = 'U' OR [status_imp] = 'N')
)
go

create table importsubproduto_id_table
(
    id int identity
        primary key
)
go

create table importcomponentesimportados
(
    id             int not null
        constraint importcomponentesimportados_pkey
            primary key,
    empresa        int             default 1,
    codigo         varchar(30),
    op             varchar(30),
    master_op      varchar(30),
    origem         varchar(30)     default 0,
    estagio        int,
    maquina        varchar(30),
    operador       varchar(30),
    pedido         varchar(30),
    versao         varchar(5),
    descricao      varchar(128),
    dimensao       varchar(30),
    validade       varchar(5),
    data_fabricacao datetime,
    lote           varchar(30),
    componente_origem varchar(30),
    quantidade     decimal(20, 10) default 0,
    quantidade_estornada decimal(20, 10) default 0,
    peso           decimal(20, 10) default 0,
    taxa_de_conversao decimal(20, 10) default 1,
    tara           decimal(20, 10) default 0,
    volumes        int default 0,
    tipo           varchar(5) default 'P',
    unidade        varchar(5) default 'PC',
    codigo_etiqueta     varchar(30),
    tipo_etiqueta       varchar(30),
    lote_etiqueta       varchar(30),
    derivacao           varchar(30),
    uso varchar(5)
        check ([uso] = 'N' OR [uso] = 'P' OR [uso] = 'T' OR [uso] = 'F'),
    situacao       varchar(1)
        check ([situacao] = 'A' OR [situacao] = 'I'),
    reg        int default 0,
    controle   int default 0,
    status_imp     varchar(1)
        check ([status_imp] = 'I' OR [status_imp] = 'U' OR [status_imp] = 'N')
)
go

create table importcomponentesop
(
    id             int not null
        constraint importcomponentesop_pkey
            primary key,
    empresa        int             default 1,
    codigo         varchar(30),
    op             varchar(30),
    origem         varchar(30)     default 0,
    estagio        int,
    identificador  int default 0,
    maquina        varchar(30),
    codigo_componente    varchar(32),
    derivacao_componente varchar(32),
    tipo varchar(5),

    quantidade_prevista     decimal(20, 10) default 0,
    quantidade_reservada decimal(20, 10) default 0,
    reg        int default 0,
    status_imp     varchar(1)
        check ([status_imp] = 'I' OR [status_imp] = 'U' OR [status_imp] = 'N')
)
go