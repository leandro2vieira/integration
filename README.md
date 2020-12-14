![Vedois Tecnologia](http://vedois.com.br/site/wp-content/uploads/2018/04/logovedoispreto3.png)

Introdução sobre Integração
-------------------------------

A integração com o sistema da Vedois pode ser feito com N tecnologias, por exemplo:
Webservice, Tabela, View, CSV. A Vedois recomenda o uso de webservice ou tabela, pois possuem melhor performance/segurança.

A integração deve ser separada em duas etapas.
  * 1 - Importação ( Vedois <-- ERP )
  * 2 - Exportação ( Vedois --> ERP )
  
Abaixo segue os layouts necessários, basta expandir.
Além de ser possível baixar os scripts prontos com os creates tanto de import quanto export.


Importação
-------------------------------

<details>
 <summary>Ver Tabelas</summary>
 
 Sistema: **Vedois-OEE**  **Atualizado em:** 14/12/2020


 <details>
   <summary>Nome da Tabela = **IMPORTMAQUINA**</summary>
 Tabela responsável pelo cadastro dos centros de recurso.

 |Coluna|Tipo de dado|Tamanho|Obs|Descrição|
 |-------------|-------------|-------------|-------------|-------------|
 |**empresa**|	Integer|	|	default=1|Código da Empresa|
 |**codigo**|	Varchar|max_length=30||Código da máquina|
 |descricao|	Varchar|max_length=128||Descrição da máquina|
 |linear|	BooleanField|		|default=False|Define se a máquina é linear, se ativo, o sistema troca automaticamente tudo que é relacionado a ciclo, para medida linear, por exemplo metros.|
 |grupo|	Varchar|	max_length=32||Nome do grupo de máquinas, associando com a ImportGrupoMaquina|	
 |**ativa**|	BooleanField|		|default=False|Define se a máquina está ativa/inativa|
 |fator_velocidade|	DecimalField|	max_digits=20, decimal_places=10|	default=1| Define modo de velocidade, manter default = 1
 |status_imp|Varchar|	max_length=1|	'N'=new, 'U'=update, 'I'=integrated|Define status da linha, caso for importação por tabela.|

 </details>


 <details>
  <summary>Nome da Tabela = **IMPORTGRUPOMAQUINA**</summary>
 Tabela responsável por criar grupos de máquinas, para facilitar a consulta de duas ou mais máquinas em relatórios, índices, entre outros.

 |Coluna|Tipo de dado|Tamanho|Obs|Descrição|
 |-------------|-------------|-------------|-------------|-------------|
 |**nome**|	Varchar|	max_length=32		||Nome do grupo de máquinas|
 |descricao|	Varchar	|max_length=128		||Descrição completa do grupo|
 |status_imp|	Varchar	|max_length=1|	'N'=new, 'U'=update, 'I'=integrated|	Define status da linha, caso for importação por tabela.|

 </details>


 <details>
  <summary>Nome da Tabela = **IMPORTOPERADOR**</summary>
 Tabela responsável por cadastrar os operadores que irão utilizar os terminais.

 |Coluna|Tipo de dado|Tamanho|Obs|Descrição|
 |-------------|-------------|-------------|-------------|-------------|
 |**empresa**|	Integer		|default=1||	Código da empresa|
 |**codigo**|	Varchar|	max_length=30||		Código do operador|
 |**nome**|	Varchar	|max_length=128||		Nome do operador|
 |**ativo**|	BooleanField||		default=True|	Define ativo/inativo|
 |status_imp	|Varchar	|max_length=1|	'N'=new, 'U'=update, 'I'=integrated| Define status da linha, caso for importação por tabela.|
 
 </details>


 <details>
  <summary>Nome da Tabela = **IMPORTMOTIVOPARADA**</summary>
 Tabela responsável por cadastrar os motivos de parada de máquina, como por exemplo manutenção mecânica, elétrica, entre outros.

 |Coluna|Tipo de dado|Tamanho|Obs|Descrição|
 |-------------|-------------|-------------|-------------|-------------|
 |**empresa**	|Integer		|default=1||	Código da empresa|
 |**codigo**	|Varchar|	max_length=30||		Código da parada|
 |descricao	|Varchar	|max_length=128		||Descrição da parada|
 |abreviacao	|Varchar	|max_length=16|	blank=True	|Abreviação da parada|
 |senha|	Varchar	|max_length=32|	blank=True|	Se não tiver senha, manter vazio. Se usar algum valor, ele será solicitado para confirmar a parada. Muito usado para mecânicos/eletricistas, onde apenas estes profissionais podem inserir determinadas paradas.|
 |cor	|RGBColorField		||blank=True, null=True|	Exemplo: ‘#ffffff’ = branco|
 |programada	|BooleanField		||default=False|	Quando true, este motivo de parada irá descontar do tempo previsto de produção, influenciando diretamente na disponibilidade do centro de recurso.|
 |**ativa**	|BooleanField		||default=True  |Define ativo/inativo|
 |setup	|BooleanField		||default=False	|Define se é uma parada de setup|
 |status_imp	|Varchar	|max_length=1|	'N'=new, 'U'=update, 'I'=integrated	| Define status da linha, caso for importação por tabela.|
 
 </details>


 <details>
  <summary>Nome da Tabela = **IMPORTMOTIVOREFUGO**</summary>
 Tabela responsável por cadastrar os motivos de refugo/apara que acontecem durante o processo produtivo.
 |Coluna|Tipo de dado|Tamanho|Obs|Descrição|
 |-------------|-------------|-------------|-------------|-------------|
 ||||||
 ||||||
 ||||||
 
 </details>


 <details>
  <summary>Nome da Tabela = **IMPORTPRODUTO**</summary>
 São cadastrados os produtos, para posterior associar às ordens de produção.
 |Coluna|Tipo de dado|Tamanho|Obs|Descrição|
 |-------------|-------------|-------------|-------------|-------------|
 ||||||
 ||||||
 ||||||
 
 </details>


 <details>
  <summary>Nome da Tabela = **IMPORTSUBPRODUTO**</summary>
 Subproduto da tabela de produtos.
 |Coluna|Tipo de dado|Tamanho|Obs|Descrição|
 |-------------|-------------|-------------|-------------|-------------|
 ||||||
 ||||||
 ||||||
 
  </details>


 <details>
  <summary>Nome da Tabela = **IMPORTFERRAMENTA**</summary>
 Ferramentas definem quanto deve-se incrementar a cada pulso de máquina. Utilizando uma injetora como exemplo, uma ferramenta seria o molde. Pois determinado
 molde, produz N peças a cada ciclo, com um tempo estimado de 30 segundos por exemplo.
 Para maquinas lineares, na maioria das vezes essa tabela não é utilizada na importação.
 |Coluna|Tipo de dado|Tamanho|Obs|Descrição|
 |-------------|-------------|-------------|-------------|-------------|
 ||||||
 ||||||
 ||||||
 
 </details>


 <details>
  <summary>Nome da Tabela = **IMPORTFERRAMENTAPRODUTO**</summary>
 Esta tabela é usada quando não há ImportFerramenta. A diferenciação das tabelas é que uma associa por códigos, esta utiliza cinco campos (empresa, maquina, produto,
 derivação e codigo_operacao).
 Com isso é possível aumentar o nível de detalhe em relação a tempo de ciclo. Pois pode-se ter um produto que é produzido com tempo X em uma máquina e tempo Y em
 outra.
 |Coluna|Tipo de dado|Tamanho|Obs|Descrição|
 |-------------|-------------|-------------|-------------|-------------|
 ||||||
 ||||||
 ||||||
 
 </details>


 <details>
  <summary>Nome da Tabela = **IMPORTOP**</summary>
 Tabela responsável pelas ordens de produção.
 |Coluna|Tipo de dado|Tamanho|Obs|Descrição|
 |-------------|-------------|-------------|-------------|-------------|
 ||||||
 ||||||
 ||||||
 
 </details>


 <details>
  <summary>Nome da Tabela = **IMPORTSEQUENCIAPRODUCAO**</summary>
 Tabela responsável por concentrar as sequencias de produção, também conhecidas como roteiros, atividades, entre outros.

 |Coluna|Tipo de dado|Tamanho|Obs|Descrição|
 |-------------|-------------|-------------|-------------|-------------|
 ||||||
 ||||||
 ||||||
 
 </details>


 <details>
  <summary>Nome da Tabela = **IMPORTCOMPONENTESIMPORTADOS**</summary>
 Tabela responsável por cadastrar os componentes que não são gerados pelo terminal, por exemplo a compra de bobinas de terceiros, etc.

 |Coluna|Tipo de dado|Tamanho|Obs|Descrição|
 |-------------|-------------|-------------|-------------|-------------|
 ||||||
 ||||||
 ||||||
 
 </details>


 <details>
  <summary>Nome da Tabela = **IMPORTCOMPONENTESOP**</summary>
 Tabela responsável por autorizar os produtos que podem ser consumidos em determinadas Ordens

 |Coluna|Tipo de dado|Tamanho|Obs|Descrição|
 |-------------|-------------|-------------|-------------|-------------|
 ||||||
 ||||||
 ||||||
 
 </details>
</details>












Exportação
-------------------------------

<details>
  <summary>Clique para expandir</summary>
  
teste

</details>
