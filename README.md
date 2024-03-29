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


1 - Importação
-------------------------------

<details>
 <summary>Ver Tabelas</summary>
 
 **Sistema: Vedois-OEE** <br>
 **Atualizado em: 22/12/2020**


 
   <summary>Nome da Tabela = IMPORTMAQUINA </summary>
	<h4>Tabela responsável pelo cadastro dos centros de recurso.</h4>

 |Coluna|Tipo de dado|Tamanho|Obs|Descrição|
 |-------------|-------------|-------------|-------------|-------------|
 | **empresa** | Integer |  | default=1 | Código da Empresa |
 | **codigo** |	Varchar | max_length=30 |  | Código da máquina |
 | descricao | Varchar | max_length=128 |  | Descrição da máquina |
 | grupo | Varchar | max_length=32 |  | Nome do grupo de máquinas, associando com a ImportGrupoMaquina |	
 | ativa |	BooleanField |		|default=False|Define se a máquina está ativa/inativa|
 | status_imp | Varchar | max_length=1 | 'N'=new, 'U'=update, 'I'=integrated | Define status da linha, caso for importação por tabela. |



  <summary>Nome da Tabela = IMPORTGRUPOMAQUINA </summary>
 <h4>Tabela responsável por criar grupos de máquinas, para facilitar a consulta de duas ou mais máquinas em relatórios, índices, entre outros.</h4>

 |Coluna|Tipo de dado|Tamanho|Obs|Descrição|
 |-------------|-------------|-------------|-------------|-------------|
 | **nome** | Varchar | max_length=32 |  | Nome do grupo de máquinas |
 | descricao | Varchar | max_length=128 |  | Descrição completa do grupo |
 | status_imp | Varchar | max_length=1 | 'N'=new, 'U'=update, 'I'=integrated | Define status da linha, caso for importação por tabela. |





  <summary>Nome da Tabela = IMPORTOPERADOR</summary>
	<h4>Tabela responsável por cadastrar os operadores que irão utilizar os terminais.</h4>

 |Coluna        |Tipo de dado   |Tamanho         |Obs		                     |Descrição    |
 |--------------|---------------|----------------|-----------------------------------|-------------|
 | **empresa**	| Integer 	| default=1 	 |  					| Código da empresa |
 | **codigo**	| Varchar 	| max_length=30	 |  				| Código do operador |
 | nome 	| Varchar 	| max_length=128 |  				| Nome do operador |
 | ativo 	| BooleanField 	|  		 | default=True 		| Define ativo/inativo |
 | status_imp 	| Varchar	| max_length=1 	 | 'N'=new,<br>'U'=update,<br>'I'=integrated | Define status da linha, caso for importação por tabela.|
 




  <summary>Nome da Tabela = IMPORTMOTIVOPARADA </summary>
 <h4>Tabela responsável por cadastrar os motivos de parada de máquina, como por exemplo manutenção mecânica, elétrica, entre outros.</h4>

 |Coluna        |Tipo de dado   |Tamanho         |Obs		                     |Descrição    |
 |--------------|---------------|----------------|-----------------------------------|-------------|
 | **empresa**	|Integer	|default=1       |                                   |Código da empresa|
 | **codigo**	|Varchar        |max_length=30	 |                                   |Código da parada|
 | descricao	|Varchar	|max_length=128  |                                   |Descrição da parada|
 | abreviacao	|Varchar	|max_length=16   |blank=True                         |Abreviação da parada|
 | senha        |Varchar	|max_length=32   |blank=True                         |Se não tiver senha, manter vazio. Se usar algum valor, ele será solicitado para confirmar a parada. Muito usado para mecânicos/eletricistas, onde apenas estes profissionais podem inserir determinadas paradas.|
 | cor	        |RGBColorField	|		 |blank=True,<br> null=True              |Exemplo: ‘#ffffff’ = branco|
 | **ativa**	|BooleanField	|		 |default=True                       |Define ativo/inativo|
 | status_imp	|Varchar	|max_length=1    |'N'=new,<br>'U'=update,<br>'I'=integrated|Define status da linha, caso for importação por tabela.|
 



 <summary>Nome da Tabela = IMPORTMOTIVOREFUGO</summary>
