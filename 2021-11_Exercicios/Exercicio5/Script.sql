drop schema if exists BDEx5;
create schema BDEx5;
use BDEx5;

create table autor(
	cd_autor int, 
	nm_autor varchar(250),
	nm_pseudonimo varchar(250),
	aa_nascimento year,
	nm_pais_origem varchar(250),
	ds_nota_biografica text,
	constraint pk_autor primary key (cd_autor)
);

create table livro(
	cd_livro int, 
	nm_titulo varchar(200),
	nm_idioma varchar(200),
	aa_lancamento year,
	constraint pk_livro primary key (cd_livro)
);

create table editora(
	cd_editora int,
	nm_editora varchar(250),
	ds_endereco_editora text,
	constraint pk_editora primary key (cd_editora)
);

create table autor_livro(
	cd_autor int,
	cd_livro int,
	constraint pk_autor_livro primary key (cd_autor, cd_livro),
	constraint fk_autor_livro_autor foreign key (cd_autor)
		references autor (cd_autor),
	constraint fk_autor_livro_livro foreign key (cd_livro)
		references livro (cd_livro)
);

create table edicao_livro(
	cd_livro int,
	cd_editora int,
	aa_publicacao year,
	nm_ISBN varchar(30), 
	vl_venda decimal(10,2),
	qt_paginas int,
	qt_exemplares int,
	constraint pk_edicao_livro primary key (cd_livro, cd_editora, aa_publicacao),
	constraint fk_edicao_livro_livro foreign key (cd_livro)
		references livro (cd_livro),
	constraint fk_edicao_livro_editora foreign key (cd_editora)
		references editora (cd_editora)
);

create table telefone(
	cd_editora int,
	cd_telefone int, 
	nm_telefone varchar(21),
	constraint pk_telefone primary key (cd_editora, cd_telefone),
	constraint fk_telefone_editora foreign key (cd_editora)
		references editora (cd_editora)
);


/* Massa de Testes */
insert into autor values (1, 'Carlos Biango Feitosa', ' D.S. Feitosa', '1981', 'Brasil', 'Escritor desde os 7 anos de idade, tendo ganhado vários prêmios por sua incrível contribuição para a linguística brasileira');
insert into autor values (2, 'Caleb Bonimo Paulo', ' H.G. Paulo', '1987', 'Estados Unidos da América', 'Um grande escritor internacional, famoso por suas séries de livros impecáveis');
insert into autor values (3, 'Paloma Lucas Vabo', ' A.H. Lucas', '1974', 'Argentina', 'Começou sua carreira na década de 90, alcançando um sucesso cada vez mais avassalador');
insert into autor values (4, 'Bruno Ervano Rodrigues', ' A.F. Rodrigues', '1963', 'Portugal', 'O grande orgulho português, tendo se tornado um grande escritor e mudado a visão internacional sobre a literatura portuguesa');

insert into livro values (11, 'A Volta dos que não Foram', 'Português', '2004');
insert into livro values (12, 'As Tranças do Rei Careca', 'Inglês', '2015');
insert into livro values (13, 'A Revolta dos Pacíficos', 'Espanhol', '2017');
insert into livro values (14, 'A Volta dos que não Foram 2', 'Português', '2019');

insert into editora values (21, 'Saber', 'Rua Acre, 623, Guarujá, São Paulo, Brasil');
insert into editora values (22, 'Know', 'Verona Street, 806, Suite 1, Kissimmee, Florida, USA');
insert into editora values (23, 'Edelvives', 'Amenábar, 100, Núñez, Buenos Aires, Argentina');

insert into autor_livro values (1, 11);
insert into autor_livro values (2, 12);
insert into autor_livro values (3, 13);
insert into autor_livro values (1, 14);
insert into autor_livro values (4, 14);

insert into edicao_livro values (11, 21, '2004', '978–85–333–0227–3', 23.99, 223, 25);
insert into edicao_livro values (11, 21, '2012', '924–53–152–1324–7', 27.45, 248, 549);
insert into edicao_livro values (12, 22, '2015', '178-23-245-7832-4', 40.30, 305, 187);
insert into edicao_livro values (13, 23, '2017', '138-12-452-4531-8', 25.40, 190, 224);
insert into edicao_livro values (14, 21, '2019', '187-45-478-5354-9', 45.32, 274, 357);

insert into telefone values (21, 1, '+55 (11) 95082-6084');
insert into telefone values (21, 2, '+55 (17) 98811-6567');
insert into telefone values (22, 1, '+1-305-904-6643');
insert into telefone values (22, 2, '+55 (11) 3250-5000');
insert into telefone values (23, 1, '+54 (341) 15 461-4894');


/* Comandos */

/* 1 - Para pegar um livro específico: */
select 
	l.nm_titulo as Titulo,
	l.nm_idioma as Idioma,
	l.aa_lancamento as Lançamento,
	group_concat(a.nm_pseudonimo) as 'Autor(es)'
from livro l 
join autor_livro al on (l.cd_livro = al.cd_livro)
join autor a on (al.cd_autor = a.cd_autor)
where l.cd_livro = 14 or l.cd_livro = 12
group by l.cd_livro;

/* 1 - Para pegar uma edição de um livro específico: */
select 
	l.nm_titulo as Titulo,
	l.nm_idioma as Idioma,
	el.aa_publicacao as Publicação,
	group_concat(a.nm_pseudonimo) as 'Autor(es)', 
	e.nm_editora as Editora,
	el.vl_venda as Valor,
	el.qt_paginas as Páginas,
	el.qt_exemplares as Exemplares
from livro l 
join autor_livro al on (l.cd_livro = al.cd_livro)
join autor a on (al.cd_autor = a.cd_autor)
join edicao_livro el on (l.cd_livro = el.cd_livro)
join editora e on (el.cd_editora = e.cd_editora)
where l.cd_livro = 14 or l.cd_livro = 12
group by el.aa_publicacao;

/* 2 - Para deletar um livro específico: */
delete from edicao_livro where cd_livro = 11;
delete from autor_livro where cd_livro = 11;
delete from livro where cd_livro = 11;

/* 3 - Para editar os dados de um autor específico: */
update autor 
set 
	nm_autor = ' Diego Feitosa',
	nm_pseudonimo = ' D. Feitosa',
	aa_nascimento = '1990',
	nm_pais_origem = 'México',
	ds_nota_biografica = 'Ele é um dos principais escritores latinos, revolucionou a escrita mexicana'
where cd_autor = 1;