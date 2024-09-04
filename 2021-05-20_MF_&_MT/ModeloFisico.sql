drop schema if exists OrcamentoVendas;

create schema OrcamentoVendas;

use OrcamentoVendas;

create table tipo_usuario
(
	cd_tipo_usuario int,
	nm_tipo_usuario varchar(100),
	constraint pk_tipo_usuario primary key (cd_tipo_usuario)
);

create table tipo_servico
(
	cd_tipo_servico int,
	nm_tipo_servico varchar(100),
	constraint pk_tipo_usuario primary key (cd_tipo_servico)
);

create table rede_social
(
	cd_rede_social int,
	nm_rede_social varchar(45),
	constraint pk_tipo_usuario primary key (cd_rede_social)
);

create table usuario
(
	nm_loguin varchar(50),
	nm_usuario varchar(100),
	nm_senha varchar(64),
	cd_tipo_usuario int,
	constraint pk_usuario primary key (nm_loguin),
	constraint fk_usuario_tipo_usuario foreign key (cd_tipo_usuario) 
		references tipo_usuario (cd_tipo_usuario)
);

create table cliente
(
	cd_cliente int,
	nm_cliente varchar(200),
	nm_link_cliente varchar(255),
	cd_rede_social int,
	constraint pk_cliente primary key (cd_cliente),
	constraint fk_cliente_rede_social foreign key (cd_rede_social)
		references rede_social (cd_rede_social)
);

create table pedido
(
	dt_pedido date,
	hr_pedido time,
	nm_loguin_rs varchar(50),
	cd_cliente int,
	ds_pedido text,
	dt_preco date,
	hr_preco time,
	nm_loguin_vendas varchar(50),
	vl_pedido decimal(10,2),
	ds_valor_pedido text,
	dt_resposta date,
	hr_resposta time,
	nm_loguin_resposta varchar(50),
	constraint pk_pedido primary key (dt_pedido, hr_pedido, nm_loguin_rs),
	constraint fk_pedido_usuario_1 foreign key (nm_loguin_rs)
		references usuario (nm_loguin),
	constraint fk_pedido_usuario_2 foreign key (nm_loguin_vendas)
		references usuario (nm_loguin),
	constraint fk_pedido_usuario_3 foreign key (nm_loguin_resposta)
		references usuario (nm_loguin),
	constraint fk_pedido_cliente foreign key (cd_cliente)
		references cliente (cd_cliente)
);

create table item_pedido
(
	dt_pedido date,
	hr_pedido time,
	nm_loguin varchar(50),
	cd_tipo_servico int,
	constraint pk_item_pedido primary key (dt_pedido, hr_pedido, nm_loguin, 
		cd_tipo_servico),
	constraint fk_item_pedido_pedido foreign key (dt_pedido, hr_pedido, 
		nm_loguin) references pedido (dt_pedido, hr_pedido, nm_loguin_rs),
	constraint fk_item_pedido_tipo_servico foreign key (cd_tipo_servico)
		references tipo_servico (cd_tipo_servico)
);