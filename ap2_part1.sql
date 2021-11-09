Create table clientes(
  	codigo int not null AUTO_INCREMENT PRIMARY key, 
  	cpf int(10) not null,
  	nome varchar(50),
  	telefone int(10) not null,
  	endereco varchar(50)
);

create table marca(
  	codigo int not null AUTO_INCREMENT PRIMARY KEY,
  	nome VARCHAR(50)
);

create table carros(
  	codigo int not null AUTO_INCREMENT PRIMARY key,
  	valor_aluguel DOUBLE,
  	placa_carro VARCHAR(30),
  	modelo_carro varchar(50),
  	ano_carro INT NOT NULL,
  	data_aluguel date,
  	data_devolucao date,
  	codigo_marca int not null,
  	CONSTRAINT fk_marca_carros
  		FOREIGN KEY (codigo_marca)
  			REFERENCES marca(codigo)
			on UPDATE CASCADE
  			on delete RESTRICT		
);

create table registro(
  	codigo int not null AUTO_INCREMENT PRIMARY key,
  	codigo_clientes int not null,
  	codigo_carros int not null,
  	CONSTRAINT fk_clientes_registro
  		FOREIGN key (codigo_clientes)
  			REFERENCES clientes(codigo)
  			on UPDATE CASCADE
  			on delete RESTRICT,	
  	CONSTRAINT fk_carros_registro
  		FOREIGN key (codigo_carros)
  			REFERENCES carros(codigo)
  			on UPDATE CASCADE
  			on delete RESTRICT	
);

insert into clientes(cpf, nome, telefone, endereco)
	VALUES
    	('0518745750', 'Murilo Andrades Lessa', '99784598', 'Rua da Mandioca'),
        ('0541020304', 'Emanoel Leffa Mittmann', '993654898', 'Rua da Banana'),
        ('0598754202', 'Nycole Becker Rodrigues', '978541258', 'Rua dos Cachorros'),
        ('0578945510', 'João Lorenzo Oliveira', '929893451', 'Rua das Hortaliças'),
        ('0569874522', 'Maria Costa Pinto', '991929491', 'Rua da Hortiga'),
		('0547896542', 'Andressa Cardoso Silva', '95784510', 'Rua das Antas');
        
select * from clientes

insert into marca(nome)
	VALUES
    	('CITROEN'),
        ('CHEVROLET'),
    	('VOLKSWAGEN'),
    	('FIAT'),
    	('VOLVO'),
    	('MERCEDES BENZ');
        
SELECT * FROM marca

INSERT INTO carros(valor_aluguel, placa_carro, modelo_carro, ano_carro, data_aluguel, data_devolucao, codigo_marca)
	VALUES	
    	('10.000', 'SYU7898', 'C3', '2011', '2021-05-10', '2022-05-10', '1'),
        ('2.000', 'QWK4125', 'ONIX', '2021', '2021-07-01', '2021-12-01', '2'),
        ('27.542', 'SWQ2365', 'NIVUS', '2018', '2020-04-23', '2023-05-23', '3'),
        ('12.265', 'WQW4478', 'PALIO', '2006', '2019-08-11', '2022-08-11', '4'),
        ('175.498', 'AWY9854E', 'AMG', '2018', '2020-03-01', '2024-03-01', '6'),
        ('150.005', 'OPL7898', 'XC60', '2021', '2021-09-18', '2022-09-18', '5');
  
UPDATE carros
SET valor_aluguel= '10.001'
WHERE codigo = 1

UPDATE carros
SET valor_aluguel= '2.001'
WHERE codigo = 2

SELECT * FROM carros   

insert into registro(codigo_clientes, codigo_carros)
	VALUES
    	('2', '4'),
        ('1', '5'),
        ('1', '3'),
        ('3', '2'),
        ('5', '1');
        
SELECT * FROM registro

-- PESQUISAR CARROS DO MÊS DE SETEMBRO DE 2021 --
 select * from carros
 where data_aluguel >= '2021-09-01' AND
 	   data_aluguel<= '2021-09-30';

-- PESQUISAR CLIENTE COM O SOBRENOME SILVA --
SELECT * FROM clientes
WHERE nome like '%Silva%';

-- AUMENTAR VALORES DO ALUGUEL EM 20% --
SELECT *,
    valor_aluguel*1.20 AS valor_novo_aluguel
FROM carros