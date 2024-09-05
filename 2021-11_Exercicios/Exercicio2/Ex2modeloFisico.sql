drop schema if exists prjSerie;
create schema prjSerie;
use prjserie;

create table categoria(
	cd_categoria int,
	nm_categoria varchar(100),
	constraint pk_categoria primary key (cd_categoria)
);

create table serie(
	cd_serie int,
	nm_serie varchar(200),
	nm_original varchar(200),
	aa_ano_lancamento int,
	nm_link_img text,
	ds_sinopse_serie text,
	constraint pk_serie primary key (cd_serie)
);

create table categoria_serie(
	cd_serie int,
	cd_categoria int,
	constraint pk_categoria_serie primary key (cd_serie, cd_categoria),
	constraint fk_categoria_serie_categoria foreign key (cd_categoria) 
		references categoria (cd_categoria),
	constraint fk_categoria_serie_serie foreign key (cd_serie) 
		references serie (cd_serie)
);

create table episodio(
	cd_serie int,
	cd_temporada int,
	cd_episodio int,
	nm_episodio varchar(150),
	nm_original varchar(150),
	dt_lancamento date,
	qt_duracao int,
	ds_sinopse_episodio text,
	ds_observacao text,
	constraint pk_episodio primary key (cd_episodio, cd_serie, cd_temporada),
	constraint fk_episodio_serie foreign key (cd_serie)
		references serie (cd_serie)
);