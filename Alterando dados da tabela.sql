-- Mostre os produtos com c�digo 1040107:

SELECT * FROM PRODUTOS WHERE CODIGO = '1040107';

-- Altere esses produtos com o comando UPDATE e o filtro WHERE:

UPDATE PRODUTOS SET PRECO_LISTA = 5.2 WHERE CODIGO = '1040107';

-- Para alterar v�rios campos, execute:

UPDATE PRODUTOS SET SABOR = 'Laranja', EMBALAGEM = 'PET' WHERE CODIGO = '1040107';

-- O comando REPLACE altera um peda�o de texto por outro texto:

SELECT DESCRITOR, REPLACE(DESCRITOR, 'Melancia', 'Laranja') FROM PRODUTOS WHERE CODIGO = '1040107';

-- Outra forma de escrever o c�digo:

UPDATE PRODUTOS SET DESCRITOR = REPLACE(DESCRITOR, 'Melancia', 'Laranja') WHERE CODIGO = '1040107';

-- Use o SELECT para mostrar os registros com sabor maracuj�:

SELECT * FROM PRODUTOS WHERE SABOR = 'Maracuja';

--  Para reajustar o pre�o de todos produtos que atendem a um requisito:

UPDATE PRODUTOS SET PRECO_LISTA = PRECO_LISTA * 1.10 WHERE SABOR = 'Maracuja';

-- Execute os comandos:

CREATE TABLE "TABELA_DE_VENDEDORES_FONTE" 
    ("MATRICULA" NVARCHAR2(5), 
    "NOME" NVARCHAR2(100), 
    "PERCENTUAL_COMISSAO" FLOAT(126), 
    "DATA_ADMISSAO" DATE, 
    "DE_FERIAS" NUMBER(1,0), 
    "BAIRRO" NVARCHAR2(50)
);

Insert into TABELA_DE_VENDEDORES_FONTE (MATRICULA,NOME,PERCENTUAL_COMISSAO,DATA_ADMISSAO,DE_FERIAS,BAIRRO) values ('00235','Marcio Almeida Silva','0,08',to_date('15/08/14','DD/MM/RR'),'0','Tijuca');
Insert into TABELA_DE_VENDEDORES_FONTE (MATRICULA,NOME,PERCENTUAL_COMISSAO,DATA_ADMISSAO,DE_FERIAS,BAIRRO) values ('00236','Claudia Morais','0,08',to_date('17/09/13','DD/MM/RR'),'1','Jardins');
Insert into TABELA_DE_VENDEDORES_FONTE (MATRICULA,NOME,PERCENTUAL_COMISSAO,DATA_ADMISSAO,DE_FERIAS,BAIRRO) values ('00237','Roberta Martins','0,11',to_date('18/03/17','DD/MM/RR'),'1','Copacabana');
Insert into TABELA_DE_VENDEDORES_FONTE (MATRICULA,NOME,PERCENTUAL_COMISSAO,DATA_ADMISSAO,DE_FERIAS,BAIRRO) values ('00238','Pericles Alves','0,11',to_date('21/08/16','DD/MM/RR'),'0','Santo Amaro');

-- Mostre o conte�do das duas tabelas:

SELECT * FROM VENDEDORES V;
SELECT * FROM TABELA_DE_VENDEDORES_FONTE TVF;

-- Use a sele��o para acertar os campos das tabelas:

SELECT V.MATRICULA AS MATRICULA_VENDEDORES, TVF.MATRICULA AS MATRICULA_FONTE,
V.FERIAS AS FERIAS_VENDEDORES, TVF.DE_FERIAS AS FERIAS_FONTE
FROM VENDEDORES V INNER JOIN TABELA_DE_VENDEDORES_FONTE TVF ON V.MATRICULA = SUBSTR(TVF.MATRICULA, 3, 3);

-- N�o funcionou, ent�o execute o c�digo:

UPDATE TABELA_DE_VENDEDORES_FONTE SET DE_FERIAS = 0 WHERE MATRICULA IN ('00236','00237');
UPDATE TABELA_DE_VENDEDORES_FONTE SET DE_FERIAS = 1 WHERE MATRICULA IN ('00235','00238');

-- O comando INNER_JOIN, junto do UPDATE, n�o funciona para o Oracle:

UPDATE VENDEDORES V INNER JOIN TABELA_DE_VENDEDORES_FONTE TVF ON V.MATRICULA = SUBSTR(TVF.MATRICULA, 3, 3)
SET V.FERIAS = TVF.DE_FERIAS;

