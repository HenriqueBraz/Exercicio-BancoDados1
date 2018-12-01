create table aeroporto
(CODA char(3) not null,
NOMEA  varchar2(20) not null, 
CIDADE  varchar2(20) not null, 
PAIS  char(2) not null,
constraint PK_AEROPORTO primary key(CODA));

insert into aeroporto values ('poa','salgado filho','porto alegre','BR');
insert into aeroporto values ('gru','guarulhos','sao paulo','BR');
insert into aeroporto values ('gal','galeao','rio de janeiro','BR');
insert into aeroporto values ('rom','int de rome','roma','IT');
insert into aeroporto values ('stu','int de stutgart','stutgart','AL');
insert into aeroporto values ('gau','charles de gaulle','paris','FR');
insert into aeroporto values ('mun','int de munique','munique','AL');


create table voo
(CODV char(5)  not null, 
ORIGEM  char(3)  not null, 
DEST char(3)  not null,
HORA number not null,
constraint PK_VOO primary key(CODV),
constraint FK_AER_VOOORIG foreign key (ORIGEM) references aeroporto (CODA),
constraint FK_AER_VOODEST foreign key (DEST) references aeroporto (CODA));

insert into voo values ('RG230','gru','poa','7');
insert into voo values ('RG330','gru','rom','11');
insert into voo values ('RG430','poa','gru','14');
insert into voo values ('RG530','gru','gau','17');
insert into voo values ('RG531','gau','gru','11');
insert into voo values ('VS100','gru','rom','14');
insert into voo values ('VS150','rom','gru','7');
insert into voo values ('LF200','gru','stu','8');
insert into voo values ('LF210','stu','mun','17');
insert into voo values ('KL400','gal','stu','14');


create table piloto
(CODP  char(3) not null,
NOMEP  varchar2(10) not null, 
SALARIO  number not null, 
GRATIFICACOES number not null,  
TEMPO  number not null, 
PAIS  char(2) not null,
COMPANHIA varchar2(10) not null,
constraint PK_PILOTO primary key(CODP));

insert into piloto values ('p11','joao', 3000, 200, 5,'BR','varig');
insert into piloto values ('p13','pedro', 2000, 100, 5,'BR','varig');
insert into piloto values ('p12','paulo', 3000, 200, 3,'BR','varig');
insert into piloto values ('p21','antonio', 1500, 300, 7,'BR','vasp');
insert into piloto values ('p22','carlos', 5000, 200, 10,'BR','vasp');
insert into piloto values ('p31','hanz', 5000, 1000, 6,'AL','lufthansa');
insert into piloto values ('p41','roel', 5000, 2000, 5,'NL','klm');


create table escala
(CODV char(5) not null, 
DATA date not null,
CODP char(3),
AVIAO varchar2(10) not null,
constraint PK_ESCALA primary key(CODV, DATA),
constraint FK_PILOTO_ESCALA foreign key (CODP) references piloto (CODP),
constraint FK_VOO_ESCALA foreign key (CODV) references voo (CODV));

insert into escala values('RG230','01-Maio-2003','p11','737');
insert into escala values('RG230','01-Junho-2003','p11','737');
insert into escala values('VS100','01-Maio-2003','p21','MD11');
insert into escala values('LF200','01-Maio-2003','p31','MD11');
insert into escala values('RG330','01-Junho-2003','p12','737');
insert into escala values('RG330','01-Julho-2003','p12','MD11');
insert into escala values('RG530','01-Maio-2003','p12','MD11');
insert into escala values('LF200','01-Junho-2003','p31','MD11');
insert into escala values('KL400','01-Maio-2003','p41','MD11');
insert into escala values('LF210','01-Maio-2003','p31','MD11');
insert into escala values('VS150','01-Junho-2003','p21','MD11');

Exercícios – Consultas

1) O nome de todos os pilotos da varig.
select nomep
from piloto
where companhia = 'varig';

NOMEP
----------
joao
pedro
paulo

2) O nome de todos os pilotos, junto com seu salário e gratificação.
select nomep, salario, gratificacoes
from piloto;

NOMEP        SALARIO GRATIFICACOES
---------- --------- -------------
joao            3000          200
pedro          2000          100
paulo          3000          200
antonio        1500          300
carlos          5000          200
hanz            5000          1000
roel            5000          2000

3) O nome da cidade e país de destino do voo RG230.
select cidade, pais
from aeroporto, voo
where dest = coda and codv='RG230';

CIDADE              PAIS
-------------------- ----
porto alegre        BR

4) A companhia dos vôos escalados para 1-Maio-2003.
select distinct companhia
from piloto, escala
where piloto.codp = escala.codp and
data = '01-MAY-03';

COMPANHIA
----------
klm
lufthansa
varig
vasp

5) O código de todos os vôos, nome dos pilotos escalados para os mesmos, e respectivos tipo de avião e companhia.
select distinct codv, nomep, aviao, companhia
from piloto, escala
where piloto.codp = escala.codp;

CODV  NOMEP      AVIAO      COMPANHIA
----- ---------- ---------- ----------
KL400 roel      MD11      klm
LF200 hanz      MD11      lufthansa
LF210 hanz      MD11      lufthansa
RG230 joao      737        varig
RG330 paulo      737        varig
RG330 paulo      MD11      varig
RG530 paulo      MD11      varig
VS100 antonio    MD11      vasp
VS150 antonio    MD11      vasp

6) O código de todos os vôos que iniciam por RG ou VS, junto com a respectiva companhia.
select distinct codv, companhia
from piloto p, escala e
where p.codp = e.codp and
(codv like 'VS%' or codv like 'RG%');

