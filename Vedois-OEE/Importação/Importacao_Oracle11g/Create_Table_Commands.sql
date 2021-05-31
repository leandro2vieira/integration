create table importferramenta
(
    id                        number(10) not null
        constraint importferramenta_pkey
            primary key,
    empresa                   number(10)             default 1,
    codigo                    varchar2(30),
    descricao                 varchar2(128),
    coeficiente_multiplicacao number(20, 10),
    depreciacao               number(20, 10) default 0,
    tempo_ciclo               number(10),
    limite_ciclo              number(10),
    limite_parada             number(10),
    tempo_insercao            number(19)          default 0,
    tempo_remocao             number(19)          default 0,
    status_imp                varchar2(1)
        check (status_imp = 'I' OR status_imp = 'U' OR status_imp = 'N' OR status_imp = 'E')
);

create table importferramenta_id
(
    id number(10) 
        primary key
);

-- Generate ID using sequence and trigger
create sequence importferramenta_id_seq start with 1 increment by 1;

create or replace trigger importferramenta_id_seq_tr
 before insert on importferramenta_id for each row
 when (new.id is null)
begin
 select importferramenta_id_seq.nextval into :new.id from dual;
end;
/



create table importferramentaproduto
(
    id                        number(10) not null
        constraint importferramentaproduto_pkey
            primary key,
    empresa                   number(10)             default 1,
    maquina                   varchar2(30),
    produto                   varchar2(30),
    derivacao                 varchar2(30),
    codigo_operacao           varchar2(30),
    descricao                 varchar2(128),
    coeficiente_multiplicacao number(20, 10),
    depreciacao               number(20, 10) default 0,
    tempo_ciclo               number(10),
    limite_ciclo              number(10),
    limite_parada             number(10),
    tempo_insercao            number(10)             default 0,
    tempo_remocao             number(19)          default 0,
    tipo_cadastro             varchar2(1)      default 'I'
        check (tipo_cadastro = 'I' OR tipo_cadastro = 'M'),
    situacao                  number(10)             default 0,
    status_imp                varchar2(1)
        check (status_imp = 'I' OR status_imp = 'U' OR status_imp = 'N' OR status_imp = 'E')
);

create table importferramentaprodutoid
(
    id number(10) 
        primary key
);

-- Generate ID using sequence and trigger
create sequence importferramentaprodutoidseq start with 1 increment by 1;

create or replace trigger importferramentaprodutoidseqtr
 before insert on importferramentaprodutoid for each row
 when (new.id is null)
begin
 select importferramentaprodutoidseq.nextval into :new.id from dual;
end;
/



create table importgrupomaquina
(
    id         number(10) not null
        constraint importgrupomaquina_pkey
            primary key,
    nome       varchar2(32),
    descricao  varchar2(128),
    status_imp varchar2(1)
        check (status_imp = 'I' OR status_imp = 'U' OR status_imp = 'N' OR status_imp = 'E')
);

create table importgrupomaquina_id
(
    id number(10) 
        primary key
);

-- Generate ID using sequence and trigger
create sequence importgrupomaquina_id_seq start with 1 increment by 1;

create or replace trigger importgrupomaquina_id_seq_tr
 before insert on importgrupomaquina_id for each row
 when (new.id is null)
begin
 select importgrupomaquina_id_seq.nextval into :new.id from dual;
end;
/



create table importmaquina
(
    id               number(10) not null
        constraint importmaquina_pkey
            primary key,
    empresa          number(10)default 1,
    codigo           varchar2(30),
    descricao        varchar2(128),
    linear           varchar2(5) default 'False',
    grupo            varchar2(32),
    ativa            varchar2(5) default 'True',
    fatorvelocidade number(1) default 1,
    status_imp       varchar2(1)
        check (status_imp = 'I' OR status_imp = 'U' OR status_imp = 'N' OR status_imp = 'E')
);

create table importmaquina_id_table
(
    id number(10) 
        primary key
);

-- Generate ID using sequence and trigger
create sequence importmaquina_id_table_seq start with 1 increment by 1;

create or replace trigger importmaquina_id_table_seq_tr
 before insert on importmaquina_id_table for each row
 when (new.id is null)
begin
 select importmaquina_id_table_seq.nextval into :new.id from dual;
end;
/


create table importmotivoparada
(
    id         number(10) not null
        constraint importmotivoparada_pkey
            primary key,
    empresa    number(10) default 1,
    codigo     varchar2(30),
    descricao  varchar2(128),
    abreviacao varchar2(16),
    senha      varchar2(32),
    cor        varchar2(1),
    programada varchar2(1) default '0',
    ativa      varchar2(1) default '1',
    setup      varchar2(1) default '0',
    status_imp varchar2(1)
        check (status_imp = 'I' OR status_imp = 'U' OR status_imp = 'N' OR status_imp = 'E')
);

