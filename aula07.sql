/*Medico(codmed, nome, endereço, telefone, crm, cpf, codcid)
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
-- Listar todos os medicos e sua respectiva cidade

select m.id, m.nome, m.id_cidade, c.nome as cidade
from cidade c, Medico m, consultas cl
where cidades.id = medico.id_cidade and
      cl.id_medico = m.id

--escrever com join

select m.id, m.nome as medico, m.id_cidade, c.nome as cidade
from   cidades c inner join medicos m 
                ON m.id_cidade = c.id_cidade
            inner join consultas cl
                ON cl.id_medico = m.id

-- mesma consulta

id     nome     id_cidade     cidade
-------------------------------------
1      Cassio    1            Torres
2      Douglas   2            Capao da canoa
3      Diego     3            Passo de torres

-- mostrar tambem as consultas desses medicos destas cidades

select m.id, m.nome, m.id_cidade, c.nome as cidade, c.data, c.vlaor
from cidade c, Medico m, consultas cl
where cidades.id = medico.id_cidade and
      cl.id_medico = m.id

id     nome     id_cidade     cidade                data         valor
-------------------------------------#------------------------------
1      Cassio    1            Torres                2021-11-01   100   
2      Douglas   2            Capao da canoa        2022-01-05   160
3      Diego     3            Passo de torres       2023-07-12   700

-- Listar o nome e telefone dos medicos da cidade de 'Torres'.
select m.nome as medico, m.telefone, c.nome as cidade
from cidades c
        inner join medicos m
            ON m.id_cidade = c.id_cidade

Nome    Telefone    Cidade
Julia   519883925   Torres
Enio    558918092   Passo de Torres
Amanda  null        Capao da canoa

--Listar todas os nomes dos medicamentos, juntamente com a posologia,
    --prescritos na consultas de codigo 1.

from medicamentos m
        inner join prescritos p
            on p.id_medicamento = m.id
where p.id_consulta = 1

--listar todas as consultas com o nome do medico,
    --nome do Paciente, data e hora.
select medico m, paciente p, consultas c
from m.nome as medico,p.nome as paciente,c.hora,c.data 
        inner join consultas c 
            ON m.id = c.id_medico
        inner join paciente p
            ON p.id = c.id_paciente


--quais medicamentos a dr.julia utilizou nas suas consultas do mes de 
-- outubro de 2021. O codigo da dr.julia é 3999

select m.nome as medico, M.nome as Medicamento
from prescriçao p 
    inner join consulta c 
        on c.id = p.id_consulta
    inner join medico m 
        on m.id = c.id_medico
    inner join medicamento b on b.id = p.id_medicamento

where m.id =3999 and c.dara between '2021/10/01' and '2021/10/30'