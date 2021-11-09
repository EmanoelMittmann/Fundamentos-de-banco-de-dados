create table tipo_socio(
  	codigo int not null AUTO_INCREMENT PRIMARY key,
  	descricao varchar(50)
);

create table socio(
  	codigo int not null AUTO_INCREMENT PRIMARY key,
  	nome varchar(50),
  	telefone int (10) not null,
  	endereco varchar(50),
  	codigo_tipo_socio int not null,
  	CONSTRAINT fk_tipo_socio_socio
  		FOREIGN key (codigo_tipo_socio)
  			REFERENCES tipo_socio(codigo)
  			on update CASCADE
  			on delete RESTRICT
);


create table servicos(
  	codigo int not null AUTO_INCREMENT PRIMARY key,
  	descricao varchar(100),
  	mes_referencia DATE,
  	valor_pago double,
  	codigo_socio int not null,
  	CONSTRAINT fk_socio_servicos
  		FOREIGN key (codigo_socio)
  			REFERENCES socio(codigo)
  			on UPDATE CASCADE
  			on DELETE RESTRICT
);

insert into tipo_socio(descricao)
	VALUES 
    	('Sócio Administrativo'),
        ('Sócio Cotista'),
    	('Sócio Proprietário');
        
select * from tipo_socio

insert into socio(nome, telefone, endereco, codigo_tipo_socio)
	VALUES
    	('Claudemir Padilha Silva', '519955994', 'Rua Barão do Rio Branco', '2'),
         ('Domingues Ribeiro Neto', '519697194', 'Rua Alphavile', '1'),
    	('Vicente Cardoso Teixeira', '519955212', 'Rua Lindoia', '3'),
    	('Bruna Padilha Castro', '559833456', 'Rua das Acácias', '3'),
    	('Joelma Adriana Fernandes', '549785961', 'Rua dos Amaldiçoados', '2'),
    	('Cassiana Dimmer Pedroso', '519226457', 'Rua dos Desiludidos', '1');
        
SELECT * from socio

insert into servicos(descricao, mes_referencia, valor_pago, codigo_socio)
	VALUES
    	('Construção de um novo edifício', '2021-10-01', '148752', '4'),
        ('Contratação de uma nova faxineira temporária de 3 meses', '2021-08-10', '3752', '1'),
    	('Contratação de uma secretária fixa com contrato de 2 anos', '2020-01-18', '1327', '6'),
        ('Reforma do escritório', '2020-01-27', '14789', '3'),
        ('Construção de um novo cômodo - 4x4', '2021-12-06', '20752', '2'),
        ('Reforma do banheiro do escritório', '2019-03-29', '4102', '5');
        
SELECT * FROM servicos

-- SERVIÕES ONDE O VALOR PAGO É MAIOR QUE 500 --
SELECT * FROM servicos
where valor_pago > 500;

-- PEDIDOS ONDE O MÊS DE REFERÊNCIA É JANEIRO DE 2020 --
select * from servicos
where mes_referencia >= '2020-01-01' AND
	  mes_referencia <= '2020-01-31';

-- SÓCIOS QUE MORAM NA RUA BARÃO DO RIO BRANCO --
select * from socio
where endereco = 'Rua Barão do Rio Branco';