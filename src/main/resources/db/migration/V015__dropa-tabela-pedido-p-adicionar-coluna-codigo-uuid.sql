DROP TABLE pedido;

create table pedido (
       id  bigserial not null,
       	codigo varchar(36) not null,
        subtotal numeric(10, 2) not null,
        taxa_frete numeric(10, 2) not null,
		valor_total numeric(10, 2) not null,
       
		restaurante_id bigserial not null,
    	usuario_cliente_id bigserial not null,
    	forma_pagamento_id bigserial not null,
    
    	endereco_cidade_id bigserial not null,
    	endereco_cep varchar(9) not null,
   	 	endereco_logradouro varchar(100) not null,
    	endereco_numero varchar(20) not null,
    	endereco_complemento varchar(60) null,
    	endereco_bairro varchar(60) not null,
    
    	status varchar(10) not null,
    	data_criacao TIMESTAMP(0) not null,
    	data_confirmacao TIMESTAMP(0),
    	data_cancelamento TIMESTAMP(0),
    	data_entrega TIMESTAMP(0),

    primary key (id),

    constraint fk_pedido_endereco_cidade foreign key (endereco_cidade_id) references cidade (id),
    constraint fk_pedido_restaurante foreign key (restaurante_id) references restaurante (id),
    constraint fk_pedido_usuario_cliente foreign key (usuario_cliente_id) references usuario (id),
    constraint fk_pedido_forma_pagamento foreign key (forma_pagamento_id) references forma_pagamento (id)
	
    );
	
ALTER TABLE pedido ADD CONSTRAINT uk_pedido_codigo unique (codigo);