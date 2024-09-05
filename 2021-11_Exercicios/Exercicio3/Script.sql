Drop schema if exists BDEx3;
Create schema BDEx3;
Use BDEx3;

Create table produto(
    cd_produto int,
    ds_produto text,
    vl_produto decimal(10, 2),
    qt_produto_estoque int,
    constraint pk_produto primary key (cd_produto)
);

Create table funcionario(
    cd_matricula int,
    nm_cpf_funcionario varchar(30),
    nm_funcionario varchar(250),
    ds_endereco_funcionario text,
    vl_salario decimal(10 , 2 ),
	pc_vendas int,
    constraint pk_funcionario primary key (cd_matricula)
);

Create table metodo_pagamento(
    cd_metodo_pagamento int,
    nm_metodo_pagamento varchar(100),
    constraint pk_metodo_pagamento primary key (cd_metodo_pagamento)
);

Create table cliente(
    nm_cpf_cliente varchar(30),
    nm_cliente varchar(250),
    nm_rg_cliente varchar(30),
    ds_endereco_cliente text,
    constraint pk_cliente primary key (nm_cpf_cliente)
);

Create table telefone(
    cd_telefone int,
    nm_telefone varchar(21),
    nm_cpf_cliente varchar(30),
    cd_matricula int,
    constraint pk_telefone primary key (cd_telefone),
    constraint fk_telefone_cliente foreign key (nm_cpf_cliente)
        references cliente (nm_cpf_cliente),
    constraint fk_telefone_funcionario foreign key (cd_matricula)
        references funcionario (cd_matricula)
);

Create table venda(
    dt_venda date,
    hr_venda time,
    cd_matricula int,
    vl_venda decimal(10, 2),
	vl_parcela decimal(10,2),
    ds_venda text,
	cd_metodo_pagamento int,
	nm_cpf_cliente varchar(30),
    constraint pk_venda primary key (dt_venda, hr_venda, cd_matricula),
    constraint fk_venda_funcionario foreign key (cd_matricula)
        references funcionario (cd_matricula),
	constraint fk_venda_metodo_pagamento foreign key (cd_metodo_pagamento)
		references metodo_pagamento (cd_metodo_pagamento),
	constraint fk_venda_cliente foreign key (nm_cpf_cliente)
		references cliente (nm_cpf_cliente)
);

Create table item_venda(
    cd_produto int,
    dt_venda date, 
    hr_venda time,
    cd_matricula int,
    qt_vendida_produto int,
    constraint pk_item_venda primary key (cd_produto, dt_venda, hr_venda, cd_matricula),
    constraint fk_item_venda_produto foreign key (cd_produto)
        references produto (cd_produto),
    constraint fk_item_venda_venda foreign key (dt_venda, hr_venda, cd_matricula)
        references venda (dt_venda, hr_venda, cd_matricula)
);

/* Massa de Testes */
insert into produto values(1, 'Dorflex', 5.50, 77);
insert into produto values(2, 'Loratadina', 10.00, 83);
insert into produto values(3, 'Dipirona', 12.00, 90);

insert into funcionario values (2199, '545.488.974-10', 'Samuel Hugo Osvaldo Novaes', 'Rua Nelson Danon, 483', 2128.90, 10);
insert into funcionario values (2200, '701.722.035-89', 'Murilo Theo Figueiredo', 'Rua Benedito Alfredo Costa, 626', 2183.58, 10);
insert into funcionario values (2201, '537.778.481-23', 'Thales Leandro Rodrigues', 'Avenida Menino Marcelo, 449', 1729.53, 10);

insert into metodo_pagamento values (11, 'a vista');
insert into metodo_pagamento values (12, 'a prazo');

insert into cliente values ('969.411.891-34', 'Nina Emanuelly Cláudia de Paula', '13.437.631-6', 'Alto da Raposa, 695');
insert into cliente values ('180.245.892-14', 'Márcia Adriana Rayssa Sales', '13.982.530-7', 'Avenida Pedro Álvares Cabral, 917');
insert into cliente values ('948.754.949-80', 'Rebeca Tânia Ester Souza', '34.442.684-1', 'Rua José do Patrocínio, 155');
insert into cliente values ('268.559.904-52', 'Kaique Isaac Guilherme dos Santos', '39.186.991-7', 'Rua José Luiz Trujillo de Freitas, 650');

insert into telefone values (21, '(21) 98493-2038', '969.411.891-34', null);
insert into telefone values (22, '(42) 98464-3475', '969.411.891-34', null);
insert into telefone values (23, '(93) 98204-6569', '180.245.892-14', null);
insert into telefone values (24, '(21) 99149-6417', '948.754.949-80', null);
insert into telefone values (25, '(68) 98788-4852', '268.559.904-52', null);
insert into telefone values (26, '(15) 98241-9797', null, 2199);
insert into telefone values (27, '(95) 9543-0648', null, 2200);
insert into telefone values (28, '(67) 99881-6753', null, 2201);
insert into telefone values (29, '(31) 98858-8645', null, 2201);

insert into venda values ('2021-09-12', '15:30:48', 2199, 90.00, 30.00, '3x sem juros', 12, '969.411.891-34');
insert into venda values ('2021-09-17', '10:10:15', 2199, 66.00, 33.00, '2x sem juros', 12, '180.245.892-14');
insert into venda values ('2021-09-22', '19:23:52', 2200, 11.00, 11.00, 'A vista', 11, '948.754.949-80');
insert into venda values ('2021-09-25', '20:06:33', 2201, 12.00, 12.00, 'A vista', 11, '268.559.904-52');

insert into item_venda values (2, '2021-09-12', '15:30:48', 2199, 3);
insert into item_venda values (3, '2021-09-12', '15:30:48', 2199, 5);
insert into item_venda values (3, '2021-09-17', '10:10:15', 2199, 3);
insert into item_venda values (1, '2021-09-22', '19:23:52', 2200, 2);
insert into item_venda values (3, '2021-09-25', '20:06:33', 2201, 1);


/* Comandos */

/* 1 - incluir um novo cliente */
insert into cliente values ('430.762.597-84', 'Isabel Isabella Mariane da Luz', '43.550.603-1', 'Rua CV 10, 899');

/* 2 - realizar uma venda completa */
insert into venda values ('2021-10-01', '10:33:58', 2201, 80.00, 20.00, '4x sem juros', 12, '430.762.597-84');

insert into item_venda values (2, '2021-10-01', '10:33:58', 2201, 2);
insert into item_venda values (3, '2021-10-01', '10:33:58', 2201, 5);