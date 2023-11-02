-- Execute o comando:

SELECT * FROM TABELA_DE_PRODUTOS_FONTE;

-- Apague o registro 9999999:

DELETE FROM TABELA_DE_PRODUTOS_FONTE WHERE CODIGO_DO_PRODUTO = '9999999';

--  Selecione as linhas abaixo, conforme visto em aula:

INSERT INTO PRODUTOS (CODIGO,DESCRITOR,SABOR,TAMANHO,EMBALAGEM,PRECO_LISTA)
VALUES ('1001001','Sabor dos Alpes 700 ml - Manga','Manga','700 ml','Garrafa',7.50);

INSERT INTO PRODUTOS (CODIGO,DESCRITOR,SABOR,TAMANHO,EMBALAGEM,PRECO_LISTA)
VALUES ('1001000','Sabor dos Alpes 700 ml - Mel�o','Mel�o','700 ml','Garrafa',7.50);

INSERT INTO PRODUTOS (CODIGO,DESCRITOR,SABOR,TAMANHO,EMBALAGEM,PRECO_LISTA)
VALUES ('1001002','Sabor dos Alpes 700 ml - Graviola','Graviola','700 ml','Garrafa',7.50);

INSERT INTO PRODUTOS (CODIGO,DESCRITOR,SABOR,TAMANHO,EMBALAGEM,PRECO_LISTA)
VALUES ('1001003','Sabor dos Alpes 700 ml - Tangerina','Tangerina','700 ml','Garrafa',7.50);

INSERT INTO PRODUTOS (CODIGO,DESCRITOR,SABOR,TAMANHO,EMBALAGEM,PRECO_LISTA)
VALUES ('1001004','Sabor dos Alpes 700 ml - Abacate','Abacate','700 ml','Garrafa',7.50);

INSERT INTO PRODUTOS (CODIGO,DESCRITOR,SABOR,TAMANHO,EMBALAGEM,PRECO_LISTA)
VALUES ('1001005','Sabor dos Alpes 700 ml - A�ai','A�ai','700 ml','Garrafa',7.50);

INSERT INTO PRODUTOS (CODIGO,DESCRITOR,SABOR,TAMANHO,EMBALAGEM,PRECO_LISTA)
VALUES ('1001006','Sabor dos Alpes 1 Litro - Manga','Manga','1 Litro','Garrafa',7.50);

INSERT INTO PRODUTOS (CODIGO,DESCRITOR,SABOR,TAMANHO,EMBALAGEM,PRECO_LISTA)
VALUES ('1001007','Sabor dos Alpes 1 Litro - Mel�o','Mel�o','1 Litro','Garrafa',7.50);

INSERT INTO PRODUTOS (CODIGO,DESCRITOR,SABOR,TAMANHO,EMBALAGEM,PRECO_LISTA)
VALUES ('1001008','Sabor dos Alpes 1 Litro - Graviola','Graviola','1 Litro','Garrafa',7.50);

INSERT INTO PRODUTOS (CODIGO,DESCRITOR,SABOR,TAMANHO,EMBALAGEM,PRECO_LISTA)
VALUES ('1001009','Sabor dos Alpes 1 Litro - Tangerina','Tangerina','1 Litro','Garrafa',7.50);

INSERT INTO PRODUTOS (CODIGO,DESCRITOR,SABOR,TAMANHO,EMBALAGEM,PRECO_LISTA)
VALUES ('1001010','Sabor dos Alpes 1 Litro - Abacate','Abacate','1 Litro','Garrafa',7.50);

-- Verifique a inclus�o da linha com Sabor dos Alpes:

SELECT * from PRODUTOS WHERE SUBSTR(DESCRITOR,1,15) = 'Sabor dos Alpes';

-- Verifique a tabela TABELA_DE_PRODUTOS_FONTE:

SELECT * from TABELA_DE_PRODUTOS_FONTE WHERE SUBSTR(NOME_DO_PRODUTO,1,15) = 'Sabor dos Alpes';

-- Para excluir da tabela PRODUTOS:

DELETE FROM PRODUTOS WHERE CODIGO = '1001000';

-- Para contar quantos produtos tem em cada tabela, execute o c�digo:

SELECT COUNT(*) FROM PRODUTOS;
SELECT COUNT(*) FROM TABELA_DE_PRODUTOS_FONTE;

--  Para descobrir as diferen�as nas tabelas:

SELECT
P.CODIGO AS CODIGO_PRODUTOS, TPF.CODIGO_DO_PRODUTO AS CODIGO_FONTE,
P.DESCRITOR AS DESCRITOR_PRODUTOS, TPF.NOME_DO_PRODUTO AS DESCRITOR_FONTE
    FROM PRODUTOS P LEFT JOIN TABELA_DE_PRODUTOS_FONTE TPF
    ON P.CODIGO = TPF.CODIGO_DO_PRODUTO;
    
-- Usando o LEFT JOIN, mostre as diferen�as entre as tabelas:
    
SELECT
    P.CODIGO FROM PRODUTOS P LEFT JOIN TABELA_DE_PRODUTOS_FONTE TPF
    ON P.CODIGO = TPF.CODIGO_DO_PRODUTO
    WHERE TPF.CODIGO_DO_PRODUTO IS NULL;
    
--  Para apagar linhas que n�o tenham correspond�ncia nas tabelas:

    DELETE FROM PRODUTOS P WHERE
        P.CODIGO IN (
    SELECT P.CODIGO FROM PRODUTOS P LEFT JOIN TABELA_DE_PRODUTOS_FONTE TPF
    ON P.CODIGO = TPF.CODIGO_DO_PRODUTO
    WHERE TPF.CODIGO_DO_PRODUTO IS NULL
    );
    
-- Crie um script novo e conte quantas linhas t�m na tabela PRODUTOS:

SELECT COUNT(*) FROM PRODUTOS;

--  Crie um novo script nesta janela, usando a mesma conex�o, e conte novamente:

SELECT COUNT(*) FROM PRODUTOS;

-- Para confirmar a transa��o, � necess�rio executar um COMMIT:

COMMIT;

-- Crie um novo script, que ir� criar a tabela PRODUTOS2:

CREATE TABLE PRODUTOS2 AS (SELECT * FROM PRODUTOS);

-- Veja o conte�do de PRODUTOS2:

SELECT * FROM PRODUTOS2;

-- Mude o pre�o dos produtos para 8:

UPDATE PRODUTOS2 SET PRECO_LISTA = 8;

-- Feche a transa��o com o comando:

COMMIT;

-- Mude o PRECO_LISTA para 7:

UPDATE PRODUTOS2 SET PRECO_LISTA = 7;

-- O comando para voltar ao estado anterior ao �ltimo COMMIT � o ROLLBACK:

ROLLBACK;











