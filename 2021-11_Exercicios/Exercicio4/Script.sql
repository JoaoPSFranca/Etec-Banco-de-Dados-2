drop schema if exists BDEx4;
create schema BDEx4;
use BDEx4;

create table sexo (
	cd_sexo int,
	nm_sexo varchar(50),
	constraint pk_sexo primary key (cd_sexo)
);

create table modalidade(
	cd_modalidade int,
	nm_modalidade varchar(100),
	constraint pk_modadalidade primary key (cd_modalidade)
);

create table dia_semana(
	cd_dia_semana int, 
	nm_dia_semana varchar(50),
	constraint pk_dia_semana primary key (cd_dia_semana)
);

create table professor(
	cd_cpf_professor double,
	nm_professor varchar(250),
	nm_telefone_professor varchar(21),
	ds_email text,
	dt_nascimento date,
	vl_salario decimal(10,2),
	constraint pk_professor primary key (cd_cpf_professor)
);

create table aluno(
	cd_cpf_aluno double,
	nm_aluno varchar(250),
	ds_endereco_aluno text,
	nm_telefone varchar(21),
	cd_sexo int,
	constraint pk_aluno primary key (cd_cpf_aluno),
	constraint fk_aluno_sexo foreign key (cd_sexo)
		references sexo (cd_sexo)
);

create table avaliacao(
	dt_avaliacao date, 
	cd_cpf_aluno double,
	cd_cpf_professor double,
	qt_peso int, 
	qt_altura int, 
	qt_largura_triceps int,
	qt_largura_biceps int,
	constraint pk_avaliacao primary key (dt_avaliacao, cd_cpf_aluno, cd_cpf_professor),
	constraint fk_avaliacao_aluno foreign key (cd_cpf_aluno)
		references aluno (cd_cpf_aluno),
	constraint fk_avaliacao_professor foreign key (cd_cpf_professor)
		references professor (cd_cpf_professor)
);

create table turma(
	cd_turma int, 
	cd_cpf_professor double,
	cd_modalidade int,
	constraint pk_turma primary key (cd_turma),
	constraint fk_turma_professor foreign key (cd_cpf_professor)
		references professor (cd_cpf_professor),
	constraint fk_turma_modalidade foreign key (cd_modalidade)
		references modalidade (cd_modalidade)
);

create table turma_aluno(
	cd_cpf_aluno double,
	cd_turma int,
	constraint pk_turma_aluno primary key (cd_cpf_aluno, cd_turma),
	constraint fk_turma_aluno_aluno foreign key (cd_cpf_aluno)
		references aluno (cd_cpf_aluno),
	constraint fk_turma_aluno_turma foreign key (cd_turma)
		references turma (cd_turma)
);

create table dia_turma(
	cd_turma int,
	cd_dia_semana int,
	hr_horario time,
	constraint pk_dia_turma primary key (cd_turma, cd_dia_semana),
	constraint fk_dia_turma_turma foreign key (cd_turma)
		references turma (cd_turma),
	constraint fk_dia_turma_dia_semana foreign key (cd_dia_semana)
		references dia_semana (cd_dia_semana)
);

insert into sexo values (1, ' Feminino');
insert into sexo values (2, ' Masculino');

insert into modalidade values (11, ' Capoeira');
insert into modalidade values (12, ' Boxe');
insert into modalidade values (13, ' Jiu-jitsu');

insert into dia_semana values (21, ' Domingo');
insert into dia_semana values (22, ' Segunda');
insert into dia_semana values (23, ' Terça');
insert into dia_semana values (24, ' Quarta');
insert into dia_semana values (25, ' Quinta');
insert into dia_semana values (26, ' Sexta');
insert into dia_semana values (27, ' Sábado');

insert into professor values (46531365641, ' Wanda Marins Cardoso', '(81) 99753-5964', 'wanda.cardoso@geradornv.com.br', '1980-11-18', 1440.51);
insert into professor values (75903227252, ' Leandra Dores Ximenes', '(96) 99681-9936', 'leandra.ximenes@geradornv.com.br', '1975-09-29', 7358.13);
insert into professor values (83503542329, ' Mariano Vidal Boelho', '(86) 99917-3328', 'mariano.boelho@geradornv.com.br', '1992-08-12', 1785.25);

insert into aluno values (23216343243, ' Norival Carneiro Cunha', ' Rua Noemi, 926', '(95) 97921-9552', 2);
insert into aluno values (11215576781, ' Thayná Giacomini Ervano', ' Rua Oscar Lópes, 500', '2002-11-10', 1);
insert into aluno values (63307144448, ' Firmino Paes Marcello', ' Rua Nossa Senhora do Carmo, 135', '(83) 97187-9814', 2);
insert into aluno values (61465352570, ' Lilian Cretella Tolentino', ' Acesso Vinte, 169', '(79) 98401-6846', 1);

insert into avaliacao values ('2021-10-29', 23216343243, 46531365641, 78, 1.75, 20, 17);
insert into avaliacao values ('2021-11-04', 11215576781, 75903227252, 65, 1.63, 15, 13);
insert into avaliacao values ('2021-11-04', 63307144448, 46531365641, 62, 1.58, 17, 14);
insert into avaliacao values ('2021-11-07', 61465352570, 75903227252, 97, 1.85, 23, 22);
insert into avaliacao values ('2021-11-11', 23216343243, 83503542329, 80, 1.75, 23, 20);

insert into turma values(124, 46531365641, 12);
insert into turma values(125, 75903227252, 13);
insert into turma values(126, 83503542329, 11);
insert into turma values(127, 75903227252, 13);

insert into turma_aluno values(23216343243, 124);
insert into turma_aluno values(63307144448, 124);
insert into turma_aluno values(11215576781, 125);
insert into turma_aluno values(61465352570, 126);
insert into turma_aluno values(63307144448, 127);


insert into dia_turma values(124, 22, '17:00:00');
insert into dia_turma values(124, 24, '15:00:00');

insert into dia_turma values(125, 27, '19:00:00');

insert into dia_turma values(126, 23, '16:00:00');
insert into dia_turma values(126, 25, '16:00:00');

insert into dia_turma values(127, 27, '14:00:00');


/* Comandos */

/* 1 - listar alunos de uma turma */ 
select 
	a.nm_aluno as Nome,
	a.cd_cpf_aluno as CPF,
	a.ds_endereco_aluno as Endereço,
	a.nm_telefone as Telefone,
	ta.cd_turma as Turma
from aluno a 
join turma_aluno ta on (a.cd_cpf_aluno = ta.cd_cpf_aluno)
where ta.cd_turma = 124
order by a.nm_aluno;

/* 2 - saber qual professor da aula para uma determinada turma */
select 
	t.cd_turma as Turma,
	p.nm_professor as Nome,
	p.cd_cpf_professor as CPF,
	p.nm_telefone_professor as Telefone,
	p.ds_email as 'E-mail'
from professor p
join turma t on (p.cd_cpf_professor = t.cd_cpf_professor)
where t.cd_turma = 124;

/* 3 - listar opções de horários para uma modalidade */
select 
	t.cd_turma as Turma,
	m.nm_modalidade as Modalidade,
	ds.nm_dia_semana as Dia,
	dt.hr_horario as Hora
from dia_turma dt
join dia_semana ds on (dt.cd_dia_semana = ds.cd_dia_semana)
join turma t on (dt.cd_turma = t.cd_turma)
join modalidade m on (t.cd_modalidade = m.cd_modalidade)
where m.nm_modalidade = ' Boxe';