<h4>Tabela responsável por cadastrar os motivos de refugo/apara que acontecem durante o processo produtivo.</h4>
	
|Coluna         |Tipo de dado  |Tamanho         |Obs		                     |Descrição    |
|---------------|--------------|----------------|------------------------------------|-------------|
|**empresa**        |Integer       |		|default=1			     |Código da empresa|
|**codigo**		|Varchar       |max_length=30	|				     |Código do refugo|
|descricao	|Varchar       |max_length=128	|				     |Descrição do refugo|
|status_imp	|Varchar       |max_length=1	|'N'=new,<br>'U'=update,<br>'I'=integrated  |Define status da linha, caso for importação por tabela.|
 



 <summary>Nome da Tabela = IMPORTPRODUTO</summary>
<h4>São cadastrados os produtos, para posterior associar às ordens de produção.</h4>
 
|Coluna         |Tipo de dado  |Tamanho         |Obs		                     |Descrição    |
|---------------|--------------|----------------|------------------------------------|-------------|
|**empresa**	|Integer       |		|default=1				|Código da empresa|
|**codigo**		|Varchar       |max_length=30	|					|Código do produto|
|descricao	|Varchar       |max_length=128	|					|Descrição do produto|
|status_imp	|Varchar       |max_length=1	|'N'=new,<br>'U'=update,<br>'I'=integrated	|Define status da linha, caso for importação por tabela.|
 


<summary>Nome da Tabela = IMPORTFERRAMENTA</summary>
<h4>Ferramentas definem quanto deve-se incrementar a cada pulso de máquina. Utilizando uma injetora como exemplo, uma ferramenta seria o molde. Pois determinado
molde, produz N peças a cada ciclo, com um tempo estimado de 30 segundos por exemplo.
Para maquinas lineares, na maioria das vezes essa tabela não é utilizada na importação.</h4>
 
|Coluna                   |Tipo de dado |Tamanho           		|Obs		                    |Descrição    |
|-------------------------|-------------|-------------------------------|-----------------------------------|-------------|
|**empresa**		  |Integer	|				|				    |Código da empresa|
|**codigo**			  |Varchar	|max_length=30			|				    |Código da ferramenta|
|descricao		  |Varchar	|max_length=128			|				    |Descrição da ferramenta|
|coeficiente_multiplicacao|DecimalField	|max_digits=20,<br>decimal_places=10|				    |Número de peças incrementadas à cada ciclo de máquina. Por exemplo número de cavidades quando for injetora.|
|depreciacao		  |DecimalField |max_digits=20,<br>decimal_places=10|				    |O valor padrão é 0. Quando se tem um molde que uma cavidade está danificada, deve-se enviar a quantidade danificada nesta coluna.|
|**tempo_ciclo**		  |Integer	|				|				    |Define tempo padrão da ferramenta, ou seja, ciclo padrão. O valor é milissegundo. 10 segundos = 10.000|
|limite_ciclo		  |Integer	|				|				    |Este limite da uma “tolerância” ao tempo normal de ciclo, como no exemplo acima usei o valor 10.000. Se eu quiser dar 30 segundos de tolerância, utilizo o valor 40.000.|
|limite_parada		  |Integer	|				|				    |Este campo substitui o tempo_ciclo quando usado um modo exclusivo para usinagem, geralmente Tornos CNC.|
|status_imp		  |Varchar	|max_length=1			|'N'=new,<br>'U'=update,<br>'I'=integrated|Define status da linha, caso for importação por tabela.|


  <summary>Nome da Tabela = IMPORTFERRAMENTAPRODUTO</summary>
 <h4>Esta tabela é usada quando não há ImportFerramenta. A diferenciação das tabelas é que uma associa por códigos, esta utiliza cinco campos (empresa, maquina, produto,
 derivação e codigo_operacao).
 Com isso é possível aumentar o nível de detalhe em relação a tempo de ciclo. Pois pode-se ter um produto que é produzido com tempo X em uma máquina e tempo Y em
 outra.</h4>


