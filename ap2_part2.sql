create table pesquisador(
  	codigo int not null AUTO_INCREMENT PRIMARY key,
  	nome varchar(50),
  	cpf int(11) not null
);

create table periodico_artigo(
	codigo int not null AUTO_INCREMENT PRIMARY key,
  	nome varchar(50),
  	descricao varchar(500)
);

create table artigos(
  	codigo int not null AUTO_INCREMENT PRIMARY key,
  	titulo varchar(50),
  	pagina_inicial varchar(10000),
  	editora varchar(50),
  	codigo_pesquisador int not null,
  	codigo_periodico_artigo int not null,
  	CONSTRAINT fk_pesquisador_artigos
  		FOREIGN key (codigo_pesquisador)
  			REFERENCES pesquisador(codigo)
  			ON UPDATE CASCADE
  			ON DELETE RESTRICT,
  	CONSTRAINT fk_periodico_artigo_artigos
  		FOREIGN key (codigo_periodico_artigo)
  			REFERENCES periodico_artigo(codigo)
  			on UPDATE CASCADE
  			on delete RESTRICT
);

insert into pesquisador(nome, cpf)
	VALUES
    	('Adam Castro Roxo', '0518745697'),
        ('Melissa Nunes Viana', '0225645697'),
    	('Roberto Nogueira Oliveira', '0512545697'),
    	('Amelica Pereira Roxo', '0498745697'),
    	('João Candido da Lima', '0547841297');
     
select * from pesquisador

INSERT INTO periodico_artigo(nome, descricao)
	VALUES
    	('Revista Associativa dos Pesquisadores', 'Publicado em novembro de 1950'),
        ('Comunidade Associativa dos Guris', 'Publicado em janeiro de 2021'),
        ('Biblioteca Administrativa de Pesquisas', 'Publicado em agosto de 2005'),
        ('Revistoteca dos Agentes Universitários', 'Publicado em setembro de 2009'),
        ('Amigos dos Pesquisadores Unidos', 'Publicado em fevereiro de 2016');
        
select * from periodico_artigo

insert into artigos(titulo, pagina_inicial, editora, codigo_pesquisador, codigo_periodico_artigo)
	VALUES
    	('A volta dos que não foram', 'A história conta sobre a volta daqueles que foram e não voltaram', 'SARAIVA', '2', '1'),
        ('Os índios do Além', 'A histórica contra sobre os índios que saíram de seus refúgios para buscarem o além', 'SARAIVA', '1', '5'),
        ('O mau que vem para o bem', 'A história contra sobre o mau que algumas vezes serve para o bem', 'CANCUN', '5', '2'),
        ('As trevas do Litoral' , 'A história contra sobre trevas que beiram o litoral', 'NAVEGAÇÃO', '4', '3');
        
     SELECT * FROM artigos
     
     -- LISTAR ARTIGO COM O CÓDIGO 1234
     SELECT * from artigos
     where codigo_periodico_artigo like '1234';
     
     -- LISTAR ARTIGOS DA EDITORA SARAIVA --
     SELECT * from artigos
     where editora like 'SARAIVA';
     
     -- LISTAR OS PESQUISADORES ONDE O NOME INICIA COM JOÃO --
     SELECT * FROM pesquisador
     WHERE nome like 'João%';