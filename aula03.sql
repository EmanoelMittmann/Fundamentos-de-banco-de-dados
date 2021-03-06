CREATE TABLE FORNECEDORES{
    CODIGO INT NOT NULL PRIMARY KEY AUTO_INCREMENT
    NOME VARCHAR(50)
};

CREATE TABLE CATEGORIAS{
    CODIGO INT NOT NULL AUTO_INCREMENT PRIMARY KEY
    NOME VARCHAR(50)
};

CREATE TABLE PRODUTOS{
    CODIGO INT NOT NULL AUTO_INCREMENT PRIMARY KEY
    DESCRIÇÃO VARCHAR(100)
    DATA_CADASTRO DATE
    VALOR_UNITARIO DOUBLE
    COD_CATEGORIA INT NOT NULL
    CONSTRAINT PK_PRODUTO_CATEGIAS FOREIGN KEY(COD_CATEGORIA)
        REFERENCES CATEGORIAS(CODIGO)
};

CREATE TABLE PEDIDOS{
    CODIGO INT NOT NULL AUTO_INCREMENT PRIMARY KEY
    QUANTIDADE INT NOT NULL
    VALOR_UNITARIO DOUBLE
    DATA DATE
    COD_FORNECEDORES INT NOT NULL,
    COD_PRODUTOS INT NOT NULL
    CONSTRAINT FK_PEDIDOS_FORNECEDORES FOREIGN KEY (COD_FORNECEDORES)
        REFERENCES FORNECEDORES(CODIGO),
            ON UPDATE CASCADE
            ON DELETE RESTRICT,
    CONSTRAINT FK_PEDIDOS_PRODUTOS FOREIGN(COD_PRODUTOS)
        REFERENCES PRODUTOS(CODIGOS)
}

/*CREATE TABLE
ALTER TABLE
DROP TABLE*/
3
ALTER TABLE FORNECEDORES ADD COLUMN DATA_ULTIMA_COMPRA DATE;
ALTER TABLE FORNECEDORES DROP COLUMN data_ultima_compra;

4
ALTER TABLE PEDIDOS CHANGE COLUMN DATA DATA_PEDIDO;
5
ALTER TABLE PRODUTOS DROP COLUMN DATA_CADASTRO;
6
ALTER TABLE PRODUTOS DROP CONSTRAINT FK_PRODUTOS_CATEGORIA
ALTER TABLE PRODUTOS
    ADD CONSTRAINT FK_PRODUTOS_CATEGORIA
        FOREIGN KEY(COD_CATEGORIA)
            REFERENCES CATEGORIAS(CODIGOS)
                ON DELETE CASCADE
                ON UPDATE RESTRICT;

ALTER TABLE PRODUTOS
    ADD CONSTRAINT FK_PRODUTOS_CATEGORIA
        FOREIGN KEY (COD_CATEGORIA)
            REFERENCES CATEGORIAS(CODIGO)
            ON DELETE CASCADE
            ON UPDATE RESTRICT;
7
ALTER TABLE FORNECEDORES
    MODIFY NOME VARCHAR(80)NOT NULL;
8
DROP TABLE FORNECEDORES;
9
ALTER TABLE PEDIDOS
    ADD COLUMN NUMERO_PEDIDO VARCHAR(255) NOT NULL;