|Coluna                   |Tipo de dado |Tamanho           		|Obs		                    |Descrição    |
|-------------------------|-------------|-------------------------------|-----------------------------------|-------------|
|**empresa**		  |Integer	|				|default=1			    		|Código da empresa|
|**maquina**		  |Varchar	|max_length=30			|				    		|Código de maquina|
|**produto**		  |Varchar	|max_length=30			|				    		|Código de produto|
|**derivacao**		  |Varchar	|max_length=30			|				    		|Derivação do produto|
|**codigo_operacao**	  |Varchar	|max_length=30			|				    		|Código da operação|
|**descricao**		  |Varchar	|max_length=128			|				    		|Descrição da Ferramenta|
|**coeficiente_multiplicacao**|DecimalField	|max_digits=20,<br>decimal_places=10|				    		|Número de peças incrementadas à cada ciclo de máquina.Por exemplo número de cavidades quando for injetora.|
|depreciacao		  |DecimalField	|max_digits=20,<br>decimal_places=10|default = 0			    	|O valor padrão é 0. Quando se tem um molde que uma cavidade está danificada, deve-se enviar a quantidade danificada nesta coluna.|
|**tempo_ciclo**		  |Integer	|				|				    		|Define tempo padrão da ferramenta, ou seja, ciclo padrão.O valor é milissegundo. 10 segundos = 10.000|
|**limite_ciclo**		  |Integer	|				|				   		|Este limite da uma “tolerância” ao tempo normal de ciclo,como no exemplo acima usei o valor 10.000. Se eu quiser dar 30 segundos de tolerância, utilizo o valor 40.000.|
|limite_parada		  |Integer	|				|				   		|Este campo substitui o tempo_ciclo quando usado um modo exclusivo para usinagem, geralmente Tornos CNC.|
|**situacao**		  |Integer	|				|default=0			    		||
|status_imp		  |Varchar	|max_length=1			|'N'=new,<br>'U'=update,<br>'I'=integrated	|Define status da linha, caso for importação por tabela.|


 <summary>Nome da Tabela = IMPORTOP</summary>
<h4>Tabela responsável pelas ordens de produção.</h4>

|Coluna         |Tipo de dado   |Tamanho         		|Obs		                     |Descrição    |
|---------------|---------------|-------------------------------|------------------------------------|-------------|
|**empresa**	|Integer	|				    |default=1			     		|Código da empresa|
|**origem**		|Varchar	|max_length=30			    |default='0'			     	|Código da origem|
|**codigo**		|Varchar	|max_length=30			    |				     		|Código da ordem|
|descricao	|Varchar	|max_length=128			    |blank=True,<br> null=True		     	|Descrição da ordem|
|**produto**	|Varchar	|max_length=30			    |blank=True,<br> null=True		     	|Código do produto|
|derivacao	|Varchar	|max_length=30			    |blank=True,<br> null=True		     	|Derivação do produto|
|pedido		|Integer	|				    |default=1,<br>blank=True,<br> null=True    |Número do pedido|
|unidade_medida |Varchar	|max_length=128			    |default="PC",<br>blank=True,<br>null=True  |Unidade de medida, ex: pc, metros|
|nome_cliente	|Varchar	|max_length=128			    |default="", <br>blank=True, null=True   	|Nome do cliente|
|quantidade	|DecimalField	|max_digits=20,<br>decimal_places=10|default=1			     		|Quantidade prevista da ordem|
|master_op	|Varchar	|max_length=30			    |null=True,<br> blank=True		     	|A coluna master_op é usada para realizar agrupamento de ordens de produção. Esta necessidade é quando a máquina produz mais de um produto ao mesmo tempo.|
|fracao_master	|DecimalField	|max_digits=10,<br>decimal_places=9 |default=1			     		|E a fracao_master irá determinar o percentual de produção que deve ser distribuído entre as OPs do agrupamento. Se por exemplo eu tenho um ciclo que sai 10 unidades, e eu queira distribuir 4 para uma ordem e 6 para outra, devo utilizar os valores: 0,4 e 0,6 respectivamente.|
|data_limite	|DateTimeField	|				    |null=True,<br> blank=True		     	|Data limite e prioridade são preferencias para|
|prioridade	|DecimalField	|max_digits=20,<br>decimal_places=10|default=1			     		|distribuição das ordens no modulo planejamento.|
|status_imp	|Varchar	|max_length=1			    |'N'=new,<br> 'U'=update,<br> 'I'=integrated|Define status da linha, caso for importação por tabela.|


 <summary>Nome da Tabela = IMPORTSEQUENCIAPRODUCAO</summary>
