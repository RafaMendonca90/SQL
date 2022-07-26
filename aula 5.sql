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

select * from veículos where veículo is null;

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






select * from funcionários inner join veículos on funcionário_id=funcionários.id;

select * from funcionários left join veículos on funcionário_id=funcionários.id;
select * from funcionários full join veículos on funcionário_id=funcionários.id;

select * from funcionários left join veículos on funcionário_id=funcionários.id
union
select * from funcionários right join veículos on funcionário_id=funcionários.id;


insert into veículos (funcionário_id, veículo, placa) values (null, 'moto','SB-0003');

create table cpfs
(
	id int unsigned not null,
    cpf varchar(14) not null,
    primary key (id),
    constraint fk_cpf foreign key (id) references funcionários (id)
);

insert into cpfs (id,cpf) values ( 1,'111.111.111-11');
insert into cpfs (id,cpf) values ( 2,'222.222.222-22');
insert into cpfs (id,cpf) values ( 5,'333.333.333-33');
insert into cpfs (id,cpf) values ( 6,'444.444.444-44');
insert into cpfs (id,cpf) values ( 7,'555.555.555-55');

select * from cpfs;

select * from funcionários join cpfs using(id);

create table clientes
(
id int unsigned not null auto_increment,
nome varchar(45) not null,
quem_indicou int unsigned,
primary key (id),
constraint fk_quem_indicou foreign key (quem_indicou) references clientes(id)
);

insert into clientes ( nome, quem_indicou) values ( 'André', null );
insert into clientes ( nome, quem_indicou) values ( 'Samuel',1 );
insert into clientes ( nome, quem_indicou) values ( 'Carlos',2 );
insert into clientes ( nome, quem_indicou) values ( 'Rafael',1 );

select a.nome as cliente , b.nome as 'quem indicou' from clientes a join clientes b on a.quem_indicou=b.id;