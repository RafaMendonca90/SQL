use curso_sql;

insert into funcionários (id, nome, salário, departamento) values(1,'Fernando', 1400, 'TI');
insert into funcionários (id, nome, salário, departamento) values(2,'Guilherme', 2500, 'Jurídico');
insert into funcionários ( nome, salário, departamento) values('Astronilda',1300, 'Marketing');
insert into funcionários ( nome, salário, departamento) values('José',1700, 'TI');
insert into funcionários ( nome, salário, departamento) values('Isabela',2200, 'Jurídico');
delete from funcionários where nome='Astronilda';

select * from funcionários;

insert into veículos (funcionário_id, veículo, placa) values (1, 'carro','SB-0001');
insert into veículos (funcionário_id, veículo, placa) values (2, 'carro','SB-0002');
update veículos set funcionário_id=5 where id=2;

select * from veículos;

update funcionários set salário=salário*1.1 where id= 1;

set sql_safe_updates=0;
/*set sql_safe_updates=1; para retornar o safe update*/
update funcionários set salário=salário*1.1;
update funcionários set salário=round(salário*1.1,2);

insert into salários (faixa, inicio, fim) values ('Analista Jr', 1000, 2000);
insert into salários (faixa, inicio, fim) values ('Analista Pleno', 2000, 4000);

select * from salários;

select * from funcionários where nome='Fernando'
union 
select * from funcionários where id = 2;