<h4>Tabela responsável por concentrar as sequencias de produção, também conhecidas como roteiros, atividades, entre outros.</h4>

|Coluna         |Tipo de dado  |Tamanho         |Obs		                     |Descrição    |
|---------------|--------------|----------------|------------------------------------|-------------|
|**empresa**	     |Integer	|		|default=1				|Código da empresa|
|**origem**		     |Varchar	|max_length=30	|default='0'				|Código da origem|
|**codigo**		     |Varchar	|max_length=30	|					|Código da Ordem|
|**sequencia**	     |Integer	|		|					|Sequência do Roteiro|
|**estagio**	     |Integer	|		|					|Codigo do estagio|
|**maquina**	     |Varchar	|max_length=30	|blank=True,<br> null=True		|Codigo da maquina|
|ferramenta	     |Varchar	|max_length=30	|blank=True,<br> null=True		|Codigo da ferramenta|
|codigo_operacao     |Varchar	|max_length=30	|blank=True,<br> null=True		|Código da operacao|
|quantidade	     |DecimalField|max_digits=20,<br>decimal_places=10|			|Quantidade prevista|
|taxa_de_conversao   |Integer   |               |			                |taxa de conversão usado para caso a unidade de medida seja M².|
|unidade_medida	     |Varchar|max_digits=128,<br>default="PC"|blank=True, null=True	|Unidade de medida da sequencia, Exemplo: PC(peça), M² (metro quadrado)|
|data_prevista_inicio|DateTimeField|		|blank=True,<br> null=True		|Data prevista de inicio|
|data_prevista_fim   |DateTimeField|		|blank=True,<br> null=True		|Data prevista de termino|
|setup_previsto	     |BigInteger|		|default=0				|Tempo de setup em segundos|
|tempo_previsto	     |BigInteger|		|default=0				|Tempo de produção em segundos|
|status_imp	     |Varchar|max_length=1	|'N'=new,<br>'U'=update,<br>'I'=integrated|Define status da linha, caso for importação por tabela.|


<details>
 <summary>Consumo de Componente</summary>

<summary>Nome da Tabela = IMPORTCOMPONENTESIMPORTADOS</summary>
<h4>Tabela responsável por cadastrar os componentes que não são gerados pelo terminal, por exemplo a compra de bobinas de terceiros, etc.</h4>

