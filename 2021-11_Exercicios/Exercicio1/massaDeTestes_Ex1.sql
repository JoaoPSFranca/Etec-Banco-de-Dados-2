insert into clientes values (1, ' Helena', ' Rua 1º de maio, 235', ' boyce4302@uorak.com');
insert into clientes values (2, ' Lara', ' Avenida Affonso Penna, 452', ' yuridia7105@uorak.com');
insert into clientes values (3, ' Isabella', ' Rua Acre, 625', ' mamudou3178@uorak.com');

insert into fornecedores values (1, ' BlueOcean Alimentos');
insert into fornecedores values (2, ' ThinkBig Alimentos');
insert into fornecedores values (3, ' Village Foods');

insert into compra_ingredientes values (145, '2021/03/25');
insert into compra_ingredientes values (236, '2021/03/25');
insert into compra_ingredientes values (547, '2021/04/02');

insert into pratos values (14, ' Bife Acebolado', 17.99);
insert into pratos values (15, ' Strogonoff de Frango', 24.99);
insert into pratos values (16, ' Lasanha', 21.99);

insert into ingredientes values (20, ' Arroz');
insert into ingredientes values (21, ' Feijão');
insert into ingredientes values (22, ' Bife');
insert into ingredientes values (23, ' Cebola');
insert into ingredientes values (24, ' Batata palha');
insert into ingredientes values (25, ' Frango');
insert into ingredientes values (26, ' Queijo');
insert into ingredientes values (27, ' Carne Moida');
insert into ingredientes values (28, ' Molho Rosé');
insert into ingredientes values (29, ' Molho Bolonhesa');

insert into encomendas values (452, 1, '2021/03/23', '14:22:50');
insert into encomendas values (453, 3, '2021/03/27', '11:15:43');
insert into encomendas values (454, 2, '2021/03/27', '20:48:24');
insert into encomendas values (455, 3, '2021/04/02', '12:32:55');

insert into itens_encomendas values (452, 15, 2);
insert into itens_encomendas values (453, 14, 1);
insert into itens_encomendas values (453, 15, 1);
insert into itens_encomendas values (454, 14, 1);
insert into itens_encomendas values (455, 15, 1);
insert into itens_encomendas values (455, 16, 1);

insert into itens_pratos values (14, 20, 1);
insert into itens_pratos values (14, 21, 1);
insert into itens_pratos values (14, 22, 1);
insert into itens_pratos values (14, 23, 1);
insert into itens_pratos values (15, 20, 1);
insert into itens_pratos values (15, 24, 1);
insert into itens_pratos values (15, 25, 1);
insert into itens_pratos values (15, 28, 1);
insert into itens_pratos values (16, 26, 1);
insert into itens_pratos values (16, 27, 1);
insert into itens_pratos values (16, 29, 1);

insert into itens_compras values (145, 28, 200, 3);
insert into itens_compras values (145, 29, 350, 3);
insert into itens_compras values (236, 20, 120, 2);
insert into itens_compras values (236, 21, 260, 2);
insert into itens_compras values (236, 27, 450, 1);
insert into itens_compras values (236, 26, 225, 1);
insert into itens_compras values (547, 22, 310, 1);
insert into itens_compras values (547, 23, 115, 2);
insert into itens_compras values (547, 24, 110, 2);
insert into itens_compras values (547, 25, 230, 1);