create table importmotivoparada_id
(
    id number(10) 
        primary key
);

-- Generate ID using sequence and trigger
create sequence importmotivoparada_id_seq start with 1 increment by 1;

create or replace trigger importmotivoparada_id_seq_tr
 before insert on importmotivoparada_id for each row
 when (new.id is null)
begin
 select importmotivoparada_id_seq.nextval into :new.id from dual;
end;
/


create table importmotivorefugo
(
    id         number(10) not null
        constraint importmotivorefugo_pkey
            primary key,
    empresa    number(10) default 1,
    codigo     varchar2(30),
    descricao  varchar2(128),
    qualidade  varchar2(1) default '0',
    status_imp varchar2(1)
        check (status_imp = 'I' OR status_imp = 'U' OR status_imp = 'N' OR status_imp = 'E')
);

create table importmotivorefugo_id
(
    id number(10)
        primary key
);

-- Generate ID using sequence and trigger
create sequence importmotivorefugo_id_seq start with 1 increment by 1;

create or replace trigger importmotivorefugo_id_seq_tr
 before insert on importmotivorefugo_id for each row
 when (new.id is null)
begin
 select importmotivorefugo_id_seq.nextval into :new.id from dual;
end;
/


create table importop
(
    id             number(10) not null
        constraint importop_pkey
            primary key,
    empresa        number(10)             default 1,
    origem         varchar2(30)     default 0,
    codigo         varchar2(30),
    descricao      varchar2(128),
    produto        varchar2(30),
    subproduto     varchar2(30),
    derivacao      varchar2(30),
    pedido         number(10)             default 1,
    unidade_medida varchar2(128)    default 'PC',
    nome_cliente   varchar2(128)    default '',
    quantidade     number(20, 10) default 1,
    master_op      varchar2(30),
    fracao_master  number(10, 9)  default 1,
    data_limite    timestamp(3),
    prioridade     number(20, 10) default 1,
    situacao       varchar2(1)
        check (situacao = 'L' OR situacao = 'F' OR situacao = 'C'),
    status_imp     varchar2(1)
        check (status_imp = 'I' OR status_imp = 'U' OR status_imp = 'N' OR status_imp = 'E')
);

create table importop_id_table
(
    id number(10) 
        primary key
);

-- Generate ID using sequence and trigger
create sequence importop_id_table_seq start with 1 increment by 1;

create or replace trigger importop_id_table_seq_tr
 before insert on importop_id_table for each row
 when (new.id is null)
begin
 select importop_id_table_seq.nextval into :new.id from dual;
end;
/


create table importoperador
(
    id         number(10) not null
        constraint importoperador_pkey
            primary key,
    empresa    number(10) default 1,
    codigo     varchar2(30),
    nome       varchar2(128),
    ativo      number(1) default '1',
    status_imp varchar2(1)
        check (status_imp = 'I' OR status_imp = 'U' OR status_imp = 'N' OR status_imp = 'E')
);


create table importoperador_id_table
(
    id number(10) 
        primary key
);

-- Generate ID using sequence and trigger
create sequence importoperador_id_table_seq start with 1 increment by 1;

create or replace trigger importoperador_id_table_seq_tr
 before insert on importoperador_id_table for each row
 when (new.id is null)
begin
 select importoperador_id_table_seq.nextval into :new.id from dual;
end;
/


create table importproduto
(
    id         number(10) not null
        constraint importproduto_pkey
            primary key,
    empresa    number(10) default 1,
    codigo     varchar2(30),
    descricao  varchar2(128),
    status_imp varchar2(1)
        check (status_imp = 'I' OR status_imp = 'U' OR status_imp = 'N' OR status_imp = 'E')
);

create table importproduto_id_table
(
    id number(10) 
        primary key
);

-- Generate ID using sequence and trigger
create sequence importproduto_id_table_seq start with 1 increment by 1;

create or replace trigger importproduto_id_table_seq_tr
 before insert on importproduto_id_table for each row
 when (new.id is null)
begin
 select importproduto_id_table_seq.nextval into :new.id from dual;
end;
/


create table importsequenciaproducao
(
    id                   number(10) not null
        constraint importsequenciaproducao_pkey
            primary key,
    empresa              number(10)         default 1,
    origem               varchar2(30) default 0,
    codigo               varchar2(30),
    sequencia            number(10),
    estagio              number(10),
    maquina              varchar2(30),
    ferramenta           varchar2(30),
    codigo_operacao      varchar2(30),
    quantidade           number(20, 10),
    data_prevista_inicio timestamp(3),
    data_prevista_fim    timestamp(3),
    setup_previsto       number(19)      default 0,
    tempo_previsto       number(19)      default 0,
    taxa_de_conversao    number(10),
    unidade_medida       varchar2(4),
    situacao             varchar2(1),
        check (situacao = 'L' OR situacao = 'F' OR situacao = 'C'),
    status_imp           varchar2(1)
        check (status_imp = 'I' OR status_imp = 'U' OR status_imp = 'N' OR status_imp = 'E')

);

