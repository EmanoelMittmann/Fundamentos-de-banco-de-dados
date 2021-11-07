/*
    Medico(codmed, nome, endereço, telefone, crm, cpf, codcid)
        Codcid referencia cidade(codcid)
    Paciente(codpac, nome, endereço, telefone, codcid)
        codcid referencia cidade(codcid)
    cidade(codcid, nome, UF)
    consulta(codconsulta, codmed, codpac, data, hora) 
        codmec referencia Medico(codmed)
        codpac referencia Paciente   
    prescriçao(codconsulta, codmedicamento, posologia)
        codconsulta referencia Consulta(codconsulta)
        codmedicamento referencia medicamento(codmedicamento)
    Medicamento(codmedicamento, nome, composição, preco)
*/

--listar os nomes das cidades do estados RS.
select codcid, nome, UF -- por ultimo ele executa o select
from cidades -- 1o
where UF = 'RS' --2o

--Listar todos os nomes de medicamentos e preco.
select nome, preco
from medicamentos

--Mostrar a média de preços dos medicamentos.
--Usar funcoes avg, count, max, min, sum

select avg(preco) as preços
from medicamentos

-- Mostrar o numero total de consultas cadastradas.

select count(codconsulta) as total_de_consultas
from consultas

total_de_consultas
-------
1500

-- Listar o nome do medicamento mais caro.
select max(preco) mais_caro
from medicamentos

mais_caro
----
590.98

-- Listar os nomes do medicamentos acima da media.

select avg(preco) as media
from medicamento

media
---
67.98

select nome
from medicamento
where preco > (select avg(preco) from medicamentos)