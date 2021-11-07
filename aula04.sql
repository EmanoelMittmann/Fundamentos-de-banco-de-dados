--sql dml

/*
insert
update
delete select
*/

-- inserir a categoria eletronico no bd
/*
INSERT INTO TABELA (COLUNA1,COLUNA2,COLUNA..)
    VALUE(1,'NOME',12.97,'2021-05-01','2021-09-01 11:00:00','11:00:00')

*/
INSERT INTO categoria(NOME)
    VALUES('Eletronicos')
    INSERT INTO categoria(CODIGO,NOME)
    VALUES(3,'Acessórios')

/*
    SELECT

SELECT COL1,COL2,COL3,COLN...
FROM CATEGORIAS
...
WHERE
*/

SELECT CODIGO,NOME
FROM categoria

    DELETE FROM CATEGORIAS

    --INSERT MULTIPLOS ELEMENTOS COM INSERT

    INSERT INTO CATEGORIAS(NOME)
    ('Acessórios'),
    ('Teclado'),
    ('Monitores');

    --deletar somente a categoria acessória

    DELETE FROM CATEGORIAS WHERE nome="Acessórios"
    SELECT * FROM CATEGORIAS

    SELECT * FROM CATEGORIAS WHERE CODIGO=6

    --update
    /*
        UPDATE tabela SET col1="dado",col2=10,col3='2021-01-01
    where col0=100;
    update - alterar o nome da categoria eletronicos para super eletronicos

    */
    UPDATE CATEGORIAS
    SET nome = 'Super Eletronicos'
    where CODIGO = 6;

    SELECT *