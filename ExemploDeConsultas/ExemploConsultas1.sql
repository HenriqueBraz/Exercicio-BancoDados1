create table encargos(
professor varchar2(50),
disciplina varchar2(50),
primary key (professor,disciplina));

insert into encargos values('Arruda','Banco de Dados II');
insert into encargos values('Arruda','Engenharia de Software I');
insert into encargos values('Arruda','Engenharia de Software II');
insert into encargos values('Bastos','Engenharia de Software I');
insert into encargos values('Bastos','Engenharia de Software II');
insert into encargos values('Duncan','Banco de Dados I');
insert into encargos values('Duncan','Banco de Dados II');
insert into encargos values('Duncan','Engenharia de Software I');
insert into encargos values('Karin','Engenharia de Software I');
insert into encargos values('Yamaguti','Engenharia de Software I');
insert into encargos values('Yamaguti','Engenharia de Software II');
insert into encargos values('Peres','Banco de Dados I');
insert into encargos values('Peres','Banco de Dados II');

-- (a) Disciplinas que Bastos ministra:

select distinct disciplina
from encargos e
where e.professor = 'Bastos';

-- (b) Disciplinas que Bastos não ministra:

select distinct disciplina
from encargos e1
where not exists ( select distinct disciplina
                            from encargos e
                            where e.professor = 'Bastos'
                            and e1.disciplina = e.disciplina);
    
-- (c) Professores que ministram alguma disciplina que Bastos ministra:

select distinct e1.professor
from encargos e1
where e1.professor <> 'Bastos'
and exists (select distinct disciplina
                  from encargos e
                  where e.professor = 'Bastos'
                  and e.disciplina = e1.disciplina);

-- (d) Professores que ministram alguma disciplina que Bastos não ministra:

select distinct professor
from encargos e1
where not exists ( select distinct disciplina
                            from encargos e
                            where e.professor = 'Bastos'
                            and e1.disciplina = e.disciplina);

-- (e) Professores que ministram em TODAS as disciplinas que Bastos ministra:

select distinct e1.professor
from encargos e1
where e1.professor <> 'Bastos'
and not exists (select distinct disciplina
                        from encargos e
                        where e.professor = 'Bastos'
                        and not exists (select *
                                        from encargos
                                        where encargos.disciplina = e.disciplina
                                        and encargos.professor = e1.professor));

select distinct e1.professor
from encargos e1
where e1.professor <> 'Bastos'
and not exists (select distinct disciplina
                        from encargos e
                        where e.professor = 'Bastos'
                  minus
                        select distinct disciplina
                        from encargos
                        where encargos.professor = e1.professor);


-- (f) Professores que não ministram em NENHUMA disciplina onde Bastos ministra:

select distinct e1.professor
from encargos e1
where not exists (select distinct disciplina
                            from encargos e
                            where e.professor = 'Bastos'
                            and exists (select *
                                        from encargos
                                        where encargos.disciplina = e.disciplina
                                        and encargos.professor = e1.professor));

select distinct e1.professor
from encargos e1
where not exists (select distinct disciplina
                            from encargos e
                            where e.professor = 'Bastos'
                        intersect 
                            select distinct disciplina
                            from encargos
                            where encargos.professor = e1.professor);

-- (g) Professores que não ministram disciplinas que Bastos não ministra:

select distinct e1.professor
from encargos e1
where e1.professor <> 'Bastos'
and not exists
                      (select *
                        from encargos e2
                        where not exists (select distinct disciplina
                    from encargos e
                                                  where e.professor = 'Bastos'
                                                  and e.disciplina = e2.disciplina)
                        and e2.professor = e1.professor);

select distinct e1.professor
from encargos e1
where e1.professor <> 'Bastos'
and not exists (select distinct disciplina
                        from encargos
                        where encargos.professor = e1.professor
                  minus
                        select distinct disciplina
                        from encargos e
                        where e.professor = 'Bastos');


-- h) Professores que ministram EXATAMENTE nas disciplinas onde Bastos ministra

select distinct e1.professor
from encargos e1
where e1.professor <> 'Bastos'
and not exists (select distinct disciplina
                        from encargos e
                        where e.professor = 'Bastos'
                        and not exists  (select *
                                                from encargos
                                                where encargos.disciplina = e.disciplina
                                                and encargos.professor = e1.professor))
and not exists 
                      (select *
                        from encargos e2
                        where not exists (select distinct disciplina
                                                from encargos e
                                                where e.professor = 'Bastos'
                                                and e2.disciplina = e.disciplina)
                        and e2.professor = e1.professor);

select distinct e1.professor
from encargos e1
where e1.professor <> 'Bastos'
and not exists (select distinct disciplina
                        from encargos e
                        where e.professor = 'Bastos'
                  minus
                        select distinct disciplina
                        from encargos
                        where encargos.professor = e1.professor)
and not exists (select distinct disciplina
                        from encargos
                        where encargos.professor = e1.professor
                  minus
                        select distinct disciplina
                        from encargos e
                        where e.professor = 'Bastos');