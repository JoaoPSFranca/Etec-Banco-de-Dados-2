use OrcamentoVendas;

insert into tipo_usuario value (1, 'administrador');

insert into tipo_usuario value (2, 'Funcionário Rede Social');

insert into tipo_usuario value (3, 'Funcionário Vendas');

Select * from tipo_usuario;


insert into tipo_servico value (1, 'Colares');

insert into tipo_servico value (2, 'Canecas');

insert into tipo_servico value (3, 'Chaveiros');

insert into tipo_servico value (4, 'Pingentes');

Select * from tipo_servico;


insert into rede_social value (1, 'Instagram');

insert into rede_social value (2, 'Facebook');

Select * from rede_social;


insert into usuario value ('AdmComK', 'Karolina Aurora', 'OmO5usJuCT', 1);

insert into usuario value ('CesarRS', 'César Renato', '2G4nTs7PBw', 2);

insert into usuario value ('SaraRS', 'Sara Heloisa', 'C8SukJjHrE', 2);

insert into usuario value ('SueliVE', 'Sueli Oliveira', 'nLP4FiEAzi', 3);

insert into usuario value ('LuanVE', 'Luan Drumond', 'NgAGN2u9rf', 3);

Select * from usuario;


insert into cliente value (17614, 'baiano', 
	'https://www.instagram.com/baiano/?hl=pt-br', 1);

insert into cliente value (42728, 'Cauê Mateus', 
	'https://www.facebook.com/Caue.Mateus.9026040/?show_switched_toast=0', 2);

insert into cliente value (83768, 'Jojo', 
	'https://www.instagram.com/Jojo/?hl=pt-br', 1);

Select * from cliente;


insert into pedido value ('2020-05-25', '20:45:58', 'CesarRS', 17614, 'O cliente
	pediu uma caneca e um chaveiro', '2020-05-25', '20:57:18', 'SueliVE', 
	25.00, 'Valor integral sem desconto ou promoçaão', '2020-05-26', 
	'07:03:24', 'SaraRS');

insert into pedido value ('2020-06-30', '12:34:17', 'SaraRS', 42728, 'O cliente
	pediu um chaveiro e um colar', '2020-06-30', '13:56:25', 'LuanVE', 8.00, 
	'Preço com desconto de 20% no colar', null, null, null);

insert into pedido value ('2020-07-08', '07:26:45', 'SaraRS', 83768, 'O cliente
	pediu uma caneca, um chaveiro e um pingente', null, null, null, null, 
	null, null, null, null);

Select * from pedido;


insert into item_pedido value ('2020-05-25', '20:45:58', 'CesarRS', 2);

insert into item_pedido value ('2020-05-25', '20:45:58', 'CesarRS', 3);

insert into item_pedido value ('2020-06-30', '12:34:17', 'SaraRS', 1);

insert into item_pedido value ('2020-06-30', '12:34:17', 'SaraRS', 3);

insert into item_pedido value ('2020-07-08', '07:26:45', 'SaraRS', 2);

insert into item_pedido value ('2020-07-08', '07:26:45', 'SaraRS', 3);

insert into item_pedido value ('2020-07-08', '07:26:45', 'SaraRS', 4);

Select * from item_pedido;