|Coluna         |Tipo de dado   |Tamanho        |Obs		                     		|Descrição    |
|---------------|---------------|---------------|-----------------------------------------------|-------------|
|codigo		|Varchar	|max_length=30  |						|Código do componente|
|derivacao	|Varchar	|max_length=30  |						|Código da Derivação do Componente|
|lote		|Varchar	|max_length=30  |blank=True,<br> null=True			|Código do Lote do Componente|
|codigo_etiqueta|Varchar	|max_length=30  |						|Código que identifica o componente|
|tipo_etiqueta	|Varchar	|max_length=30  |null=True,<br> blank=True			|Define o tipo do componente|
|lote_etiqueta	|Varchar	|max_length=30  |null=True,<br> blank=True			|Lote do componente|
|empresa	|Integer	|		|default=1,<br> blank=True,<br> null=True	|Código da empresa|
|origem		|Varchar	|max_length=30  |default=0,<br> blank=True,<br> null=True	|Código da origem|
|op		|Varchar	|		|blank=True,<br> null=True			|Código da ordem|
|master_op	|Varchar	|max_length=30  |blank=True<br>, null=True			|A coluna master_op é usada para realizar agrupamento de ordens de produção|
|estagio	|Integer	|		|default=0<br>,blank=True,<br> null=True	|Código do estágio|
|maquina	|Varchar	|max_length=30  |null=True,<br> blank=True			|Código da máquina|
|operador	|Varchar	|max_length=30  |null=True,<br> blank=True			|Código do operador|
|pedido		|Integer	|		|default=0,<br> blank=True,<br> null=True	|Número do pedido|
|descricao	|Varchar	|max_length=128 |null=True,<br> blank=True			|Descrição|
|versao		|Varchar	|max_length=5   |null=True,<br> blank=True			|Versão do componente|
|dimensao	|Varchar	|max_length=30  |null=True,<br> blank=True			||
|data_fabricacao|DateTimeField	|	        |null=True,<br> blank=True			|Data de fabricação|
|validade	|Varchar	|max_length=5   |null=True,<br> blank=True			||
|componente_origem|Varchar	|	        |						||
|quantidade	|DecimalField	|max_length=20  |decimal_places=10,<br> default=0		|Quantidade do componente em metros|
|quantidade_estornada|DecimalField|max_length=20|decimal_places=10,<br> default=0		||
|peso		|DecimalField	|max_length=20  |decimal_places=10,<br> default=0		|Peso do componente|
|taxa_de_conversao|DecimalField	|max_length=20  |decimal_places=10,<br> default=1		|Se não preenchido, calculamos com base na quantidade e peso recebidos|
|tara		|DecimalField	|max_length=20  |decimal_places=10,<br> default=1		|Tara do componente|
|volumes	|Integer	|		|default=0     					|Quantidade de volumes|
|uso		|Varchar	|max_length=5   |Default=N,<br> null=True,<br> blank=True	|N = novo, F = Fechado.|
|situacao	|Varchar	|max_length=1   |Default=A,<br> null=True,<br> blank=True	||
|tipo		|Varchar	|max_length=5   |Default=P,<br> null=True,<br> blank=True	|1 = Bobina, 3 = Tinta, 5 = Insumo|
|unidade	|Varchar	|max_length=5   |Default=PC, null=True, blank=True		|Unidade de medida, ex: KG|
|reg		|Integer	|	        |default=0,<br> blank=True,<br> null=True	||
|controle	|Integer	|	        |default=0,<br> blank=True,<br> null=True	||
|status_imp	|Varchar	|max_length=1   |'N'=new,<br>'U'=update,<br>'I'=integrated	|Define status da linha, caso for importação por tabela.|


 <summary>Nome da Tabela = IMPORTCOMPONENTESOP</summary>
<h4>Tabela responsável por autorizar os produtos que podem ser consumidos em determinadas Ordens</h4>

|Coluna         |Tipo de dado  |Tamanho         |Obs		                     |Descrição    |
|---------------|--------------|----------------|------------------------------------|-------------|
|empresa		|Integer		|					|default=1,<br> blank=True,<br> null=True|Código da empresa|
|origem			|Varchar		|max_length=30				|default=0				 |Código da origem|
|op			|Varchar		|max_length=30				|default=0				 |Código da ordem|
|estagio		|Integer		|					|default=0				 |Código do estágio|
|identificador		|Integer		|					|default=0				 |Sequência do componente|
|maquina		|Varchar		|max_length=30				|					 |Código da máquina|
|codigo_componente	|Varchar		|max_length=32				|					 |Código do produto que vai ser consumido|
|derivacao_componente	|Varchar		|max_length=32				|blank=True,<br> null=True		 |Versão do produto que vai ser consumido|
|tipo			|Varchar		|max_length=5				|blank=True,<br> null=True		 |Tipo do componente. Ex: T = Tinta, B = Bobina, etc.|
|quantidade_prevista	|DecimalField		|max_digits=20,<br>decimal_places=10	|default=0				 |Quantidade prevista que será consumida|
|quantidade_reservada	|DecimalField		|max_digits=20,<br>decimal_places=10	|default=0				 |Quantidade que poderá ser consumida a mais que a prevista|
|status_imp		|Varchar		|max_length=1				|'N'=new,<br>'U'=update,<br>'I'=integrated|Define status da linha, caso for importação por tabela.|

