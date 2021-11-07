[9:06 PM, 15/10/2021] Nycole Becker: CREATE TABLE FORNECEDORES(
    codigo int not null AUTO_INCREMENT primary key,
    nome varchar(50)
);

CREATE TABLE CATEGORIAS(
    codigo int not null AUTO_INCREMENT primary key,
    nome varchar(50)
);

CREATE TABLE PRODUTOS(
    codigo int not null AUTO_INCREMENT primary key,
    descricao varchar(100) not null,
    data_cadastro date,
    valor_unitario double,
    cod_categoria int not null,
    CONSTRAINT fk_produtos_categorias
        FOREIGN key (cod_categoria)
            REFERENCES CATEGORIAS(codigo)
);

CREATE TABLE PEDIDOS(
    codigo int not null auto_increment primary key, 
    quantidade int not null,
    valor_unitario double,
    data_pedido date,
    cod_fornecedores int not null,
    cod_produtos int not null,
    CONSTRAINT fk__pedem_fornecedores
        FOREIGN key (cod_fornecedores)    
            references FORNECEDORES(codigo)
            ON UPDATE CASCADE
            ON DELETE RESTRICT,
    CONSTRAINT fk_pedem_produtos 
        FOREIGN key (cod_produtos)
            REFERENCES PRODUTOS(codigo)
);

INSERT INTO FORNECEDORES(nome)
	VALUES('Cássio');
    
SELECT * FROM FORNECEDORES;

INSERT INTO FORNECEDORES(nome)
	VALUES('Nycole');

INSERT INTO FORNECEDORES(nome)
	VALUES('Ana');
    
UPDATE FORNECEDORES 
 SET nome = 'Ramon'
WHERE codigo = 3;

DELETE FROM FORNECEDORES
WHERE codigo = 3;
    
INSERT INTO CATEGORIAS(nome)
	VALUES('ALIMENTOS');
    
INSERT INTO CATEGORIAS(nome)
	VALUES('ELETRÔNICOS');
    
INSERT INTO CATEGORIAS(nome)
	VALUES('ALMOFADA');
    
SELECT * FROM CATEGORIAS;

DELETE FROM CATEGORIAS
WHERE codigo = 3;

UPDATE CATEGORIAS 
 SET nome = 'ALIMENTO PERECÍVEL'
WHERE codigo = 1;

INSERT INTO PRODUTOS(descricao, data_cadastro, valor_unitario, cod_categoria)
	VALUES('Batata', '2021-10-15', '4.10', '1');
    
INSERT INTO PRODUTOS(descricao, data_cadastro, valor_unitario, cod_categoria)
	VALUES('Arroz', '2021-10-15', '10.10', '1');

INSERT INTO PRODUTOS(descricao, data_cadastro, valor_unitario, cod_categoria)
	VALUES('Feijão', '2021-10-15', '7.40', '1');
    
SELECT * FROM PRODUTOS;

INSERT INTO PRODUTOS(descricao, data_cadastro, valor_unitario, cod_categoria)
	VALUES('Teclado', '2021-10-15', '107.10', '2');

INSERT INTO PRODUTOS(descricao, data_cadastro, valor_unitario, cod_categoria)
	VALUES('Mouse', '2021-10-15', '87.20', '2');
    
INSERT INTO PRODUTOS(descricao, data_cadastro, valor_unitario, cod_categoria)
	VALUES('Miojo', '2021-10-15', '1.15', '2');
    
UPDATE PRODUTOS 
 SET cod_categoria = '1'
WHERE codigo = 6;

INSERT INTO PEDIDOS(quantidade, valor_unitario, data_pedido, cod_fornecedores, cod_produtos)
	VALUES('2','2.30', '2021-10-15', '1', '6');
    
INSERT INTO PEDIDOS(quantidade, valor_unitario, data_pedido, cod_fornecedores, cod_produtos)
	VALUES('1','102.30', '2021-10-15', '1', '4');
    
INSERT INTO PEDIDOS(quantidade, valor_unitario, data_pedido, cod_fornecedores, cod_produtos)
	VALUES('2','102.30', '2021-10-15', '1', '4');
    
SELECT * FROM PEDIDOS;

UPDATE PEDIDOS
 SET cod_fornecedores = '2'
WHERE codigo = 1;
    
DELETE FROM PEDIDOS
WHERE codigo = 2;
    
-- QUESTÃO 3 --
SELECT * FROM FORNECEDORES, CATEGORIAS, PRODUTOS, PEDIDOS;

-- QUESTÃO 4 --
SELECT *,
    valor_unitario*1.10 AS valor_novo
FROM PEDIDOS
WHERE valor_unitario > 10;

UPDATE PRODUTOS
    SET valor_unitario = valor_unitario * 1.10
WHERE valor_unitario > 10;

 -- QUESTÃO 5 --
 SELECT * FROM PEDIDOS 
 WHERE data_pedido >= '2021/10/01' AND 
       data_pedido<= '2021/10/31';

SELECT * FROM PEDIDOS
WHERE data_pedido between '2021-10-01' and '2021-10-31'

 
 -- QUESTÃO 6 --
 SELECT * FROM PRODUTOS 
 WHERE descricao LIKE 'palavra';