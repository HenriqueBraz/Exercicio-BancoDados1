---a)Consultas Básicas:

--selecione o nome de todas as constelaçoes catalogadas por ordem alfabética
SELECT * from constelacoes
ORDER BY nome;


--selecione todos os anos anteriores a 2000 em que foram descobertos planetas, sem repetições.
SELECT DISTINCT ano_descoberta  from PLANETAS
WHERE ano_descoberta < 2000; 


--selecione o nome de todas as estrelas que começam com a letra A
select nome, imagem from ESTRELAS
WHERE nome LIKe 'A%'; 


--selecione a quantidade de constelações catalogadas no banco de dados
select count (cod_id)
from CONSTELACOES;


--selecione  as constelações de leão, Virgem e Escorpião
select * from constelacoes
where nome in ('Leo','Virgo','Scorpius');


---b)Consultas com junçoes:

--selecione o nome de todos os planetas do sistema solar
select p.nome, p.imagem  
from planetas p join estrelas e on (p.orbita_estelar = e.cod_id)
where e.nome = 'Sol';

--selecione o nome de todas as galaxias do grupo local
select g.nome, g.imagem
from galaxias g join aglomerados a on (g.aglomerado = a.cod_id)
where a.nome = 'Grupo Local';

--selecione todos os planetas e o número de Luas cuja as estrelas fazem parte da constelação de Orion 
select p.nome, p.satelites
from planetas p join estrelas e on (p.orbita_estelar = e.cod_id)
join constelacoes c on (e.constelacao = c.cod_id)
where c.nome = 'Orion';

--selecione todas as constelações que pertençam ao gupo local
select c.nome 
from constelacoes c join galaxias g on (c.galaxia = g.cod_id)
join aglomerados a on (g.aglomerado = a.cod_id)
where a.nome = 'Grupo Local';

--selecione todos os planetas e luas que fazem parte da constelaçao de Libra
select p.nome, p.satelites, p.imagem
from planetas p join estrelas e on (p.orbita_estelar = e.cod_id)
join constelacoes c on (e.constelacao = c.cod_id)
where c.nome = 'Libra'; 

---c)Consultas com group by, having e funçoes de agregação:

--qual a quantidade de planetas descobertos em cada estrela catalogada, em ordem de quantidade?
select e.nome, count (p.nome)
from planetas p join estrelas e on (p.orbita_estelar = e.cod_id)
group by e.nome
order by count(p.nome) desc;

--qual a quantidade de estrelas catalogadas por constelação?
select c.nome, count(e.nome), 
from estrelas e join constelacoes c on (e.constelacao = c.cod_id)
group by c.nome;

--qual a quantidade de galaxias catalogadas por aglomerado, em ordem de quantidade?
select a.nome, count(g.nome)
from galaxias g join aglomerados a on (g.aglomerado = a.cod_id)
group by a.nome
order by count(g.nome) desc;

--qual o nome e a quantidade de estrelas catalogadas em todas as galaxias?
select g.nome, count(e.nome) 
from estrelas e join constelacoes c on (e.constelacao = c.cod_id)
join galaxias g on (c.galaxia = g.cod_id)
group by g.nome; 


-- Qual o codigo e nome da constelação e a quantidade de estrelas cadastradas no sistema que tenha mais de uma estrela
select c.cod_id, c.nome, count(e.cod_id) 
from constelacoes c inner join estrelas e on e.constelacao = c.cod_id 
group by c.cod_id, c.nome having count(e.cod_id) > 1;


---c)Consultas com sub-consultas:

--Selecione os planetas com o mesmo número de satéltes cuja a gravidade superficial sejam diferente da terra 
select nome, satelites, imagem
from planetas
where GRAVIDADE_SUPERFICIAL != '9,780327 m/s²' and satelites =
        (select max(satelites)
          from planetas
          where  categoria = 'Planeta');
		  
		  
-- Buscar o nome da constelação e seu significado, o nome de sua galaxia e a quantidade de estrelas cadastrada para a galaxia
select c.nome, c.significado, 
(select g.nome from galaxias g where g.cod_id = c.galaxia) as galaxia, 
(select count(e.cod_id) from estrelas e where e.constelacao = c.cod_id group by e.constelacao) as n_estrelas from constelacoes c;


--selecione os planetas com maiores números de satélites cuja a gravidade sejam diferentes da de Júpiter
select nome, satelites, categoria, gravidade_superficial, imagem
from planetas
where GRAVIDADE_SUPERFICIAL != '24,79 m/s²' and satelites >
        (select count(satelites)
          from planetas
          where  categoria = 'Gigante Gasoso');
		  
		  
-- Selecionar o nome e o diametro da galaxia "21" com todos os nomes e imagem de todas as estrelas cadastradas para essa galaxia.
select g.nome, g.diametro, e.nome, e.imagem 
from galaxias g left join estrelas e on e.constelacao in (select c.cod_id from constelacoes c where c.galaxia = g.cod_id)
where g.cod_id = 21;

-- Buscar o nome do planeta codigo "3", a sua categoria e concatenar a lista de planetas de mesma órbita estelar.
select p.nome, p.categoria, (select LISTAGG(p2.nome, '; ') WITHIN GROUP (ORDER BY p2.nome asc) 
from planetas p2 where p2.orbita_estelar = p.orbita_estelar and p2.cod_id <> p.cod_id) 
as vizinhos 
from planetas p 
where p.cod_id = 3;		  


