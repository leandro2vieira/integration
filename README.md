Introdução sobre Integração
-------------------------------

A integração com o sistema da Vedois pode ser feito com N tecnologias, por exemplo:
Webservice, Tabela, View, CSV. A Vedois recomenda o uso de webservice ou tabela, pois possuem melhor performance/segurança.

A integração deve ser separada em duas etapas.
* 1. Importação ( Vedois <-- ERP )
* 2. Exportação ( Vedois --> ERP )


Importação
-------------------------------


| col1 | col2 |
| t1   | t2   |


<details>
  <summary>Clique para expandir</summary>
  
Nome da Tabela = **IMPORTMAQUINA**
Tabela responsável pelo cadastro dos centros de recurso.

|Coluna|Tipo de dado|Tamanho|Obs|
|******|************|*******|***|
|id|	Integer|		|Precisa ser sequencial|
|empresa|	Integer|		default=1||
|codigo|	Varchar|max_length=30||
|descricao|	Varchar|max_length=128||
|linear|	BooleanField|		|default=False|
|grupo|	Varchar|	max_length=32||	
|ativa|	BooleanField|		|default=False|
|fator_velocidade|	DecimalField|	max_digits=20, decimal_places=10|	default=1|
|status_imp|Varchar|	max_length=1|	blank=True, null=True # 'N'=new, 'U'=update, 'I'=integrated

</details>