
  create table forma_pagamento (
       id  bigserial not null,
        descricao varchar(60) not null,
        primary key (id)
    );

    create table grupo (
       id  bigserial not null,
        nome varchar(60) not null,
        primary key (id)
    );

    create table grupo_permissao (
       grupo_id bigserial not null,
        permissao_id bigserial not null,
        
        primary key (grupo_id, permissao_id)
    );

    create table permissao (
       id  bigserial not null,
        descricao varchar(60) not null,
        nome varchar(100) not null,
        
        primary key (id)
    );

    create table produto (
       id  bigserial not null,
        restaurante_id bigserial not null,
        nome varchar(80) not null,
        descricao varchar(255),
        preco numeric(10, 2),
        ativo boolean,
        
        primary key (id)
    );

    create table restaurante (
       id  bigserial not null,
        cozinha_id bigserial not null,
        nome varchar(80) not null,
        taxa_frete numeric(10, 2) not null,
        data_atualizacao TIMESTAMP(0) not null,
        data_cadastro TIMESTAMP(0) not null,
        
        endereco_cidade_id integer,
        endereco_cep varchar(9),
        endereco_logradouro varchar(100),
        endereco_numero varchar(20),
        endereco_complemento varchar(60),
        endereco_bairro varchar(60),
        
        primary key (id)
    );

    create table restaurante_forma_pagamento (
       restaurante_id bigserial not null,
       forma_pagamento_id bigserial not null,
        
       primary key (restaurante_id, forma_pagamento_id) 
    );

    create table usuario (
       id  bigserial not null,
        nome varchar(80) not null,
        email varchar(255)not null,
        senha varchar(255)not null,
        data_cadastro TIMESTAMP(0) not null,
        
        primary key (id)
    );

    create table usuario_grupo (
       usuario_id bigserial not null,
        grupo_id bigserial not null,
        
        primary key (usuario_id, grupo_id)
    );

    alter table grupo_permissao 
       add constraint fk_grupo_permissao_permissao 
       foreign key (permissao_id) 
       references permissao;

    alter table grupo_permissao 
       add constraint fk_grupo_permissao_grupo 
       foreign key (grupo_id) 
       references grupo;

    alter table produto 
       add constraint fk_produto_restaurante 
       foreign key (restaurante_id) 
       references restaurante;

    alter table restaurante 
       add constraint fk_restaurante_cozinha 
       foreign key (cozinha_id) 
       references cozinha;

    alter table restaurante 
       add constraint fk_restaurante_cidade 
       foreign key (endereco_cidade_id) 
       references cidade;

    alter table restaurante_forma_pagamento 
       add constraint fk_rest_forma_pagto_forma_pagto 
       foreign key (forma_pagamento_id) 
       references forma_pagamento;

    alter table restaurante_forma_pagamento 
       add constraint fk_rest_forma_pagto_restaurante 
       foreign key (restaurante_id) 
       references restaurante;

    alter table usuario_grupo 
       add constraint fk_usuario_grupo_grupo 
       foreign key (grupo_id) 
       references grupo;

    alter table usuario_grupo 
       add constraint fk_usuario_grupo_usuario 
       foreign key (usuario_id) 
       references usuario;