create table importsequenciaproducaoid
(
    id number(10)
        primary key
);

-- Generate ID using sequence and trigger
create sequence importsequenciaproducaoidseq start with 1 increment by 1;

create or replace trigger importsequenciaproducaoidseqtr
 before insert on importsequenciaproducaoid for each row
 when (new.id is null)
begin
 select importsequenciaproducaoidseq.nextval into :new.id from dual;
end;
/


create table importsubproduto
(
    id         number(10) not null
        constraint importsubproduto_pkey
            primary key,
    empresa    number(10) default 1,
    codigo     varchar2(30),
    descricao  varchar2(128),
    status_imp varchar2(1)
        check (status_imp = 'I' OR status_imp = 'U' OR status_imp = 'N' OR status_imp = 'E')
);

create table importsubproduto_id
(
    id number(10) 
        primary key
);

-- Generate ID using sequence and trigger
create sequence importsubproduto_id_seq start with 1 increment by 1;

create or replace trigger importsubproduto_id_seq_tr
 before insert on importsubproduto_id for each row
 when (new.id is null)
begin
 select importsubproduto_id_seq.nextval into :new.id from dual;
end;
/

create table importcomponentesimportados
(
    id             number(10) not null
        constraint importcomponentesimportados_pkey
            primary key,
    empresa        number(10)             default 1,
    codigo         varchar2(30),
    op             varchar2(30),
    master_op      varchar2(30),
    origem         varchar2(30)     default 0,
    estagio        number(10),
    maquina        varchar2(30),
    operador       varchar2(30),
    pedido         varchar2(30),
    versao         varchar2(5),
    descricao      varchar2(128),
    dimensao       varchar2(30),
    validade       varchar2(5),
    data_fabricacao datetime,
    lote           varchar2(30),
    componente_origem varchar2(30),
    quantidade     number(20, 10) default 0,
    quantidade_estornada number(20, 10) default 0,
    peso           number(20, 10) default 0,
    taxa_de_conversao number(20, 10) default 1,
    tara           number(20, 10) default 0,
    volumes        number(10) default 0,
    tipo           varchar2(5) default 'P',
    unidade        varchar2(5) default 'PC',
    codigo_etiqueta     varchar2(30),
    tipo_etiqueta       varchar2(30),
    lote_etiqueta       varchar2(30),
    derivacao           varchar2(30),
    uso varchar2(5)
        check ([uso] = 'N' OR [uso] = 'P' OR [uso] = 'T' OR [uso] = 'F'),
    situacao       varchar2(1)
        check ([situacao] = 'A' OR [situacao] = 'I'),
    reg        number(10) default 0,
    controle   number(10) default 0,
    status_imp     varchar2(1)
        check ([status_imp] = 'I' OR [status_imp] = 'U' OR [status_imp] = 'N')
)

create table importcomponentesimportados_id
(
    id number(10) 
        primary key
);

-- Generate ID using sequence and trigger
create sequence importcomponentesimportados_id_seq start with 1 increment by 1;

create or replace trigger importcomponentesimportados_id_seq_tr
 before insert on importcomponentesimportados_id for each row
 when (new.id is null)
begin
 select importcomponentesimportados_id_seq.nextval into :new.id from dual;
end;
/

create table importcomponentesop
(
    id             number(10) not null
        constraint importcomponentesop_pkey
            primary key,
    empresa        number(10)             default 1,
    codigo         varchar2(30),
    op             varchar2(30),
    origem         varchar2(30)     default 0,
    estagio        number(10),
    identificador  number(10) default 0,
    maquina        varchar2(30),
    codigo_componente    varchar2(32),
    derivacao_componente varchar2(32),
    tipo varchar2(5),

    quantidade_prevista     number(20, 10) default 0,
    quantidade_reservada number(20, 10) default 0,
    reg        number(10) default 0,
    status_imp     varchar2(1)
        check ([status_imp] = 'I' OR [status_imp] = 'U' OR [status_imp] = 'N')
)

create table importcomponentesop_id
(
    id number(10) 
        primary key
);

-- Generate ID using sequence and trigger
create sequence importcomponentesop_id_seq start with 1 increment by 1;

create or replace trigger importcomponentesop_id_seq_tr
 before insert on importcomponentesop_id for each row
 when (new.id is null)
begin
 select importcomponentesop_id_seq.nextval into :new.id from dual;
end;
/