</details>

</details>




2 - Exportação
-------------------------------

<details>
 <summary>Ver Tabelas</summary>
 
 **Sistema: Vedois-OEE** <br>
 **Atualizado em: 16/12/2020**<br>


  <summary>Nome da Tabela = EXPORTPRODUCAO</summary><br>

   **OBS**:Necessário criar SEQUENCE: <br>
   <br>
  **-- PostgreSQL <br>**
    CREATE SEQUENCE exportproducao_id_seq<br>
      START WITH 1<br>
      INCREMENT BY 1<br>
      NO MINVALUE<br>
      NO MAXVALUE<br>
      CACHE 1;<br>

  **-- SQL Server 2012 <br>**
    CREATE SEQUENCE exportproducao_id_seq<br>
      START WITH 1<br>
      INCREMENT BY 1 ;<br>
      NO MINVALUE<br>
      NO MAXVALUE<br>
      CACHE 1;<br>
      SELECT next value for exportproducao_id_seq<br>
      <br>


|Coluna|Tipo de dado|Tamanho|Obs|Descrição|
|-------------|-------------|-------------|-------------|-------------|
| id | IntegerField |  | primary_key=True | id criado sequencial|
| data_geracao | DateTimeField |  | blank=True, null=True | data no momento do envio do dado.|
| empresa | IntegerField |  | blank=True, null=True ||
| origem | Varchar | max_length=30 | blank=True, null=True ||
| op | Varchar | max_length=30 | blank=True, null=True ||
| estagio | IntegerField |  | blank=True, null=True ||
| sequencia_producao | IntegerField |  | blank=True, null=True ||
| produto | Varchar | max_length=30 | blank=True, null=True ||
| maquina | Varchar | max_length=30 | blank=True, null=True ||
| grupomaquina | Varchar | max_length=30 | blank=True, null=True ||
| ferramenta | Varchar | max_length=30 | blank=True, null=True ||
| operador | Varchar | max_length=30 | blank=True, null=True ||
| turno | IntegerField |  | blank=True, null=True ||
| reg | IntegerField |  | default=0, blank=True, null=True | esse campo é responsavel por saber o "status" do evento, como reg = 2 enviado ou 5 erro.|
| inicio | DateTimeField |  | blank=True, null=True | inicio do evento|
| fim |  | DateTimeField | blank=True, null=True | fim do evento|
| duracao | IntegerField |  |  | duracao do evento fim - inicio|
| codigo_lote | Varchar | max_length=32 | default="", blank=True, null=True | Caso o cliente tenha essa informação o campo é alimentado|
| quantidade | DecimalField | max_digits=20, decimal_places=10 | default=0 ||
| quantidade2 | DecimalField | max_digits=20, decimal_places=10 | default=0 ||
| quantidade3 | DecimalField | max_digits=20, decimal_places=10 | default=0 ||
| taxa_de_conversao | DecimalField | max_digits=20, decimal_places=10 | default=1 ||

  <summary>Nome da Tabela = EXPORTREFUGO</summary><br>

   **OBS**:Necessário criar SEQUENCE: <br>
   <br>
  **-- PostgreSQL<br>**
    CREATE SEQUENCE exportrefugo_id_seq<br>
      START WITH 1<br>
      INCREMENT BY 1<br>
      NO MINVALUE<br>
      NO MAXVALUE<br>
      CACHE 1;<br>

  **-- SQL Server 2012<br>**
    CREATE SEQUENCE exportrefugo_id_seq<br>
      START WITH 1<br>
      INCREMENT BY 1<br>
      NO MINVALUE<br>
      NO MAXVALUE<br>
      CACHE 1;<br>
      SELECT next value for exportrefugo_id_seq<br>
      <br>


