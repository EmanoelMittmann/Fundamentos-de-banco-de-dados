DROP TABLE projeto;
DROP TABLE colaboradores;
DROP TABLE test;

CREATE TABLE colaboradores
(
    id INT NOT null AUTO_INCREMENT PRIMARY KEY.
    nome VARCHAR(70) NOT null,
    data_nasC date
);

CREATE TABLE PROJETOS 
(
    id INT NOT null AUTO_INCREMENT,
    nome VARCHAR(70)
    descricao VARCHAR(500)
    estimativa_horas INT DEFAULT 0
    id_colaborador int not null
    CONSTRAINT colaboradores_do_projeto_fk
        foreign key(id_colaborador)
            references colaboradores(id)

    PRIMARY KEY(id)
);

CREATE TABLE projetos_participantes
(
    id_participante INT NOT null,
    id_projeto INT NOT null,
    CONSTRAINT participantes_projeto_fk
        FOREIGN key(id_participante)
            REFERENCES participantes_projetos_fk(id);
    CONSTRAINT participantes_projetos_fk
        FOREIGN(id_projeto)
            REFERENCES projetos(od)
)