--  Execute o comando abaixo para ver as tabelas:

SELECT V.MATRICULA AS MATRICULA_VENDEDORES, TVF.MATRICULA AS MATRICULA_FONTE,
V.FERIAS AS FERIAS_VENDEDORES, TVF.DE_FERIAS AS FERIAS_FONTE
FROM VENDEDORES V INNER JOIN TABELA_DE_VENDEDORES_FONTE TVF ON V.MATRICULA = SUBSTR(TVF.MATRICULA, 3, 3);

-- Execute o comando EXISTS:

SELECT V.MATRICULA AS MATRICULA_VENDEDORES,
V.FERIAS AS FERIAS_VENDEDORES
FROM VENDEDORES V 
WHERE EXISTS
(SELECT 1 FROM TABELA_DE_VENDEDORES_FONTE TVF	WHERE V.MATRICULA = SUBSTR(TVF.MATRICULA, 3, 3));

-- Insira mais um registro:

INSERT INTO TABELA_DE_VENDEDORES_FONTE
VALUES ('00239', 'Jose Maria', 0.12, TO_DATE('2018-01-01','YYYY-MM-DD'), 1, 'Tijuca');

-- Fa�a a altera��o de c�digo:

SELECT V.MATRICULA AS MATRICULA_VENDEDORES, TVF.MATRICULA AS MATRICULA_FONTE,
V.FERIAS AS FERIAS_VENDEDORES, TVF.DE_FERIAS AS FERIAS_FONTE
FROM VENDEDORES V RIGHT JOIN TABELA_DE_VENDEDORES_FONTE TVF ON V.MATRICULA = SUBSTR(TVF.MATRICULA, 3, 3);

-- Altere o c�digo para usar o RIGHT JOIN:

SELECT V.MATRICULA AS MATRICULA_VENDEDORES, TVF.MATRICULA AS MATRICULA_FONTE,
V.FERIAS AS FERIAS_VENDEDORES, TVF.DE_FERIAS AS FERIAS_FONTE
FROM VENDEDORES V RIGHT JOIN TABELA_DE_VENDEDORES_FONTE TVF ON V.MATRICULA = SUBSTR(TVF.MATRICULA, 3, 3);

-- Crie um script novo e copie os comandos abaixo para usar como guia:

SELECT V.MATRICULA AS MATRICULA_VENDEDORES,
V.FERIAS AS FERIAS_VENDEDORES
FROM VENDEDORES V 
WHERE EXISTS
(SELECT 1 FROM TABELA_DE_VENDEDORES_FONTE TVF
WHERE V.MATRICULA = SUBSTR(TVF.MATRICULA, 3, 3));

-- Confira com o INNER JOIN:

SELECT V.MATRICULA AS MATRICULA_VENDEDORES,TVF.MATRICULA AS MATRICULA_FONTE,
V.FERIAS AS FERIAS_VENDEDORES, TVF.DE_FERIAS AS FERIAS_FONTE
FROM VENDEDORES V INNER JOIN TABELA_DE_VENDEDORES_FONTE TVF ON V.MATRICULA = SUBSTR(TVF.MATRICULA, 3, 3);

-- Use o comando UPDATE:

UPDATE VENDEDORES V SET V.FERIAS =
(SELECT TVF.DE_FERIAS FROM TABELA_DE_VENDEDORES_FONTE TVF
WHERE V.MATRICULA = SUBSTR(TVF.MATRICULA, 3, 3))
WHERE EXISTS
(SELECT 1 FROM TABELA_DE_VENDEDORES_FONTE TVF
WHERE V.MATRICULA = SUBSTR(TVF.MATRICULA, 3, 3));

-- Altere a tabela fonte:

UPDATE TABELA_DE_VENDEDORES_FONTE SET DE_FERIAS = 1 WHERE MATRICULA IN ('00236','00237');

-- Para ver a sincroniza��o, execute o comando:

SELECT V.MATRICULA AS MATRICULA_VENDEDORES,TVF.MATRICULA AS MATRICULA_FONTE
V.FERIAS AS FERIAS_VENDEDORES, TVF.DE_FERIAS AS FERIAS_FONTE
FROM VENDEDORES V INNER JOIN TABELA_DE_VENDEDORES_FONTE TVF ON V.MATRICULA = SUBSTR(TVF.MATRICULA, 3, 3);



























