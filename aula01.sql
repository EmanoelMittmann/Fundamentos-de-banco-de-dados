/*CREATE TABLE clientes
(
    id int not null,
    nome varchar(150) not null,
    whats varchar(17),
    PRIMARY KEY (id) -- define a chave primaria no final;

);

CREATE TABLE clientes
(
    id INT not null,--define a chave primaria no inicio;
    nome CHAR(150) not null,
    whats CHAR(17),
    PRIMARY KEY id

);
--Qual a diferença entre CHAR(N) e VARCHAR(N)
/*
    cidade char(10)
    cidade_1 varchar(10)

    termo
    |||||||||| (char)
    oi||||||||
    alo|||||||
    chocol||||
    cassiocost

    termo_1

    oi
    alo
    chocol
    cassiocost

*/

/*
51981263079
(51) 9 8126-3079
60.153  x 7,00


--criar a tabela venda 
--com os clientes
--um cliente tem muitas vendas

CREATE TABLE vendas
(
    id int not null auto_increment primary
    data_emissao date not null,
    id_cliente int not null,
    constraint faz_venda
        foreign key(id_cliente)
            references clientes(id)

)
*/
/*
date - yyyy-mm-dd
datetime - yyyy-mm-dd hh:mm:ss
time - hh:mm:ss
timeStamp - yyyy-mm-dd hh:mm:ss
*/
CREATE TABLE produto
(
    id int not null auto_increment primary
    nome varchar(50) not null,
    valor float not null,
    quantidade int not null,
    id_categoria int not null,
     constraint possui
        foreign key(id_categoria)
            references(id)
)

create table categoria
(
    id int not null auto_increment primary
    nome varchar(50) not null,
)

create table fotos
(
    id int not null primary key
    url varchar(255) not null
   
);

create table fotos_produtos
(
    id_foto int not null
    id_produto int not null
    constraint fotos_produtos_fotos_fk
        foreign key(id-foto)
            references fotos(id)
    constraint fotos_produtos_produtos_fk
        foreign key(id_produto)
            references produto(id)
);