CODV  COMPANHIA
----- ----------
RG230 varig
RG330 varig
RG530 varig
VS100 vasp
VS150 vasp

7) O código de todos os vôos para a Alemanha ou Itália, com as respectivas data e hora de saída.
select v.codv, data, hora
from voo v, escala e, aeroporto
where e.codv = v.codv
and dest = coda
and (pais = 'IT' or pais = 'AL');

CODV  DATA          HORA
----- -------- ---------
VS100 01/05/03        14
LF200 01/05/03        8
RG330 01/06/03        11
RG330 01/07/03        11
LF200 01/06/03        8
KL400 01/05/03        14
LF210 01/05/03        17

8) O nome de todos os aeroportos onde a varig opera.
select distinct nomea as aeroporto
from piloto p, escala e, voo v, aeroporto
where companhia = 'varig' and
p.codp = e.codp and
e.codv = v.codv and
(origem = coda or dest = coda);

AEROPORTO
--------------------
charles de gaulle
guarulhos
int de rome
salgado filho

9) O salário do piloto mais bem pago da varig.
select max(salario)
from piloto
where companhia = 'varig';

MAX(SALARIO)
------------
        3000

10) O menor, maior, e média dos salários dos pilotos de companhias brasileiras.
select min(salario), max(salario), avg(salario)
from piloto
where pais = 'BR';

MIN(SALARIO) MAX(SALARIO) AVG(SALARIO)
------------ ------------ ------------
        1500        5000        2900

11) O número de aeroportos no Brasil.
select count(*)
from aeroporto
where pais = 'BR';

COUNT(*)
---------
        3

12) O número de diferentes vôos que a varig oferece para São Paulo.
select count(distinct v.codv)
from piloto p, escala e, voo v, aeroporto
where p.codp = e.codp and e.codv = v.codv and coda = dest
      and companhia = 'varig';

COUNT(DISTINCTV.CODV)
---------------------
                    3

13) Para cada companhia, o menor, maior salário, bem como a média.
select companhia, min(salario), max(salario), avg(salario)
from piloto
group by companhia;

COMPANHIA  MIN(SALARIO) MAX(SALARIO) AVG(SALARIO)
---------- ------------ ------------ ------------
klm                5000        5000        5000
lufthansa          5000        5000        5000
varig              2000        3000    2666,6667
vasp              1500        5000        3250

14) Para cada cidade do Brasil, o número de aeroportos que possui.
select cidade, count(*)
from aeroporto
where pais = 'BR'
group by cidade;

CIDADE                COUNT(*)
-------------------- ---------
porto alegre                1
rio de janeiro              1
sao paulo                    1

15) Para cada dia e hora, o número de vôos que partem pela manhã.
select data, hora, count(*)
from voo, escala
where hora <= 12 and voo.codv = escala.codv
group by data, hora ;

DATA          HORA  COUNT(*)
-------- --------- ---------
01/05/03        7        1
01/05/03        8        1
01/06/03        7        2
01/06/03        8        1
01/06/03        11        1
01/07/03        11        1

16) As companhias que pagam como salário mais alto a seus pilotos menos que 2.000.
select companhia
from piloto
group by companhia
having max(salario) < 2000;

não há linhas selecionadas

17) As companhias brasileiras que possuem pelo menos 2 pilotos.
select companhia
from piloto
where pais = 'BR'
group by companhia
having count(*) > 1;

COMPANHIA
----------
varig
vasp

18) As companhias que só usam um tipo de avião.
select companhia
from piloto, escala
where piloto.codp = escala.codp
group by companhia
having count(distinct aviao) = 1;

COMPANHIA
---------
klm
lufthansa
vasp

19) O código dos pilotos cujos vôos escalados sempre tem a mesma destinação.
select codp
from escala, voo
where escala.codv = voo.codv
group by codp
having count(distinct dest) = 1;

COD
---
p11
p41

20) O nome do país que é destino apenas de vôos para os quais sempre o mesmo piloto é escalado.
select pais
from escala, voo, aeroporto
where escala.codv = voo.codv and dest = coda
group by pais
having count(distinct codp) = 1;

PA
--
FR

21) As companhias que voam de MD11
select distinct companhia
from piloto p, escala e 
where p.codp = e.codp and aviao = 'MD11';

COMPANHIA
----------
klm
lufthansa
varig
vasp

22) As companhias que não voam de MD11
select distinct companhia
from piloto
where companhia not in
(select distinct companhia
from piloto p, escala e
where p.codp = e.codp and aviao = 'MD11');

no rows selected

23) O nome dos pilotos que voam de MD11 ou de 737
select distinct nomep
from piloto p, escala e
where p.codp = e.codp and (aviao = 'MD11' or aviao = '737');

NOMEP
----------
antonio
hanz
joao
paulo
roel

24) O nome dos pilotos que voam de MD11 e de 737
select distinct nomep
from piloto p, escala e
where p.codp = e.codp and aviao = 'MD11'
and p.codp in
(select distinct codp
from escala
where aviao = '737');

NOMEP
----------
paulo

25) O nome das companhia que empregam pelo menos dois pilotos
select distinct companhia
from piloto p
group by companhia
having count(codp) > 1;

COMPANHIA
----------
varig
vasp

26) O nome dos pilotos que trabalham para companhias que empregam pelo menos dois pilotos.
select nomep
from piloto
where companhia in
(select distinct companhia
from piloto p
group by companhia
having count(codp) > 1);

NOMEP
----------
joao
pedro
paulo
antonio
carlos

27) O nome dos pilotos que ganham menos que a média salarial
select distinct nomep, salario
from piloto
where salario < (select avg(salario) from piloto);

NOMEP        SALARIO
---------- ---------
antonio        1500
joao            3000
paulo          3000
pedro          2000