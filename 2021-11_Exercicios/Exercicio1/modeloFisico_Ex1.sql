drop Schema if exists restaurante;
Create Schema restaurante;
Use restaurante;

Create Table clientes(
	cd_cliente int,
	nm_cliente varchar(200), 
	ds_endereco_cliente text, 
	cd_telefone_cliente text, 
	constraint pk_clientes primary key(cd_cliente)
);

Create Table fornecedores(
	cd_fornecedor int,
	nm_fornecedor varchar(200),
	constraint pk_fornecedores primary key (cd_fornecedor)
);

Create Table compra_ingredientes(
	cd_nota int,
	dt_compra date,
	constraint pk_compra_ingredientes primary key (cd_nota)
);

Create Table pratos(
	cd_prato int,
	nm_prato varchar(200), 
	vl_prato decimal (10,2),
	constraint pk_pratos primary key(cd_prato)
);

create table ingredientes(
	cd_ingrediente int,
	nm_ingrediente varchar(100),
	constraint pk_ingredientes primary key (cd_ingrediente)
);


Create Table encomendas(
	cd_encomenda int, 
	cd_cliente int,
	dt_encomenda date,
	hr_encomenda time,
	constraint pk_encomendas primary key (cd_encomenda), 
	constraint fk_encomendas_clientes foreign key(cd_cliente)
		references clientes (cd_cliente)
);

create table itens_encomendas(
	cd_encomenda int,
	cd_prato int,
	qt_prato int,
	constraint pk_itens_encomendas primary key (cd_prato, cd_encomenda),
	constraint fk_itens_encomenda_encomendas foreign key (cd_encomenda)
		references encomendas (cd_encomenda),
	constraint fk_itens_encomenda_pratos foreign key (cd_prato)
		references pratos (cd_prato)
);

create table itens_pratos(
	cd_prato int,
	cd_ingrediente int,
	qt_ingrediente_prato int,
	constraint pk_itens_pratos primary key (cd_prato, cd_ingrediente),
	constraint fk_itens_prato_pratos foreign key (cd_prato)
		references pratos (cd_prato),
	constraint fk_itens_prato_ingredientes foreign key (cd_ingrediente)
		references ingredientes (cd_ingrediente)
);

create table itens_compras(
	cd_nota int,
	cd_ingrediente int,
	qt_ingredientes_compra int,
	cd_fornecedor int,
	constraint pk_itens_compras primary key (cd_ingrediente, cd_nota),
	constraint fk_itens_compra_ingredientes foreign key (cd_ingrediente)
		references ingredientes (cd_ingrediente),
	constraint fk_itens_compra_compra_ingredientes foreign key (cd_nota)
		references compra_ingredientes (cd_nota),
	constraint fk_itens_compra_fornecedores foreign key (cd_fornecedor)
		references fornecedores (cd_fornecedor)
);