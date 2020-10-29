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
  <summary>Clique para expandir</summary>
 
  
Nome da Tabela = **IMPORTMAQUINA**

Tabela responsável pelo cadastro dos centros de recurso.

|Coluna|Tipo de dado|Tamanho|Obs|Descrição|
|-------------|-------------|-------------|-------------|-------------|
|**id**|	Integer|		|Precisa ser sequencial| Identificação |
|**empresa**|	Integer|	|	default=1|Código da Empresa|
|**codigo**|	Varchar|max_length=30||Código da máquina|
|descricao|	Varchar|max_length=128||Descrição da máquina|
|linear|	BooleanField|		|default=False|Define se a máquina é linear, se ativo, o sistema troca automaticamente tudo que é relacionado a ciclo, para medida linear, por exemplo metros.|
|grupo|	Varchar|	max_length=32||Nome do grupo de máquinas, associando com a ImportGrupoMaquina|	
|**ativa**|	BooleanField|		|default=False|Define se a máquina está ativa/inativa|
|fator_velocidade|	DecimalField|	max_digits=20, decimal_places=10|	default=1| Define modo de velocidade, manter default = 1
|status_imp|Varchar|	max_length=1|	'N'=new, 'U'=update, 'I'=integrated|Define status da linha

Nome da Tabela = **IMPORTGRUPOMAQUINA**

Tabela responsável por criar grupos de máquinas, para facilitar a consulta de duas ou mais máquinas em relatórios, índices, entre outros.

|Coluna|Tipo de dado|Tamanho|Obs|Descrição|
|-------------|-------------|-------------|-------------|-------------|
|**id**|	|Integer|	|	Precisa ser sequencial|Identificação|
|**nome**|	Varchar|	max_length=32		||Nome do grupo de máquinas|
|descricao|	Varchar	|max_length=128		||Descrição completa do grupo|
|status_imp|	Varchar	|max_length=1|	'N'=new, 'U'=update, 'I'=integrated|	Define status da linha|

Nome da Tabela = **IMPORTOPERADOR**

Tabela responsável por cadastrar os operadores que irão utilizar os terminais.

|Coluna|Tipo de dado|Tamanho|Obs|Descrição|
|-------------|-------------|-------------|-------------|-------------|
|**id**|	Integer		|||Precisa ser sequencial| Identificação|
|**empresa**|	Integer		|default=1||	Código da empresa|
|**codigo**|	Varchar|	max_length=30||		Código do operador|
|**nome**|	Varchar	|max_length=128||		Nome do operador|
|**ativo**|	BooleanField||		default=True|	Define ativo/inativo|
|status_imp	|Varchar	|max_length=1|	'N'=new, 'U'=update, 'I'=integrated|	Define status da linha|

Nome da Tabela = **IMPORTMOTIVOPARADA**

Tabela responsável por cadastrar os motivos de parada de máquina, como por exemplo manutenção mecânica, elétrica, entre outros.

|Coluna|Tipo de dado|Tamanho|Obs|Descrição|
|-------------|-------------|-------------|-------------|-------------|
|**id**|	Integer		||Precisa ser sequencial|	Identificação|
|**empresa**	|Integer		|default=1||	Código da empresa|
|**codigo**	|Varchar|	max_length=30||		Código da parada|
|descricao	|Varchar	|max_length=128		||Descrição da parada|
|abreviacao	|Varchar	|max_length=16|	blank=True	|Abreviação da parada|
|senha|	Varchar	|max_length=32|	blank=True|	Se não tiver senha, manter vazio. Se usar algum valor, ele será solicitado para confirmar a parada. Muito usado para mecânicos/eletricistas, onde apenas estes profissionais podem inserir determinadas paradas.|
|cor	|RGBColorField		||blank=True, null=True|	Exemplo: ‘#ffffff’ = branco|
|programada	|BooleanField		||default=False|	Quando true, este motivo de parada irá descontar do tempo previsto de produção, influenciando diretamente na disponibilidade do centro de recurso.|
|**ativa**	|BooleanField		||default=True  |Define ativo/inativo|
|setup	|BooleanField		||default=False	|Define se é uma parada de setup|
|status_imp	|Varchar	|max_length=1|	'N'=new, 'U'=update, 'I'=integrated	|Define status da linha|







</details>












Exportação
-------------------------------

<details>
  <summary>Clique para expandir</summary>
  
teste

</details>