|Coluna|Tipo de dado|Tamanho|Obs|Descrição|
|-------------|-------------|-------------|-------------|-------------|
| id | IntegerField |  | primary_key=True | id criado sequencial|
| data_geracao | DateTimeField |  | blank=True, null=True | data no momento do envio do dado.|
| empresa | IntegerField |  | blank=True, null=True ||
| origem | Varchar | max_length=30 | blank=True, null=True ||
| op | Varchar | max_length=30 | blank=True, null=True ||
| estagio | IntegerField |  | blank=True, null=True ||
| sequencia_producao | IntegerField |  | blank=True, null=True ||
| produto | Varchar | max_length=30 | blank=True, null=True ||
| maquina | Varchar | max_length=30 | blank=True, null=True ||
| grupomaquina | Varchar | max_length=30 | blank=True, null=True ||
| ferramenta | Varchar | max_length=30 | blank=True, null=True ||
| operador | Varchar | max_length=30 | blank=True, null=True ||
| turno | IntegerField |  | blank=True, null=True ||
| reg | IntegerField |  | default=0, blank=True, null=True | Esse campo é responsavel por saber o "status" do evento, como reg = 2 enviado ou 5 erro.|
| horario | DateTimeField |  | blank=True, null=True | Horario do apontamento de refugo.|
| motivo | Varchar | max_length=30 | blank=True, null=True ||
| codigo_lote | Varchar | max_length=32 | default="", blank=True | Caso o cliente tenha essa informação o campo é alimentado|
| quantidade | DecimalField | max_digits=20, decimal_places=10 |  ||
| quantidade2 | DecimalField | max_digits=20, decimal_places=10 | default=0 ||
| quantidade3 | DecimalField | max_digits=20, decimal_places=10 | default=0 ||
| taxa_de_conversao | DecimalField | max_digits=20, decimal_places=10 | default=1 ||
| classificacao | Varchar | max_length=30 | blank=True, null=True ||
| etapa_causa | Varchar | max_length=30 | blank=True, null=True ||
| maquina_causa | Varchar | max_length=30 | blank=True, null=True ||


  <summary>Nome da Tabela = EXPORTPARADA</summary><br>

   **OBS**:Necessário criar SEQUENCE: <br>
   <br>
  **-- PostgreSQL<br>**
    CREATE SEQUENCE exportparada_id_seq<br>
      START WITH 1<br>
      INCREMENT BY 1<br>
      NO MINVALUE<br>
      NO MAXVALUE<br>
      CACHE 1;<br>

  **-- SQL Server 2012<br>**
    CREATE SEQUENCE exportparada_id_seq<br>
      START WITH 1<br>
      INCREMENT BY 1<br>
      NO MINVALUE<br>
      NO MAXVALUE<br>
      CACHE 1;<br>
      SELECT next value for exportparada_id_seq<br>
      <br>


