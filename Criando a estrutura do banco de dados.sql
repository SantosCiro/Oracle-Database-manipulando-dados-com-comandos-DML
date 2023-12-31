-- Entre com os comandos:

CREATE TABLE PRODUTOS
(CODIGO VARCHAR(10) NOT NULL,
DESCRITOR VARCHAR(100) NULL,
SABOR VARCHAR(50) NULL,
TAMANHO VARCHAR(50) NULL,
EMBALAGEM VARCHAR(50) NULL,
PRECO_LISTA FLOAT NULL,
PRIMARY KEY (CODIGO));

-- Agora, monte a tabela de vendedores, executando o c�digo abaixo:

CREATE TABLE VENDEDORES
(MATRICULA VARCHAR(5) NOT NULL,
NOME VARCHAR(100) NULL,
BAIRRO VARCHAR(50) NULL,
COMISSAO FLOAT NULL,
DATA_ADIMISSAO DATE NULL,
FERIAS INTEGER NULL,
PRIMARY KEY (MATRICULA));

-- Para alterar a tabela VENDEDORES, execute:

ALTER TABLE VENDEDORES
RENAME COLUMN DATA_ADIMISSAO TO DATA_ADMISSAO;

-- Crie a TABELA_DE_VENDAS, atrav�s do c�digo abaixo:

CREATE TABLE TABELA_DE_VENDAS
(
NUMERO VARCHAR(5) NOT NULL
,DATA_VENDA DATE NULL
,CPF VARCHAR(11) NOT NULL
,MATRICULA VARCHAR(5) NOT NULL
,IMPOSTO FLOAT NULL
,PRIMARY KEY(NUMERO)
);

-- Para alterar a chave estrangeira com a restri��o CPF, execute o seguinte c�digo:

ALTER TABLE TABELA_DE_VENDAS
ADD CONSTRAINT FK_CLIENTES 
FOREIGN KEY (CPF) REFERENCES CLIENTES (CPF);

-- Crie a chave estrangeira MATRICULA:

ALTER TABLE TABELA_DE_VENDAS
ADD CONSTRAINT FK_VENDEDORES
FOREIGN KEY (MATRICULA) REFERENCES VENDEDORES (MATRICULA); 

-- Crie a tabela ITENS_NOTAS, executando o c�digo:

CREATE TABLE ITENS_NOTAS
(
NUMERO VARCHAR(5) NOT NULL
,CODIGO VARCHAR(10) NOT NULL
,QUANTIDADE INTEGER NULL
,PRECO FLOAT
,PRIMARY KEY (NUMERO, CODIGO)
);

-- Para criar a chave estrangeira NUMERO, execute:

ALTER TABLE ITENS_NOTAS
ADD CONSTRAINT FK_NOTAS
FOREIGN KEY (NUMERO) 
REFERENCES NOTAS (NUMERO);

-- Crie a chave estrangeira CODIGO, referente ao campo PROUTOS:

ALTER TABLE ITENS_NOTAS
ADD CONSTRAINT FK_PRODUTOS
FOREIGN KEY (CODIGO) 
REFERENCES PRODUTOS (CODIGO);



































