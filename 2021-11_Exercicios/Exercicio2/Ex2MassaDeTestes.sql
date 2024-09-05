insert into tipo_transporte values (1, 'Caminhão');
insert into tipo_transporte values (2, 'Navio');
insert into tipo_transporte values (3, 'Avião');
insert into tipo_transporte values (4, 'carro');
insert into tipo_transporte values (5, 'Moto');

insert into moeda values (11, 'Euro');
insert into moeda values (12, 'Dólar');
insert into moeda values (13, 'Iene');

insert into fornecedor values (21, 'Fernando', 'Av. Dom Pedro 1, 567', '13 99678-5430', '707-555-130');
insert into fornecedor values (22, 'Alex', 'Rua Acre, 382', '13 99752-6742', '707-465-231');
insert into fornecedor values (23, 'Amanda', 'Av. Rio Amazonas, 1020', '13 98186-1545', '852-540-306');

insert into medida values (31, 'Kilos');
insert into medida values (32, 'Litros');

insert into mercadoria values (41, 'Batata', 10.00, 31);
insert into mercadoria values (42, 'Banana', 9.50, 31);
insert into mercadoria values (43, 'Leite', 7.90, 32);

insert into transporte values (51, 1);
insert into transporte values (52, 2);
insert into transporte values (53, 3);
insert into transporte values (54, 1);
insert into transporte values (55, 4);
insert into transporte values (56, 5);

insert into contrato values (155, '2021-11-25', '2021-12-02', 1900.00, '2021-11-27', '2021-11-29', 12, 21, 54);
insert into contrato values (156, '2021-12-03', '2021-12-10', 810.90, '2021-12-05', '2021-12-06', 11, 23, 52);
insert into contrato values (157, '2021-12-03', '2021-12-07', 535.80, '2021-12-05', '2021-12-07', 13, 22, 51);

insert into contrato_mercadoria values (155, 41, 20);
insert into contrato_mercadoria values (155, 42, 50);
insert into contrato_mercadoria values (155, 43, 50);
insert into contrato_mercadoria values (156, 42, 30);
insert into contrato_mercadoria values (156, 43, 30);
insert into contrato_mercadoria values (157, 41, 40);
insert into contrato_mercadoria values (157, 43, 25);