|Coluna|Tipo de dado|Tamanho|Obs|Descrição|
|-------------|-------------|-------------|-------------|-------------|
| id | IntegerField |  | primary_key=True ||
| data_geracao | DateTimeField |  | blank=True, null=True ||
| empresa | IntegerField |  | blank=True, null=True ||
| origem | Varchar | max_length=30 | blank=True, null=True ||
| op | Varchar | max_length=30 | blank=True, null=True ||
| estagio | IntegerField |  | blank=True, null=True ||
| sequencia_producao | IntegerField |  | blank=True, null=True ||
| produto | Varchar | max_length=30 | blank=True, null=True ||
| maquina | Varchar | max_length=30 | blank=True, null=True ||
| grupomaquina | Varchar | max_length=30 | blank=True, null=True ||
| ferramenta | Varchar | max_length=30 | blank=True, null=True ||
| operador | Varchar | max_length=30 | blank=True, null=True ||
| turno | IntegerField |  | blank=True, null=True ||
| reg | IntegerField |  | default=0, blank=True, null=True | Esse campo é responsavel por saber o "status" do evento, como reg = 2 enviado ou 5 erro.|
| inicio | DateTimeField |  | blank=True,<br> null=True ||
| fim |  | DateTimeField | blank=True,<br> null=True ||
| duracao | BigIntegerField |  |  ||
| motivo | Varchar | max_length=30 | blank=True, null=True ||
| setup | BooleanField | BooleanField | default=False ||

  <summary>Nome da Tabela = EXPORTCOMPONENTE</summary><br>

   **OBS**:Necessário criar SEQUENCE: <br>
   <br>
  **-- PostgreSQL<br>**
    CREATE SEQUENCE exportcomponente_id_seq<br>
      START WITH 1<br>
      INCREMENT BY 1<br>
      NO MINVALUE<br>
      NO MAXVALUE<br>
      CACHE 1;<br>

  **-- SQL Server 2012<br>**
    CREATE SEQUENCE exportcomponente_id_seq<br>
      START WITH 1<br>
      INCREMENT BY 1<br>
      NO MINVALUE<br>
      NO MAXVALUE<br>
      CACHE 1;<br>
      SELECT next value for exportcomponente_id_seq<br>
      <br>


|Coluna|Tipo de dado|Tamanho|Obs|Descrição|
|-------------|-------------|-------------|-------------|-------------|
| id | IntegerField |  | primary_key=True ||
| data_geracao | DateTimeField |  | blank=True, null=True ||
| empresa | IntegerField |  | blank=True, null=True ||
| origem | Varchar | max_length=30 | blank=True, null=True ||
| op | Varchar | max_length=30 | blank=True, null=True ||
| estagio | IntegerField |  | blank=True, null=True ||
| sequencia_producao | IntegerField |  | blank=True, null=True ||
| produto | Varchar | max_length=30 | blank=True, null=True ||
| maquina | Varchar | max_length=30 | blank=True, null=True ||
| grupomaquina | Varchar | max_length=30 | blank=True, null=True ||
| ferramenta | Varchar | max_length=30 | blank=True, null=True ||
| operador | Varchar | max_length=30 | blank=True, null=True ||
| turno | IntegerField |  | blank=True, null=True ||
| reg | IntegerField |  | default=0, blank=True, null=True | Esse campo é responsavel por saber o "status" do evento, como reg = 2 enviado ou 5 erro.|
| codigo | Varchar | max_length=32 |  ||
| versao | Varchar | max_length=64 | blank=True, null=True ||
| volume | IntegerField |  | blank=True, null=True |Campo utilizado para marcar sequencialmente o número do volume gerado|
| descricao | Varchar | max_length=64 | blank=True, null=True ||
| codigo_barras | Varchar | max_length=64 |  ||
| tipo | Varchar | max_length=2 | L=lote+largura+espessura, M=massa,T=tinta, B=bobina ||
| lote | Varchar | max_length=32 | blank=True, null=True ||
| quantidade | DecimalField | max_digits=20, decimal_places=10 | default=0 ||
| peso | DecimalField | max_digits=20, decimal_places=10 | default=0 ||
| peso_bruto | DecimalField | max_digits=20, decimal_places=10 | default=0 ||
| atributo | DecimalField | max_digits=20, decimal_places=10 | default=0 ||
| atributo2 | DecimalField | max_digits=20, decimal_places=10 | default=0 ||
| atributo3 | DecimalField | max_digits=20, decimal_places=10 | default=0 ||
| taxa_de_conversao | DecimalField | max_digits=20, decimal_places=10 | default=1 ||
| inicio | DateTimeField |  | blank=True, null=True ||

</details>

## 2.1 Tipos de Exportação:

Documentação: [Link Aqui](https://vedois.notion.site/Integra-o-Tipos-de-Exporta-o-b528b84b06ef42fb98a088932c5d38b6)
