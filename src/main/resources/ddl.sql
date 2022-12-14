
    create table cidade (
       id  bigserial not null,
        nome varchar(255),
        estado_id int8,
        primary key (id)
    );

    create table cozinha (
       id  bigserial not null,
        nome varchar(255) not null,
        primary key (id)
    );

    create table estado (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table forma_pagamento (
       id  bigserial not null,
        descricao varchar(255),
        primary key (id)
    );

    create table grupo (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table grupo_permissao (
       grupo_id int8 not null,
        permissao_id int8 not null
    );

    create table permissao (
       id  bigserial not null,
        descricao varchar(255),
        nome varchar(255),
        primary key (id)
    );

    create table produto (
       id  bigserial not null,
        ativo boolean,
        descricao varchar(255),
        nome varchar(255),
        preco numeric(19, 2),
        restaurante_id int8 not null,
        primary key (id)
    );

    create table restaurante (
       id  bigserial not null,
        data_atualizacao TIMESTAMP(0) not null,
        data_cadastro TIMESTAMP(0) not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete numeric(19, 2) not null,
        cozinha_id int8 not null,
        endereco_cidade_id int8,
        primary key (id)
    );

    create table restaurante_forma_pagamento (
       restaurante_id int8 not null,
        forma_pagamento_id int8 not null
    );

    create table usuario (
       id  bigserial not null,
        data_cadastro TIMESTAMP(0) not null,
        email varchar(255),
        nome varchar(255),
        senha varchar(255),
        primary key (id)
    );

    create table usuario_grupo (
       usuario_id int8 not null,
        grupo_id int8 not null
    );

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado;

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao;

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo;

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante;

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha;

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade;

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento;

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante;

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo;

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario;

    create table cidade (
       id  bigserial not null,
        nome varchar(255),
        estado_id int8,
        primary key (id)
    );

    create table cozinha (
       id  bigserial not null,
        nome varchar(255) not null,
        primary key (id)
    );

    create table estado (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table forma_pagamento (
       id  bigserial not null,
        descricao varchar(255),
        primary key (id)
    );

    create table grupo (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table grupo_permissao (
       grupo_id int8 not null,
        permissao_id int8 not null
    );

    create table permissao (
       id  bigserial not null,
        descricao varchar(255),
        nome varchar(255),
        primary key (id)
    );

    create table produto (
       id  bigserial not null,
        ativo boolean,
        descricao varchar(255),
        nome varchar(255),
        preco numeric(19, 2),
        restaurante_id int8 not null,
        primary key (id)
    );

    create table restaurante (
       id  bigserial not null,
        data_atualizacao TIMESTAMP(0) not null,
        data_cadastro TIMESTAMP(0) not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete numeric(19, 2) not null,
        cozinha_id int8 not null,
        endereco_cidade_id int8,
        primary key (id)
    );

    create table restaurante_forma_pagamento (
       restaurante_id int8 not null,
        forma_pagamento_id int8 not null
    );

    create table usuario (
       id  bigserial not null,
        data_cadastro TIMESTAMP(0) not null,
        email varchar(255),
        nome varchar(255),
        senha varchar(255),
        primary key (id)
    );

    create table usuario_grupo (
       usuario_id int8 not null,
        grupo_id int8 not null
    );

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado;

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao;

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo;

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante;

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha;

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade;

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento;

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante;

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo;

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario;

    create table cidade (
       id  bigserial not null,
        nome varchar(255),
        estado_id int8,
        primary key (id)
    );

    create table cozinha (
       id  bigserial not null,
        nome varchar(255) not null,
        primary key (id)
    );

    create table estado (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table forma_pagamento (
       id  bigserial not null,
        descricao varchar(255),
        primary key (id)
    );

    create table grupo (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table grupo_permissao (
       grupo_id int8 not null,
        permissao_id int8 not null
    );

    create table permissao (
       id  bigserial not null,
        descricao varchar(255),
        nome varchar(255),
        primary key (id)
    );

    create table produto (
       id  bigserial not null,
        ativo boolean,
        descricao varchar(255),
        nome varchar(255),
        preco numeric(19, 2),
        restaurante_id int8 not null,
        primary key (id)
    );

    create table restaurante (
       id  bigserial not null,
        data_atualizacao TIMESTAMP(0) not null,
        data_cadastro TIMESTAMP(0) not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete numeric(19, 2) not null,
        cozinha_id int8 not null,
        endereco_cidade_id int8,
        primary key (id)
    );

    create table restaurante_forma_pagamento (
       restaurante_id int8 not null,
        forma_pagamento_id int8 not null
    );

    create table usuario (
       id  bigserial not null,
        data_cadastro TIMESTAMP(0) not null,
        email varchar(255),
        nome varchar(255),
        senha varchar(255),
        primary key (id)
    );

    create table usuario_grupo (
       usuario_id int8 not null,
        grupo_id int8 not null
    );

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado;

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao;

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo;

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante;

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha;

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade;

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento;

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante;

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo;

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario;

    create table cidade (
       id  bigserial not null,
        nome varchar(255),
        estado_id int8,
        primary key (id)
    );

    create table cozinha (
       id  bigserial not null,
        nome varchar(255) not null,
        primary key (id)
    );

    create table estado (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table forma_pagamento (
       id  bigserial not null,
        descricao varchar(255),
        primary key (id)
    );

    create table grupo (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table grupo_permissao (
       grupo_id int8 not null,
        permissao_id int8 not null
    );

    create table permissao (
       id  bigserial not null,
        descricao varchar(255),
        nome varchar(255),
        primary key (id)
    );

    create table produto (
       id  bigserial not null,
        ativo boolean,
        descricao varchar(255),
        nome varchar(255),
        preco numeric(19, 2),
        restaurante_id int8 not null,
        primary key (id)
    );

    create table restaurante (
       id  bigserial not null,
        data_atualizacao TIMESTAMP(0) not null,
        data_cadastro TIMESTAMP(0) not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete numeric(19, 2) not null,
        cozinha_id int8 not null,
        endereco_cidade_id int8,
        primary key (id)
    );

    create table restaurante_forma_pagamento (
       restaurante_id int8 not null,
        forma_pagamento_id int8 not null
    );

    create table usuario (
       id  bigserial not null,
        data_cadastro TIMESTAMP(0) not null,
        email varchar(255),
        nome varchar(255),
        senha varchar(255),
        primary key (id)
    );

    create table usuario_grupo (
       usuario_id int8 not null,
        grupo_id int8 not null
    );

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado;

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao;

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo;

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante;

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha;

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade;

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento;

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante;

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo;

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario;

    create table cidade (
       id  bigserial not null,
        nome varchar(255),
        estado_id int8,
        primary key (id)
    );

    create table cozinha (
       id  bigserial not null,
        nome varchar(255) not null,
        primary key (id)
    );

    create table estado (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table forma_pagamento (
       id  bigserial not null,
        descricao varchar(255),
        primary key (id)
    );

    create table grupo (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table grupo_permissao (
       grupo_id int8 not null,
        permissao_id int8 not null
    );

    create table permissao (
       id  bigserial not null,
        descricao varchar(255),
        nome varchar(255),
        primary key (id)
    );

    create table produto (
       id  bigserial not null,
        ativo boolean,
        descricao varchar(255),
        nome varchar(255),
        preco numeric(19, 2),
        restaurante_id int8 not null,
        primary key (id)
    );

    create table restaurante (
       id  bigserial not null,
        data_atualizacao TIMESTAMP(0) not null,
        data_cadastro TIMESTAMP(0) not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete numeric(19, 2) not null,
        cozinha_id int8 not null,
        endereco_cidade_id int8,
        primary key (id)
    );

    create table restaurante_forma_pagamento (
       restaurante_id int8 not null,
        forma_pagamento_id int8 not null
    );

    create table usuario (
       id  bigserial not null,
        data_cadastro TIMESTAMP(0) not null,
        email varchar(255),
        nome varchar(255),
        senha varchar(255),
        primary key (id)
    );

    create table usuario_grupo (
       usuario_id int8 not null,
        grupo_id int8 not null
    );

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado;

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao;

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo;

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante;

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha;

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade;

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento;

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante;

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo;

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario;

    create table cidade (
       id  bigserial not null,
        nome varchar(255),
        estado_id int8,
        primary key (id)
    );

    create table cozinha (
       id  bigserial not null,
        nome varchar(255) not null,
        primary key (id)
    );

    create table estado (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table forma_pagamento (
       id  bigserial not null,
        descricao varchar(255),
        primary key (id)
    );

    create table grupo (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table grupo_permissao (
       grupo_id int8 not null,
        permissao_id int8 not null
    );

    create table permissao (
       id  bigserial not null,
        descricao varchar(255),
        nome varchar(255),
        primary key (id)
    );

    create table produto (
       id  bigserial not null,
        ativo boolean,
        descricao varchar(255),
        nome varchar(255),
        preco numeric(19, 2),
        restaurante_id int8 not null,
        primary key (id)
    );

    create table restaurante (
       id  bigserial not null,
        data_atualizacao TIMESTAMP(0) not null,
        data_cadastro TIMESTAMP(0) not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete numeric(19, 2) not null,
        cozinha_id int8 not null,
        endereco_cidade_id int8,
        primary key (id)
    );

    create table restaurante_forma_pagamento (
       restaurante_id int8 not null,
        forma_pagamento_id int8 not null
    );

    create table usuario (
       id  bigserial not null,
        data_cadastro TIMESTAMP(0) not null,
        email varchar(255),
        nome varchar(255),
        senha varchar(255),
        primary key (id)
    );

    create table usuario_grupo (
       usuario_id int8 not null,
        grupo_id int8 not null
    );

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado;

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao;

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo;

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante;

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha;

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade;

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento;

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante;

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo;

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario;

    create table cidade (
       id  bigserial not null,
        nome varchar(255),
        estado_id int8,
        primary key (id)
    );

    create table cozinha (
       id  bigserial not null,
        nome varchar(255) not null,
        primary key (id)
    );

    create table estado (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table forma_pagamento (
       id  bigserial not null,
        descricao varchar(255),
        primary key (id)
    );

    create table grupo (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table grupo_permissao (
       grupo_id int8 not null,
        permissao_id int8 not null
    );

    create table permissao (
       id  bigserial not null,
        descricao varchar(255),
        nome varchar(255),
        primary key (id)
    );

    create table produto (
       id  bigserial not null,
        ativo boolean,
        descricao varchar(255),
        nome varchar(255),
        preco numeric(19, 2),
        restaurante_id int8 not null,
        primary key (id)
    );

    create table restaurante (
       id  bigserial not null,
        data_atualizacao TIMESTAMP(0) not null,
        data_cadastro TIMESTAMP(0) not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete numeric(19, 2) not null,
        cozinha_id int8 not null,
        endereco_cidade_id int8,
        primary key (id)
    );

    create table restaurante_forma_pagamento (
       restaurante_id int8 not null,
        forma_pagamento_id int8 not null
    );

    create table usuario (
       id  bigserial not null,
        data_cadastro TIMESTAMP(0) not null,
        email varchar(255),
        nome varchar(255),
        senha varchar(255),
        primary key (id)
    );

    create table usuario_grupo (
       usuario_id int8 not null,
        grupo_id int8 not null
    );

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado;

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao;

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo;

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante;

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha;

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade;

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento;

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante;

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo;

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario;

    create table cidade (
       id  bigserial not null,
        nome varchar(255),
        estado_id int8,
        primary key (id)
    );

    create table cozinha (
       id  bigserial not null,
        nome varchar(255) not null,
        primary key (id)
    );

    create table estado (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table forma_pagamento (
       id  bigserial not null,
        descricao varchar(255),
        primary key (id)
    );

    create table grupo (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table grupo_permissao (
       grupo_id int8 not null,
        permissao_id int8 not null
    );

    create table permissao (
       id  bigserial not null,
        descricao varchar(255),
        nome varchar(255),
        primary key (id)
    );

    create table produto (
       id  bigserial not null,
        ativo boolean,
        descricao varchar(255),
        nome varchar(255),
        preco numeric(19, 2),
        restaurante_id int8 not null,
        primary key (id)
    );

    create table restaurante (
       id  bigserial not null,
        data_atualizacao TIMESTAMP(0) not null,
        data_cadastro TIMESTAMP(0) not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete numeric(19, 2) not null,
        cozinha_id int8 not null,
        endereco_cidade_id int8,
        primary key (id)
    );

    create table restaurante_forma_pagamento (
       restaurante_id int8 not null,
        forma_pagamento_id int8 not null
    );

    create table usuario (
       id  bigserial not null,
        data_cadastro TIMESTAMP(0) not null,
        email varchar(255),
        nome varchar(255),
        senha varchar(255),
        primary key (id)
    );

    create table usuario_grupo (
       usuario_id int8 not null,
        grupo_id int8 not null
    );

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado;

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao;

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo;

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante;

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha;

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade;

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento;

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante;

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo;

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario;

    create table cidade (
       id  bigserial not null,
        nome varchar(255),
        estado_id int8,
        primary key (id)
    );

    create table cozinha (
       id  bigserial not null,
        nome varchar(255) not null,
        primary key (id)
    );

    create table estado (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table forma_pagamento (
       id  bigserial not null,
        descricao varchar(255),
        primary key (id)
    );

    create table grupo (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table grupo_permissao (
       grupo_id int8 not null,
        permissao_id int8 not null
    );

    create table permissao (
       id  bigserial not null,
        descricao varchar(255),
        nome varchar(255),
        primary key (id)
    );

    create table produto (
       id  bigserial not null,
        ativo boolean,
        descricao varchar(255),
        nome varchar(255),
        preco numeric(19, 2),
        restaurante_id int8 not null,
        primary key (id)
    );

    create table restaurante (
       id  bigserial not null,
        data_atualizacao TIMESTAMP(0) not null,
        data_cadastro TIMESTAMP(0) not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete numeric(19, 2) not null,
        cozinha_id int8 not null,
        endereco_cidade_id int8,
        primary key (id)
    );

    create table restaurante_forma_pagamento (
       restaurante_id int8 not null,
        forma_pagamento_id int8 not null
    );

    create table usuario (
       id  bigserial not null,
        data_cadastro TIMESTAMP(0) not null,
        email varchar(255),
        nome varchar(255),
        senha varchar(255),
        primary key (id)
    );

    create table usuario_grupo (
       usuario_id int8 not null,
        grupo_id int8 not null
    );

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado;

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao;

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo;

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante;

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha;

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade;

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento;

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante;

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo;

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario;

    create table cidade (
       id  bigserial not null,
        nome varchar(255),
        estado_id int8,
        primary key (id)
    );

    create table cozinha (
       id  bigserial not null,
        nome varchar(255) not null,
        primary key (id)
    );

    create table estado (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table forma_pagamento (
       id  bigserial not null,
        descricao varchar(255),
        primary key (id)
    );

    create table grupo (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table grupo_permissao (
       grupo_id int8 not null,
        permissao_id int8 not null
    );

    create table permissao (
       id  bigserial not null,
        descricao varchar(255),
        nome varchar(255),
        primary key (id)
    );

    create table produto (
       id  bigserial not null,
        ativo boolean,
        descricao varchar(255),
        nome varchar(255),
        preco numeric(19, 2),
        restaurante_id int8 not null,
        primary key (id)
    );

    create table restaurante (
       id  bigserial not null,
        data_atualizacao TIMESTAMP(0) not null,
        data_cadastro TIMESTAMP(0) not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete numeric(19, 2) not null,
        cozinha_id int8 not null,
        endereco_cidade_id int8,
        primary key (id)
    );

    create table restaurante_forma_pagamento (
       restaurante_id int8 not null,
        forma_pagamento_id int8 not null
    );

    create table usuario (
       id  bigserial not null,
        data_cadastro TIMESTAMP(0) not null,
        email varchar(255),
        nome varchar(255),
        senha varchar(255),
        primary key (id)
    );

    create table usuario_grupo (
       usuario_id int8 not null,
        grupo_id int8 not null
    );

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado;

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao;

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo;

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante;

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha;

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade;

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento;

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante;

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo;

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario;

    create table cidade (
       id  bigserial not null,
        nome varchar(255),
        estado_id int8,
        primary key (id)
    );

    create table cozinha (
       id  bigserial not null,
        nome varchar(255) not null,
        primary key (id)
    );

    create table estado (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table forma_pagamento (
       id  bigserial not null,
        descricao varchar(255),
        primary key (id)
    );

    create table grupo (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table grupo_permissao (
       grupo_id int8 not null,
        permissao_id int8 not null
    );

    create table permissao (
       id  bigserial not null,
        descricao varchar(255),
        nome varchar(255),
        primary key (id)
    );

    create table produto (
       id  bigserial not null,
        ativo boolean,
        descricao varchar(255),
        nome varchar(255),
        preco numeric(19, 2),
        restaurante_id int8 not null,
        primary key (id)
    );

    create table restaurante (
       id  bigserial not null,
        data_atualizacao TIMESTAMP(0) not null,
        data_cadastro TIMESTAMP(0) not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete numeric(19, 2) not null,
        cozinha_id int8 not null,
        endereco_cidade_id int8,
        primary key (id)
    );

    create table restaurante_forma_pagamento (
       restaurante_id int8 not null,
        forma_pagamento_id int8 not null
    );

    create table usuario (
       id  bigserial not null,
        data_cadastro TIMESTAMP(0) not null,
        email varchar(255),
        nome varchar(255),
        senha varchar(255),
        primary key (id)
    );

    create table usuario_grupo (
       usuario_id int8 not null,
        grupo_id int8 not null
    );

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado;

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao;

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo;

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante;

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha;

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade;

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento;

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante;

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo;

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario;

    create table cidade (
       id  bigserial not null,
        nome varchar(255),
        estado_id int8,
        primary key (id)
    );

    create table cozinha (
       id  bigserial not null,
        nome varchar(255) not null,
        primary key (id)
    );

    create table estado (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table forma_pagamento (
       id  bigserial not null,
        descricao varchar(255),
        primary key (id)
    );

    create table grupo (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table grupo_permissao (
       grupo_id int8 not null,
        permissao_id int8 not null
    );

    create table permissao (
       id  bigserial not null,
        descricao varchar(255),
        nome varchar(255),
        primary key (id)
    );

    create table produto (
       id  bigserial not null,
        ativo boolean,
        descricao varchar(255),
        nome varchar(255),
        preco numeric(19, 2),
        restaurante_id int8 not null,
        primary key (id)
    );

    create table restaurante (
       id  bigserial not null,
        data_atualizacao TIMESTAMP(0) not null,
        data_cadastro TIMESTAMP(0) not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete numeric(19, 2) not null,
        cozinha_id int8 not null,
        endereco_cidade_id int8,
        primary key (id)
    );

    create table restaurante_forma_pagamento (
       restaurante_id int8 not null,
        forma_pagamento_id int8 not null
    );

    create table usuario (
       id  bigserial not null,
        data_cadastro TIMESTAMP(0) not null,
        email varchar(255),
        nome varchar(255),
        senha varchar(255),
        primary key (id)
    );

    create table usuario_grupo (
       usuario_id int8 not null,
        grupo_id int8 not null
    );

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado;

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao;

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo;

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante;

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha;

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade;

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento;

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante;

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo;

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario;

    create table cidade (
       id  bigserial not null,
        nome varchar(255),
        estado_id int8,
        primary key (id)
    );

    create table cozinha (
       id  bigserial not null,
        nome varchar(255) not null,
        primary key (id)
    );

    create table estado (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table forma_pagamento (
       id  bigserial not null,
        descricao varchar(255),
        primary key (id)
    );

    create table grupo (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table grupo_permissao (
       grupo_id int8 not null,
        permissao_id int8 not null
    );

    create table permissao (
       id  bigserial not null,
        descricao varchar(255),
        nome varchar(255),
        primary key (id)
    );

    create table produto (
       id  bigserial not null,
        ativo boolean,
        descricao varchar(255),
        nome varchar(255),
        preco numeric(19, 2),
        restaurante_id int8 not null,
        primary key (id)
    );

    create table restaurante (
       id  bigserial not null,
        data_atualizacao TIMESTAMP(0) not null,
        data_cadastro TIMESTAMP(0) not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete numeric(19, 2) not null,
        cozinha_id int8 not null,
        endereco_cidade_id int8,
        primary key (id)
    );

    create table restaurante_forma_pagamento (
       restaurante_id int8 not null,
        forma_pagamento_id int8 not null
    );

    create table usuario (
       id  bigserial not null,
        data_cadastro TIMESTAMP(0) not null,
        email varchar(255),
        nome varchar(255),
        senha varchar(255),
        primary key (id)
    );

    create table usuario_grupo (
       usuario_id int8 not null,
        grupo_id int8 not null
    );

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado;

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao;

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo;

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante;

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha;

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade;

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento;

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante;

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo;

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario;

    create table cidade (
       id  bigserial not null,
        nome varchar(255),
        estado_id int8,
        primary key (id)
    );

    create table cozinha (
       id  bigserial not null,
        nome varchar(255) not null,
        primary key (id)
    );

    create table estado (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table forma_pagamento (
       id  bigserial not null,
        descricao varchar(255),
        primary key (id)
    );

    create table grupo (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table grupo_permissao (
       grupo_id int8 not null,
        permissao_id int8 not null
    );

    create table permissao (
       id  bigserial not null,
        descricao varchar(255),
        nome varchar(255),
        primary key (id)
    );

    create table produto (
       id  bigserial not null,
        ativo boolean,
        descricao varchar(255),
        nome varchar(255),
        preco numeric(19, 2),
        restaurante_id int8 not null,
        primary key (id)
    );

    create table restaurante (
       id  bigserial not null,
        data_atualizacao TIMESTAMP(0) not null,
        data_cadastro TIMESTAMP(0) not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete numeric(19, 2) not null,
        cozinha_id int8 not null,
        endereco_cidade_id int8,
        primary key (id)
    );

    create table restaurante_forma_pagamento (
       restaurante_id int8 not null,
        forma_pagamento_id int8 not null
    );

    create table usuario (
       id  bigserial not null,
        data_cadastro TIMESTAMP(0) not null,
        email varchar(255),
        nome varchar(255),
        senha varchar(255),
        primary key (id)
    );

    create table usuario_grupo (
       usuario_id int8 not null,
        grupo_id int8 not null
    );

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado;

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao;

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo;

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante;

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha;

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade;

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento;

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante;

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo;

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario;

    create table cidade (
       id  bigserial not null,
        nome varchar(255),
        estado_id int8,
        primary key (id)
    );

    create table cozinha (
       id  bigserial not null,
        nome varchar(255) not null,
        primary key (id)
    );

    create table estado (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table forma_pagamento (
       id  bigserial not null,
        descricao varchar(255),
        primary key (id)
    );

    create table grupo (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table grupo_permissao (
       grupo_id int8 not null,
        permissao_id int8 not null
    );

    create table permissao (
       id  bigserial not null,
        descricao varchar(255),
        nome varchar(255),
        primary key (id)
    );

    create table produto (
       id  bigserial not null,
        ativo boolean,
        descricao varchar(255),
        nome varchar(255),
        preco numeric(19, 2),
        restaurante_id int8 not null,
        primary key (id)
    );

    create table restaurante (
       id  bigserial not null,
        data_atualizacao TIMESTAMP(0) not null,
        data_cadastro TIMESTAMP(0) not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete numeric(19, 2) not null,
        cozinha_id int8 not null,
        endereco_cidade_id int8,
        primary key (id)
    );

    create table restaurante_forma_pagamento (
       restaurante_id int8 not null,
        forma_pagamento_id int8 not null
    );

    create table usuario (
       id  bigserial not null,
        data_cadastro TIMESTAMP(0) not null,
        email varchar(255),
        nome varchar(255),
        senha varchar(255),
        primary key (id)
    );

    create table usuario_grupo (
       usuario_id int8 not null,
        grupo_id int8 not null
    );

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado;

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao;

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo;

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante;

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha;

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade;

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento;

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante;

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo;

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario;

    create table cidade (
       id  bigserial not null,
        nome varchar(255),
        estado_id int8,
        primary key (id)
    );

    create table cozinha (
       id  bigserial not null,
        nome varchar(255) not null,
        primary key (id)
    );

    create table estado (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table forma_pagamento (
       id  bigserial not null,
        descricao varchar(255),
        primary key (id)
    );

    create table grupo (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table grupo_permissao (
       grupo_id int8 not null,
        permissao_id int8 not null
    );

    create table permissao (
       id  bigserial not null,
        descricao varchar(255),
        nome varchar(255),
        primary key (id)
    );

    create table produto (
       id  bigserial not null,
        ativo boolean,
        descricao varchar(255),
        nome varchar(255),
        preco numeric(19, 2),
        restaurante_id int8 not null,
        primary key (id)
    );

    create table restaurante (
       id  bigserial not null,
        data_atualizacao TIMESTAMP(0) not null,
        data_cadastro TIMESTAMP(0) not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete numeric(19, 2) not null,
        cozinha_id int8 not null,
        endereco_cidade_id int8,
        primary key (id)
    );

    create table restaurante_forma_pagamento (
       restaurante_id int8 not null,
        forma_pagamento_id int8 not null
    );

    create table usuario (
       id  bigserial not null,
        data_cadastro TIMESTAMP(0) not null,
        email varchar(255),
        nome varchar(255),
        senha varchar(255),
        primary key (id)
    );

    create table usuario_grupo (
       usuario_id int8 not null,
        grupo_id int8 not null
    );

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado;

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao;

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo;

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante;

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha;

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade;

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento;

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante;

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo;

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario;

    create table cidade (
       id  bigserial not null,
        nome varchar(255),
        estado_id int8,
        primary key (id)
    );

    create table cozinha (
       id  bigserial not null,
        nome varchar(255) not null,
        primary key (id)
    );

    create table estado (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table forma_pagamento (
       id  bigserial not null,
        descricao varchar(255),
        primary key (id)
    );

    create table grupo (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table grupo_permissao (
       grupo_id int8 not null,
        permissao_id int8 not null
    );

    create table permissao (
       id  bigserial not null,
        descricao varchar(255),
        nome varchar(255),
        primary key (id)
    );

    create table produto (
       id  bigserial not null,
        ativo boolean,
        descricao varchar(255),
        nome varchar(255),
        preco numeric(19, 2),
        restaurante_id int8 not null,
        primary key (id)
    );

    create table restaurante (
       id  bigserial not null,
        data_atualizacao TIMESTAMP(0) not null,
        data_cadastro TIMESTAMP(0) not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete numeric(19, 2) not null,
        cozinha_id int8 not null,
        endereco_cidade_id int8,
        primary key (id)
    );

    create table restaurante_forma_pagamento (
       restaurante_id int8 not null,
        forma_pagamento_id int8 not null
    );

    create table usuario (
       id  bigserial not null,
        data_cadastro TIMESTAMP(0) not null,
        email varchar(255),
        nome varchar(255),
        senha varchar(255),
        primary key (id)
    );

    create table usuario_grupo (
       usuario_id int8 not null,
        grupo_id int8 not null
    );

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado;

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao;

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo;

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante;

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha;

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade;

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento;

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante;

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo;

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario;

    create table cidade (
       id  bigserial not null,
        nome varchar(255),
        estado_id int8,
        primary key (id)
    );

    create table cozinha (
       id  bigserial not null,
        nome varchar(255) not null,
        primary key (id)
    );

    create table estado (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table forma_pagamento (
       id  bigserial not null,
        descricao varchar(255),
        primary key (id)
    );

    create table grupo (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table grupo_permissao (
       grupo_id int8 not null,
        permissao_id int8 not null
    );

    create table permissao (
       id  bigserial not null,
        descricao varchar(255),
        nome varchar(255),
        primary key (id)
    );

    create table produto (
       id  bigserial not null,
        ativo boolean,
        descricao varchar(255),
        nome varchar(255),
        preco numeric(19, 2),
        restaurante_id int8 not null,
        primary key (id)
    );

    create table restaurante (
       id  bigserial not null,
        data_atualizacao TIMESTAMP(0) not null,
        data_cadastro TIMESTAMP(0) not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete numeric(19, 2) not null,
        cozinha_id int8 not null,
        endereco_cidade_id int8,
        primary key (id)
    );

    create table restaurante_forma_pagamento (
       restaurante_id int8 not null,
        forma_pagamento_id int8 not null
    );

    create table usuario (
       id  bigserial not null,
        data_cadastro TIMESTAMP(0) not null,
        email varchar(255),
        nome varchar(255),
        senha varchar(255),
        primary key (id)
    );

    create table usuario_grupo (
       usuario_id int8 not null,
        grupo_id int8 not null
    );

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado;

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao;

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo;

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante;

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha;

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade;

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento;

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante;

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo;

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario;

    create table cidade (
       id  bigserial not null,
        nome varchar(255),
        estado_id int8,
        primary key (id)
    );

    create table cozinha (
       id  bigserial not null,
        nome varchar(255) not null,
        primary key (id)
    );

    create table estado (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table forma_pagamento (
       id  bigserial not null,
        descricao varchar(255),
        primary key (id)
    );

    create table grupo (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table grupo_permissao (
       grupo_id int8 not null,
        permissao_id int8 not null
    );

    create table permissao (
       id  bigserial not null,
        descricao varchar(255),
        nome varchar(255),
        primary key (id)
    );

    create table produto (
       id  bigserial not null,
        ativo boolean,
        descricao varchar(255),
        nome varchar(255),
        preco numeric(19, 2),
        restaurante_id int8 not null,
        primary key (id)
    );

    create table restaurante (
       id  bigserial not null,
        data_atualizacao TIMESTAMP(0) not null,
        data_cadastro TIMESTAMP(0) not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete numeric(19, 2) not null,
        cozinha_id int8 not null,
        endereco_cidade_id int8,
        primary key (id)
    );

    create table restaurante_forma_pagamento (
       restaurante_id int8 not null,
        forma_pagamento_id int8 not null
    );

    create table usuario (
       id  bigserial not null,
        data_cadastro TIMESTAMP(0) not null,
        email varchar(255),
        nome varchar(255),
        senha varchar(255),
        primary key (id)
    );

    create table usuario_grupo (
       usuario_id int8 not null,
        grupo_id int8 not null
    );

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado;

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao;

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo;

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante;

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha;

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade;

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento;

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante;

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo;

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario;

    create table cidade (
       id  bigserial not null,
        nome varchar(255),
        estado_id int8,
        primary key (id)
    );

    create table cozinha (
       id  bigserial not null,
        nome varchar(255) not null,
        primary key (id)
    );

    create table estado (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table forma_pagamento (
       id  bigserial not null,
        descricao varchar(255),
        primary key (id)
    );

    create table grupo (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table grupo_permissao (
       grupo_id int8 not null,
        permissao_id int8 not null
    );

    create table permissao (
       id  bigserial not null,
        descricao varchar(255),
        nome varchar(255),
        primary key (id)
    );

    create table produto (
       id  bigserial not null,
        ativo boolean,
        descricao varchar(255),
        nome varchar(255),
        preco numeric(19, 2),
        restaurante_id int8 not null,
        primary key (id)
    );

    create table restaurante (
       id  bigserial not null,
        data_atualizacao TIMESTAMP(0) not null,
        data_cadastro TIMESTAMP(0) not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete numeric(19, 2) not null,
        cozinha_id int8 not null,
        endereco_cidade_id int8,
        primary key (id)
    );

    create table restaurante_forma_pagamento (
       restaurante_id int8 not null,
        forma_pagamento_id int8 not null
    );

    create table usuario (
       id  bigserial not null,
        data_cadastro TIMESTAMP(0) not null,
        email varchar(255),
        nome varchar(255),
        senha varchar(255),
        primary key (id)
    );

    create table usuario_grupo (
       usuario_id int8 not null,
        grupo_id int8 not null
    );

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado;

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao;

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo;

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante;

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha;

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade;

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento;

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante;

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo;

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario;

    create table cidade (
       id  bigserial not null,
        nome varchar(255),
        estado_id int8,
        primary key (id)
    );

    create table cozinha (
       id  bigserial not null,
        nome varchar(255) not null,
        primary key (id)
    );

    create table estado (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table forma_pagamento (
       id  bigserial not null,
        descricao varchar(255),
        primary key (id)
    );

    create table grupo (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table grupo_permissao (
       grupo_id int8 not null,
        permissao_id int8 not null
    );

    create table permissao (
       id  bigserial not null,
        descricao varchar(255),
        nome varchar(255),
        primary key (id)
    );

    create table produto (
       id  bigserial not null,
        ativo boolean,
        descricao varchar(255),
        nome varchar(255),
        preco numeric(19, 2),
        restaurante_id int8 not null,
        primary key (id)
    );

    create table restaurante (
       id  bigserial not null,
        data_atualizacao TIMESTAMP(0) not null,
        data_cadastro TIMESTAMP(0) not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete numeric(19, 2) not null,
        cozinha_id int8 not null,
        endereco_cidade_id int8,
        primary key (id)
    );

    create table restaurante_forma_pagamento (
       restaurante_id int8 not null,
        forma_pagamento_id int8 not null
    );

    create table usuario (
       id  bigserial not null,
        data_cadastro TIMESTAMP(0) not null,
        email varchar(255),
        nome varchar(255),
        senha varchar(255),
        primary key (id)
    );

    create table usuario_grupo (
       usuario_id int8 not null,
        grupo_id int8 not null
    );

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado;

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao;

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo;

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante;

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha;

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade;

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento;

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante;

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo;

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario;

    create table cidade (
       id  bigserial not null,
        nome varchar(255),
        estado_id int8,
        primary key (id)
    );

    create table cozinha (
       id  bigserial not null,
        nome varchar(255) not null,
        primary key (id)
    );

    create table estado (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table forma_pagamento (
       id  bigserial not null,
        descricao varchar(255),
        primary key (id)
    );

    create table grupo (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table grupo_permissao (
       grupo_id int8 not null,
        permissao_id int8 not null
    );

    create table permissao (
       id  bigserial not null,
        descricao varchar(255),
        nome varchar(255),
        primary key (id)
    );

    create table produto (
       id  bigserial not null,
        ativo boolean,
        descricao varchar(255),
        nome varchar(255),
        preco numeric(19, 2),
        restaurante_id int8 not null,
        primary key (id)
    );

    create table restaurante (
       id  bigserial not null,
        data_atualizacao TIMESTAMP(0) not null,
        data_cadastro TIMESTAMP(0) not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete numeric(19, 2) not null,
        cozinha_id int8 not null,
        endereco_cidade_id int8,
        primary key (id)
    );

    create table restaurante_forma_pagamento (
       restaurante_id int8 not null,
        forma_pagamento_id int8 not null
    );

    create table usuario (
       id  bigserial not null,
        data_cadastro TIMESTAMP(0) not null,
        email varchar(255),
        nome varchar(255),
        senha varchar(255),
        primary key (id)
    );

    create table usuario_grupo (
       usuario_id int8 not null,
        grupo_id int8 not null
    );

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado;

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao;

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo;

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante;

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha;

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade;

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento;

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante;

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo;

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario;

    create table cidade (
       id  bigserial not null,
        nome varchar(255),
        estado_id int8,
        primary key (id)
    );

    create table cozinha (
       id  bigserial not null,
        nome varchar(255) not null,
        primary key (id)
    );

    create table estado (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table forma_pagamento (
       id  bigserial not null,
        descricao varchar(255),
        primary key (id)
    );

    create table grupo (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table grupo_permissao (
       grupo_id int8 not null,
        permissao_id int8 not null
    );

    create table permissao (
       id  bigserial not null,
        descricao varchar(255),
        nome varchar(255),
        primary key (id)
    );

    create table produto (
       id  bigserial not null,
        ativo boolean,
        descricao varchar(255),
        nome varchar(255),
        preco numeric(19, 2),
        restaurante_id int8 not null,
        primary key (id)
    );

    create table restaurante (
       id  bigserial not null,
        data_atualizacao TIMESTAMP(0) not null,
        data_cadastro TIMESTAMP(0) not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete numeric(19, 2) not null,
        cozinha_id int8 not null,
        endereco_cidade_id int8,
        primary key (id)
    );

    create table restaurante_forma_pagamento (
       restaurante_id int8 not null,
        forma_pagamento_id int8 not null
    );

    create table usuario (
       id  bigserial not null,
        data_cadastro TIMESTAMP(0) not null,
        email varchar(255),
        nome varchar(255),
        senha varchar(255),
        primary key (id)
    );

    create table usuario_grupo (
       usuario_id int8 not null,
        grupo_id int8 not null
    );

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado;

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao;

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo;

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante;

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha;

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade;

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento;

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante;

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo;

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario;

    create table cidade (
       id  bigserial not null,
        nome varchar(255),
        estado_id int8,
        primary key (id)
    );

    create table cozinha (
       id  bigserial not null,
        nome varchar(255) not null,
        primary key (id)
    );

    create table estado (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table forma_pagamento (
       id  bigserial not null,
        descricao varchar(255),
        primary key (id)
    );

    create table grupo (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table grupo_permissao (
       grupo_id int8 not null,
        permissao_id int8 not null
    );

    create table permissao (
       id  bigserial not null,
        descricao varchar(255),
        nome varchar(255),
        primary key (id)
    );

    create table produto (
       id  bigserial not null,
        ativo boolean,
        descricao varchar(255),
        nome varchar(255),
        preco numeric(19, 2),
        restaurante_id int8 not null,
        primary key (id)
    );

    create table restaurante (
       id  bigserial not null,
        data_atualizacao TIMESTAMP(0) not null,
        data_cadastro TIMESTAMP(0) not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete numeric(19, 2) not null,
        cozinha_id int8 not null,
        endereco_cidade_id int8,
        primary key (id)
    );

    create table restaurante_forma_pagamento (
       restaurante_id int8 not null,
        forma_pagamento_id int8 not null
    );

    create table usuario (
       id  bigserial not null,
        data_cadastro TIMESTAMP(0) not null,
        email varchar(255),
        nome varchar(255),
        senha varchar(255),
        primary key (id)
    );

    create table usuario_grupo (
       usuario_id int8 not null,
        grupo_id int8 not null
    );

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado;

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao;

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo;

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante;

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha;

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade;

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento;

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante;

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo;

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario;

    create table cidade (
       id  bigserial not null,
        nome varchar(255),
        estado_id int8,
        primary key (id)
    );

    create table cozinha (
       id  bigserial not null,
        nome varchar(255) not null,
        primary key (id)
    );

    create table estado (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table forma_pagamento (
       id  bigserial not null,
        descricao varchar(255),
        primary key (id)
    );

    create table grupo (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table grupo_permissao (
       grupo_id int8 not null,
        permissao_id int8 not null
    );

    create table permissao (
       id  bigserial not null,
        descricao varchar(255),
        nome varchar(255),
        primary key (id)
    );

    create table produto (
       id  bigserial not null,
        ativo boolean,
        descricao varchar(255),
        nome varchar(255),
        preco numeric(19, 2),
        restaurante_id int8 not null,
        primary key (id)
    );

    create table restaurante (
       id  bigserial not null,
        data_atualizacao TIMESTAMP(0) not null,
        data_cadastro TIMESTAMP(0) not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete numeric(19, 2) not null,
        cozinha_id int8 not null,
        endereco_cidade_id int8,
        primary key (id)
    );

    create table restaurante_forma_pagamento (
       restaurante_id int8 not null,
        forma_pagamento_id int8 not null
    );

    create table usuario (
       id  bigserial not null,
        data_cadastro TIMESTAMP(0) not null,
        email varchar(255),
        nome varchar(255),
        senha varchar(255),
        primary key (id)
    );

    create table usuario_grupo (
       usuario_id int8 not null,
        grupo_id int8 not null
    );

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado;

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao;

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo;

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante;

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha;

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade;

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento;

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante;

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo;

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario;

    create table cidade (
       id  bigserial not null,
        nome varchar(255),
        estado_id int8,
        primary key (id)
    );

    create table cozinha (
       id  bigserial not null,
        nome varchar(255) not null,
        primary key (id)
    );

    create table estado (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table forma_pagamento (
       id  bigserial not null,
        descricao varchar(255),
        primary key (id)
    );

    create table grupo (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table grupo_permissao (
       grupo_id int8 not null,
        permissao_id int8 not null
    );

    create table permissao (
       id  bigserial not null,
        descricao varchar(255),
        nome varchar(255),
        primary key (id)
    );

    create table produto (
       id  bigserial not null,
        ativo boolean,
        descricao varchar(255),
        nome varchar(255),
        preco numeric(19, 2),
        restaurante_id int8 not null,
        primary key (id)
    );

    create table restaurante (
       id  bigserial not null,
        data_atualizacao TIMESTAMP(0) not null,
        data_cadastro TIMESTAMP(0) not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete numeric(19, 2) not null,
        cozinha_id int8 not null,
        endereco_cidade_id int8,
        primary key (id)
    );

    create table restaurante_forma_pagamento (
       restaurante_id int8 not null,
        forma_pagamento_id int8 not null
    );

    create table usuario (
       id  bigserial not null,
        data_cadastro TIMESTAMP(0) not null,
        email varchar(255),
        nome varchar(255),
        senha varchar(255),
        primary key (id)
    );

    create table usuario_grupo (
       usuario_id int8 not null,
        grupo_id int8 not null
    );

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado;

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao;

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo;

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante;

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha;

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade;

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento;

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante;

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo;

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario;

    create table cidade (
       id  bigserial not null,
        nome varchar(255),
        estado_id int8,
        primary key (id)
    );

    create table cozinha (
       id  bigserial not null,
        nome varchar(255) not null,
        primary key (id)
    );

    create table estado (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table forma_pagamento (
       id  bigserial not null,
        descricao varchar(255),
        primary key (id)
    );

    create table grupo (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table grupo_permissao (
       grupo_id int8 not null,
        permissao_id int8 not null
    );

    create table permissao (
       id  bigserial not null,
        descricao varchar(255),
        nome varchar(255),
        primary key (id)
    );

    create table produto (
       id  bigserial not null,
        ativo boolean,
        descricao varchar(255),
        nome varchar(255),
        preco numeric(19, 2),
        restaurante_id int8 not null,
        primary key (id)
    );

    create table restaurante (
       id  bigserial not null,
        data_atualizacao TIMESTAMP(0) not null,
        data_cadastro TIMESTAMP(0) not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete numeric(19, 2) not null,
        cozinha_id int8 not null,
        endereco_cidade_id int8,
        primary key (id)
    );

    create table restaurante_forma_pagamento (
       restaurante_id int8 not null,
        forma_pagamento_id int8 not null
    );

    create table usuario (
       id  bigserial not null,
        data_cadastro TIMESTAMP(0) not null,
        email varchar(255),
        nome varchar(255),
        senha varchar(255),
        primary key (id)
    );

    create table usuario_grupo (
       usuario_id int8 not null,
        grupo_id int8 not null
    );

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado;

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao;

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo;

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante;

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha;

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade;

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento;

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante;

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo;

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario;

    create table cidade (
       id  bigserial not null,
        nome varchar(255),
        estado_id int8,
        primary key (id)
    );

    create table cozinha (
       id  bigserial not null,
        nome varchar(255) not null,
        primary key (id)
    );

    create table estado (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table forma_pagamento (
       id  bigserial not null,
        descricao varchar(255),
        primary key (id)
    );

    create table grupo (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table grupo_permissao (
       grupo_id int8 not null,
        permissao_id int8 not null
    );

    create table permissao (
       id  bigserial not null,
        descricao varchar(255),
        nome varchar(255),
        primary key (id)
    );

    create table produto (
       id  bigserial not null,
        ativo boolean,
        descricao varchar(255),
        nome varchar(255),
        preco numeric(19, 2),
        restaurante_id int8 not null,
        primary key (id)
    );

    create table restaurante (
       id  bigserial not null,
        data_atualizacao TIMESTAMP(0) not null,
        data_cadastro TIMESTAMP(0) not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete numeric(19, 2) not null,
        cozinha_id int8 not null,
        endereco_cidade_id int8,
        primary key (id)
    );

    create table restaurante_forma_pagamento (
       restaurante_id int8 not null,
        forma_pagamento_id int8 not null
    );

    create table usuario (
       id  bigserial not null,
        data_cadastro TIMESTAMP(0) not null,
        email varchar(255),
        nome varchar(255),
        senha varchar(255),
        primary key (id)
    );

    create table usuario_grupo (
       usuario_id int8 not null,
        grupo_id int8 not null
    );

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado;

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao;

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo;

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante;

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha;

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade;

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento;

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante;

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo;

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario;

    create table cidade (
       id  bigserial not null,
        nome varchar(255),
        estado_id int8,
        primary key (id)
    );

    create table cozinha (
       id  bigserial not null,
        nome varchar(255) not null,
        primary key (id)
    );

    create table estado (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table forma_pagamento (
       id  bigserial not null,
        descricao varchar(255),
        primary key (id)
    );

    create table grupo (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table grupo_permissao (
       grupo_id int8 not null,
        permissao_id int8 not null
    );

    create table permissao (
       id  bigserial not null,
        descricao varchar(255),
        nome varchar(255),
        primary key (id)
    );

    create table produto (
       id  bigserial not null,
        ativo boolean,
        descricao varchar(255),
        nome varchar(255),
        preco numeric(19, 2),
        restaurante_id int8 not null,
        primary key (id)
    );

    create table restaurante (
       id  bigserial not null,
        data_atualizacao TIMESTAMP(0) not null,
        data_cadastro TIMESTAMP(0) not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete numeric(19, 2) not null,
        cozinha_id int8 not null,
        endereco_cidade_id int8,
        primary key (id)
    );

    create table restaurante_forma_pagamento (
       restaurante_id int8 not null,
        forma_pagamento_id int8 not null
    );

    create table usuario (
       id  bigserial not null,
        data_cadastro TIMESTAMP(0) not null,
        email varchar(255),
        nome varchar(255),
        senha varchar(255),
        primary key (id)
    );

    create table usuario_grupo (
       usuario_id int8 not null,
        grupo_id int8 not null
    );

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado;

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao;

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo;

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante;

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha;

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade;

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento;

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante;

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo;

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario;

    create table cidade (
       id  bigserial not null,
        nome varchar(255),
        estado_id int8,
        primary key (id)
    );

    create table cozinha (
       id  bigserial not null,
        nome varchar(255) not null,
        primary key (id)
    );

    create table estado (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table forma_pagamento (
       id  bigserial not null,
        descricao varchar(255),
        primary key (id)
    );

    create table grupo (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table grupo_permissao (
       grupo_id int8 not null,
        permissao_id int8 not null
    );

    create table permissao (
       id  bigserial not null,
        descricao varchar(255),
        nome varchar(255),
        primary key (id)
    );

    create table produto (
       id  bigserial not null,
        ativo boolean,
        descricao varchar(255),
        nome varchar(255),
        preco numeric(19, 2),
        restaurante_id int8 not null,
        primary key (id)
    );

    create table restaurante (
       id  bigserial not null,
        data_atualizacao TIMESTAMP(0) not null,
        data_cadastro TIMESTAMP(0) not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete numeric(19, 2) not null,
        cozinha_id int8 not null,
        endereco_cidade_id int8,
        primary key (id)
    );

    create table restaurante_forma_pagamento (
       restaurante_id int8 not null,
        forma_pagamento_id int8 not null
    );

    create table usuario (
       id  bigserial not null,
        data_cadastro TIMESTAMP(0) not null,
        email varchar(255),
        nome varchar(255),
        senha varchar(255),
        primary key (id)
    );

    create table usuario_grupo (
       usuario_id int8 not null,
        grupo_id int8 not null
    );

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado;

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao;

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo;

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante;

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha;

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade;

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento;

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante;

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo;

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario;

    create table cidade (
       id  bigserial not null,
        nome varchar(255),
        estado_id int8,
        primary key (id)
    );

    create table cozinha (
       id  bigserial not null,
        nome varchar(255) not null,
        primary key (id)
    );

    create table estado (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table forma_pagamento (
       id  bigserial not null,
        descricao varchar(255),
        primary key (id)
    );

    create table grupo (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table grupo_permissao (
       grupo_id int8 not null,
        permissao_id int8 not null
    );

    create table permissao (
       id  bigserial not null,
        descricao varchar(255),
        nome varchar(255),
        primary key (id)
    );

    create table produto (
       id  bigserial not null,
        ativo boolean,
        descricao varchar(255),
        nome varchar(255),
        preco numeric(19, 2),
        restaurante_id int8 not null,
        primary key (id)
    );

    create table restaurante (
       id  bigserial not null,
        data_atualizacao TIMESTAMP(0) not null,
        data_cadastro TIMESTAMP(0) not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete numeric(19, 2) not null,
        cozinha_id int8 not null,
        endereco_cidade_id int8,
        primary key (id)
    );

    create table restaurante_forma_pagamento (
       restaurante_id int8 not null,
        forma_pagamento_id int8 not null
    );

    create table usuario (
       id  bigserial not null,
        data_cadastro TIMESTAMP(0) not null,
        email varchar(255),
        nome varchar(255),
        senha varchar(255),
        primary key (id)
    );

    create table usuario_grupo (
       usuario_id int8 not null,
        grupo_id int8 not null
    );

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado;

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao;

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo;

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante;

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha;

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade;

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento;

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante;

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo;

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario;

    create table cidade (
       id  bigserial not null,
        nome varchar(255),
        estado_id int8,
        primary key (id)
    );

    create table cozinha (
       id  bigserial not null,
        nome varchar(255) not null,
        primary key (id)
    );

    create table estado (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table forma_pagamento (
       id  bigserial not null,
        descricao varchar(255),
        primary key (id)
    );

    create table grupo (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table grupo_permissao (
       grupo_id int8 not null,
        permissao_id int8 not null
    );

    create table permissao (
       id  bigserial not null,
        descricao varchar(255),
        nome varchar(255),
        primary key (id)
    );

    create table produto (
       id  bigserial not null,
        ativo boolean,
        descricao varchar(255),
        nome varchar(255),
        preco numeric(19, 2),
        restaurante_id int8 not null,
        primary key (id)
    );

    create table restaurante (
       id  bigserial not null,
        data_atualizacao TIMESTAMP(0) not null,
        data_cadastro TIMESTAMP(0) not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete numeric(19, 2) not null,
        cozinha_id int8 not null,
        endereco_cidade_id int8,
        primary key (id)
    );

    create table restaurante_forma_pagamento (
       restaurante_id int8 not null,
        forma_pagamento_id int8 not null
    );

    create table usuario (
       id  bigserial not null,
        data_cadastro TIMESTAMP(0) not null,
        email varchar(255),
        nome varchar(255),
        senha varchar(255),
        primary key (id)
    );

    create table usuario_grupo (
       usuario_id int8 not null,
        grupo_id int8 not null
    );

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado;

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao;

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo;

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante;

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha;

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade;

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento;

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante;

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo;

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario;

    create table cidade (
       id  bigserial not null,
        nome varchar(255),
        estado_id int8,
        primary key (id)
    );

    create table cozinha (
       id  bigserial not null,
        nome varchar(255) not null,
        primary key (id)
    );

    create table estado (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table forma_pagamento (
       id  bigserial not null,
        descricao varchar(255),
        primary key (id)
    );

    create table grupo (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table grupo_permissao (
       grupo_id int8 not null,
        permissao_id int8 not null
    );

    create table permissao (
       id  bigserial not null,
        descricao varchar(255),
        nome varchar(255),
        primary key (id)
    );

    create table produto (
       id  bigserial not null,
        ativo boolean,
        descricao varchar(255),
        nome varchar(255),
        preco numeric(19, 2),
        restaurante_id int8 not null,
        primary key (id)
    );

    create table restaurante (
       id  bigserial not null,
        data_atualizacao TIMESTAMP(0) not null,
        data_cadastro TIMESTAMP(0) not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete numeric(19, 2) not null,
        cozinha_id int8 not null,
        endereco_cidade_id int8,
        primary key (id)
    );

    create table restaurante_forma_pagamento (
       restaurante_id int8 not null,
        forma_pagamento_id int8 not null
    );

    create table usuario (
       id  bigserial not null,
        data_cadastro TIMESTAMP(0) not null,
        email varchar(255),
        nome varchar(255),
        senha varchar(255),
        primary key (id)
    );

    create table usuario_grupo (
       usuario_id int8 not null,
        grupo_id int8 not null
    );

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado;

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao;

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo;

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante;

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha;

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade;

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento;

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante;

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo;

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario;

    create table cidade (
       id  bigserial not null,
        nome varchar(255),
        estado_id int8,
        primary key (id)
    );

    create table cozinha (
       id  bigserial not null,
        nome varchar(255) not null,
        primary key (id)
    );

    create table estado (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table forma_pagamento (
       id  bigserial not null,
        descricao varchar(255),
        primary key (id)
    );

    create table grupo (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table grupo_permissao (
       grupo_id int8 not null,
        permissao_id int8 not null
    );

    create table permissao (
       id  bigserial not null,
        descricao varchar(255),
        nome varchar(255),
        primary key (id)
    );

    create table produto (
       id  bigserial not null,
        ativo boolean,
        descricao varchar(255),
        nome varchar(255),
        preco numeric(19, 2),
        restaurante_id int8 not null,
        primary key (id)
    );

    create table restaurante (
       id  bigserial not null,
        data_atualizacao TIMESTAMP(0) not null,
        data_cadastro TIMESTAMP(0) not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete numeric(19, 2) not null,
        cozinha_id int8 not null,
        endereco_cidade_id int8,
        primary key (id)
    );

    create table restaurante_forma_pagamento (
       restaurante_id int8 not null,
        forma_pagamento_id int8 not null
    );

    create table usuario (
       id  bigserial not null,
        data_cadastro TIMESTAMP(0) not null,
        email varchar(255),
        nome varchar(255),
        senha varchar(255),
        primary key (id)
    );

    create table usuario_grupo (
       usuario_id int8 not null,
        grupo_id int8 not null
    );

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado;

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao;

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo;

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante;

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha;

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade;

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento;

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante;

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo;

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario;

    create table cidade (
       id  bigserial not null,
        nome varchar(255),
        estado_id int8,
        primary key (id)
    );

    create table cozinha (
       id  bigserial not null,
        nome varchar(255) not null,
        primary key (id)
    );

    create table estado (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table forma_pagamento (
       id  bigserial not null,
        descricao varchar(255),
        primary key (id)
    );

    create table grupo (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table grupo_permissao (
       grupo_id int8 not null,
        permissao_id int8 not null
    );

    create table permissao (
       id  bigserial not null,
        descricao varchar(255),
        nome varchar(255),
        primary key (id)
    );

    create table produto (
       id  bigserial not null,
        ativo boolean,
        descricao varchar(255),
        nome varchar(255),
        preco numeric(19, 2),
        restaurante_id int8 not null,
        primary key (id)
    );

    create table restaurante (
       id  bigserial not null,
        data_atualizacao TIMESTAMP(0) not null,
        data_cadastro TIMESTAMP(0) not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete numeric(19, 2) not null,
        cozinha_id int8 not null,
        endereco_cidade_id int8,
        primary key (id)
    );

    create table restaurante_forma_pagamento (
       restaurante_id int8 not null,
        forma_pagamento_id int8 not null
    );

    create table usuario (
       id  bigserial not null,
        data_cadastro TIMESTAMP(0) not null,
        email varchar(255),
        nome varchar(255),
        senha varchar(255),
        primary key (id)
    );

    create table usuario_grupo (
       usuario_id int8 not null,
        grupo_id int8 not null
    );

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado;

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao;

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo;

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante;

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha;

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade;

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento;

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante;

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo;

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario;

    create table cidade (
       id  bigserial not null,
        nome varchar(255),
        estado_id int8,
        primary key (id)
    );

    create table cozinha (
       id  bigserial not null,
        nome varchar(255) not null,
        primary key (id)
    );

    create table estado (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table forma_pagamento (
       id  bigserial not null,
        descricao varchar(255),
        primary key (id)
    );

    create table grupo (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table grupo_permissao (
       grupo_id int8 not null,
        permissao_id int8 not null
    );

    create table permissao (
       id  bigserial not null,
        descricao varchar(255),
        nome varchar(255),
        primary key (id)
    );

    create table produto (
       id  bigserial not null,
        ativo boolean,
        descricao varchar(255),
        nome varchar(255),
        preco numeric(19, 2),
        restaurante_id int8 not null,
        primary key (id)
    );

    create table restaurante (
       id  bigserial not null,
        data_atualizacao TIMESTAMP(0) not null,
        data_cadastro TIMESTAMP(0) not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete numeric(19, 2) not null,
        cozinha_id int8 not null,
        endereco_cidade_id int8,
        primary key (id)
    );

    create table restaurante_forma_pagamento (
       restaurante_id int8 not null,
        forma_pagamento_id int8 not null
    );

    create table usuario (
       id  bigserial not null,
        data_cadastro TIMESTAMP(0) not null,
        email varchar(255),
        nome varchar(255),
        senha varchar(255),
        primary key (id)
    );

    create table usuario_grupo (
       usuario_id int8 not null,
        grupo_id int8 not null
    );

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado;

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao;

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo;

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante;

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha;

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade;

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento;

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante;

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo;

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario;

    create table cidade (
       id  bigserial not null,
        nome varchar(255),
        estado_id int8,
        primary key (id)
    );

    create table cozinha (
       id  bigserial not null,
        nome varchar(255) not null,
        primary key (id)
    );

    create table estado (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table forma_pagamento (
       id  bigserial not null,
        descricao varchar(255),
        primary key (id)
    );

    create table grupo (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table grupo_permissao (
       grupo_id int8 not null,
        permissao_id int8 not null
    );

    create table permissao (
       id  bigserial not null,
        descricao varchar(255),
        nome varchar(255),
        primary key (id)
    );

    create table produto (
       id  bigserial not null,
        ativo boolean,
        descricao varchar(255),
        nome varchar(255),
        preco numeric(19, 2),
        restaurante_id int8 not null,
        primary key (id)
    );

    create table restaurante (
       id  bigserial not null,
        data_atualizacao TIMESTAMP(0) not null,
        data_cadastro TIMESTAMP(0) not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete numeric(19, 2) not null,
        cozinha_id int8 not null,
        endereco_cidade_id int8,
        primary key (id)
    );

    create table restaurante_forma_pagamento (
       restaurante_id int8 not null,
        forma_pagamento_id int8 not null
    );

    create table usuario (
       id  bigserial not null,
        data_cadastro TIMESTAMP(0) not null,
        email varchar(255),
        nome varchar(255),
        senha varchar(255),
        primary key (id)
    );

    create table usuario_grupo (
       usuario_id int8 not null,
        grupo_id int8 not null
    );

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado;

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao;

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo;

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante;

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha;

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade;

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento;

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante;

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo;

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario;

    create table cidade (
       id  bigserial not null,
        nome varchar(255),
        estado_id int8,
        primary key (id)
    );

    create table cozinha (
       id  bigserial not null,
        nome varchar(255) not null,
        primary key (id)
    );

    create table estado (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table forma_pagamento (
       id  bigserial not null,
        descricao varchar(255),
        primary key (id)
    );

    create table grupo (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table grupo_permissao (
       grupo_id int8 not null,
        permissao_id int8 not null
    );

    create table permissao (
       id  bigserial not null,
        descricao varchar(255),
        nome varchar(255),
        primary key (id)
    );

    create table produto (
       id  bigserial not null,
        ativo boolean,
        descricao varchar(255),
        nome varchar(255),
        preco numeric(19, 2),
        restaurante_id int8 not null,
        primary key (id)
    );

    create table restaurante (
       id  bigserial not null,
        data_atualizacao TIMESTAMP(0) not null,
        data_cadastro TIMESTAMP(0) not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete numeric(19, 2) not null,
        cozinha_id int8 not null,
        endereco_cidade_id int8,
        primary key (id)
    );

    create table restaurante_forma_pagamento (
       restaurante_id int8 not null,
        forma_pagamento_id int8 not null
    );

    create table usuario (
       id  bigserial not null,
        data_cadastro TIMESTAMP(0) not null,
        email varchar(255),
        nome varchar(255),
        senha varchar(255),
        primary key (id)
    );

    create table usuario_grupo (
       usuario_id int8 not null,
        grupo_id int8 not null
    );

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado;

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao;

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo;

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante;

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha;

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade;

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento;

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante;

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo;

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario;

    create table cidade (
       id  bigserial not null,
        nome varchar(255),
        estado_id int8,
        primary key (id)
    );

    create table cozinha (
       id  bigserial not null,
        nome varchar(255) not null,
        primary key (id)
    );

    create table estado (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table forma_pagamento (
       id  bigserial not null,
        descricao varchar(255),
        primary key (id)
    );

    create table grupo (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table grupo_permissao (
       grupo_id int8 not null,
        permissao_id int8 not null
    );

    create table permissao (
       id  bigserial not null,
        descricao varchar(255),
        nome varchar(255),
        primary key (id)
    );

    create table produto (
       id  bigserial not null,
        ativo boolean,
        descricao varchar(255),
        nome varchar(255),
        preco numeric(19, 2),
        restaurante_id int8 not null,
        primary key (id)
    );

    create table restaurante (
       id  bigserial not null,
        data_atualizacao TIMESTAMP(0) not null,
        data_cadastro TIMESTAMP(0) not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete numeric(19, 2) not null,
        cozinha_id int8 not null,
        endereco_cidade_id int8,
        primary key (id)
    );

    create table restaurante_forma_pagamento (
       restaurante_id int8 not null,
        forma_pagamento_id int8 not null
    );

    create table usuario (
       id  bigserial not null,
        data_cadastro TIMESTAMP(0) not null,
        email varchar(255),
        nome varchar(255),
        senha varchar(255),
        primary key (id)
    );

    create table usuario_grupo (
       usuario_id int8 not null,
        grupo_id int8 not null
    );

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado;

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao;

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo;

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante;

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha;

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade;

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento;

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante;

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo;

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario;

    create table cidade (
       id  bigserial not null,
        nome varchar(255),
        estado_id int8,
        primary key (id)
    );

    create table cozinha (
       id  bigserial not null,
        nome varchar(255) not null,
        primary key (id)
    );

    create table estado (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table forma_pagamento (
       id  bigserial not null,
        descricao varchar(255),
        primary key (id)
    );

    create table grupo (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table grupo_permissao (
       grupo_id int8 not null,
        permissao_id int8 not null
    );

    create table permissao (
       id  bigserial not null,
        descricao varchar(255),
        nome varchar(255),
        primary key (id)
    );

    create table produto (
       id  bigserial not null,
        ativo boolean,
        descricao varchar(255),
        nome varchar(255),
        preco numeric(19, 2),
        restaurante_id int8 not null,
        primary key (id)
    );

    create table restaurante (
       id  bigserial not null,
        data_atualizacao TIMESTAMP(0) not null,
        data_cadastro TIMESTAMP(0) not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete numeric(19, 2) not null,
        cozinha_id int8 not null,
        endereco_cidade_id int8,
        primary key (id)
    );

    create table restaurante_forma_pagamento (
       restaurante_id int8 not null,
        forma_pagamento_id int8 not null
    );

    create table usuario (
       id  bigserial not null,
        data_cadastro TIMESTAMP(0) not null,
        email varchar(255),
        nome varchar(255),
        senha varchar(255),
        primary key (id)
    );

    create table usuario_grupo (
       usuario_id int8 not null,
        grupo_id int8 not null
    );

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado;

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao;

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo;

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante;

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha;

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade;

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento;

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante;

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo;

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario;

    create table cidade (
       id  bigserial not null,
        nome varchar(255),
        estado_id int8,
        primary key (id)
    );

    create table cozinha (
       id  bigserial not null,
        nome varchar(255) not null,
        primary key (id)
    );

    create table estado (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table forma_pagamento (
       id  bigserial not null,
        descricao varchar(255),
        primary key (id)
    );

    create table grupo (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table grupo_permissao (
       grupo_id int8 not null,
        permissao_id int8 not null
    );

    create table permissao (
       id  bigserial not null,
        descricao varchar(255),
        nome varchar(255),
        primary key (id)
    );

    create table produto (
       id  bigserial not null,
        ativo boolean,
        descricao varchar(255),
        nome varchar(255),
        preco numeric(19, 2),
        restaurante_id int8 not null,
        primary key (id)
    );

    create table restaurante (
       id  bigserial not null,
        data_atualizacao TIMESTAMP(0) not null,
        data_cadastro TIMESTAMP(0) not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete numeric(19, 2) not null,
        cozinha_id int8 not null,
        endereco_cidade_id int8,
        primary key (id)
    );

    create table restaurante_forma_pagamento (
       restaurante_id int8 not null,
        forma_pagamento_id int8 not null
    );

    create table usuario (
       id  bigserial not null,
        data_cadastro TIMESTAMP(0) not null,
        email varchar(255),
        nome varchar(255),
        senha varchar(255),
        primary key (id)
    );

    create table usuario_grupo (
       usuario_id int8 not null,
        grupo_id int8 not null
    );

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado;

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao;

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo;

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante;

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha;

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade;

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento;

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante;

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo;

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario;

    create table cidade (
       id  bigserial not null,
        nome varchar(255),
        estado_id int8,
        primary key (id)
    );

    create table cozinha (
       id  bigserial not null,
        nome varchar(255) not null,
        primary key (id)
    );

    create table estado (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table forma_pagamento (
       id  bigserial not null,
        descricao varchar(255),
        primary key (id)
    );

    create table grupo (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table grupo_permissao (
       grupo_id int8 not null,
        permissao_id int8 not null
    );

    create table permissao (
       id  bigserial not null,
        descricao varchar(255),
        nome varchar(255),
        primary key (id)
    );

    create table produto (
       id  bigserial not null,
        ativo boolean,
        descricao varchar(255),
        nome varchar(255),
        preco numeric(19, 2),
        restaurante_id int8 not null,
        primary key (id)
    );

    create table restaurante (
       id  bigserial not null,
        data_atualizacao TIMESTAMP(0) not null,
        data_cadastro TIMESTAMP(0) not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete numeric(19, 2) not null,
        cozinha_id int8 not null,
        endereco_cidade_id int8,
        primary key (id)
    );

    create table restaurante_forma_pagamento (
       restaurante_id int8 not null,
        forma_pagamento_id int8 not null
    );

    create table usuario (
       id  bigserial not null,
        data_cadastro TIMESTAMP(0) not null,
        email varchar(255),
        nome varchar(255),
        senha varchar(255),
        primary key (id)
    );

    create table usuario_grupo (
       usuario_id int8 not null,
        grupo_id int8 not null
    );

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado;

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao;

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo;

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante;

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha;

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade;

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento;

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante;

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo;

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario;

    create table cidade (
       id  bigserial not null,
        nome varchar(255),
        estado_id int8,
        primary key (id)
    );

    create table cozinha (
       id  bigserial not null,
        nome varchar(255) not null,
        primary key (id)
    );

    create table estado (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table forma_pagamento (
       id  bigserial not null,
        descricao varchar(255),
        primary key (id)
    );

    create table grupo (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table grupo_permissao (
       grupo_id int8 not null,
        permissao_id int8 not null
    );

    create table permissao (
       id  bigserial not null,
        descricao varchar(255),
        nome varchar(255),
        primary key (id)
    );

    create table produto (
       id  bigserial not null,
        ativo boolean,
        descricao varchar(255),
        nome varchar(255),
        preco numeric(19, 2),
        restaurante_id int8 not null,
        primary key (id)
    );

    create table restaurante (
       id  bigserial not null,
        data_atualizacao TIMESTAMP(0) not null,
        data_cadastro TIMESTAMP(0) not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete numeric(19, 2) not null,
        cozinha_id int8 not null,
        endereco_cidade_id int8,
        primary key (id)
    );

    create table restaurante_forma_pagamento (
       restaurante_id int8 not null,
        forma_pagamento_id int8 not null
    );

    create table usuario (
       id  bigserial not null,
        data_cadastro TIMESTAMP(0) not null,
        email varchar(255),
        nome varchar(255),
        senha varchar(255),
        primary key (id)
    );

    create table usuario_grupo (
       usuario_id int8 not null,
        grupo_id int8 not null
    );

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado;

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao;

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo;

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante;

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha;

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade;

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento;

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante;

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo;

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario;

    create table cidade (
       id  bigserial not null,
        nome varchar(255),
        estado_id int8,
        primary key (id)
    );

    create table cozinha (
       id  bigserial not null,
        nome varchar(255) not null,
        primary key (id)
    );

    create table estado (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table forma_pagamento (
       id  bigserial not null,
        descricao varchar(255),
        primary key (id)
    );

    create table grupo (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table grupo_permissao (
       grupo_id int8 not null,
        permissao_id int8 not null
    );

    create table permissao (
       id  bigserial not null,
        descricao varchar(255),
        nome varchar(255),
        primary key (id)
    );

    create table produto (
       id  bigserial not null,
        ativo boolean,
        descricao varchar(255),
        nome varchar(255),
        preco numeric(19, 2),
        restaurante_id int8 not null,
        primary key (id)
    );

    create table restaurante (
       id  bigserial not null,
        data_atualizacao TIMESTAMP(0) not null,
        data_cadastro TIMESTAMP(0) not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete numeric(19, 2) not null,
        cozinha_id int8 not null,
        endereco_cidade_id int8,
        primary key (id)
    );

    create table restaurante_forma_pagamento (
       restaurante_id int8 not null,
        forma_pagamento_id int8 not null
    );

    create table usuario (
       id  bigserial not null,
        data_cadastro TIMESTAMP(0) not null,
        email varchar(255),
        nome varchar(255),
        senha varchar(255),
        primary key (id)
    );

    create table usuario_grupo (
       usuario_id int8 not null,
        grupo_id int8 not null
    );

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado;

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao;

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo;

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante;

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha;

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade;

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento;

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante;

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo;

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario;

    create table cidade (
       id  bigserial not null,
        nome varchar(255),
        estado_id int8,
        primary key (id)
    );

    create table cozinha (
       id  bigserial not null,
        nome varchar(255) not null,
        primary key (id)
    );

    create table estado (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table forma_pagamento (
       id  bigserial not null,
        descricao varchar(255),
        primary key (id)
    );

    create table grupo (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table grupo_permissao (
       grupo_id int8 not null,
        permissao_id int8 not null
    );

    create table permissao (
       id  bigserial not null,
        descricao varchar(255),
        nome varchar(255),
        primary key (id)
    );

    create table produto (
       id  bigserial not null,
        ativo boolean,
        descricao varchar(255),
        nome varchar(255),
        preco numeric(19, 2),
        restaurante_id int8 not null,
        primary key (id)
    );

    create table restaurante (
       id  bigserial not null,
        data_atualizacao TIMESTAMP(0) not null,
        data_cadastro TIMESTAMP(0) not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete numeric(19, 2) not null,
        cozinha_id int8 not null,
        endereco_cidade_id int8,
        primary key (id)
    );

    create table restaurante_forma_pagamento (
       restaurante_id int8 not null,
        forma_pagamento_id int8 not null
    );

    create table usuario (
       id  bigserial not null,
        data_cadastro TIMESTAMP(0) not null,
        email varchar(255),
        nome varchar(255),
        senha varchar(255),
        primary key (id)
    );

    create table usuario_grupo (
       usuario_id int8 not null,
        grupo_id int8 not null
    );

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado;

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao;

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo;

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante;

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha;

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade;

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento;

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante;

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo;

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario;

    create table cidade (
       id  bigserial not null,
        nome varchar(255),
        estado_id int8,
        primary key (id)
    );

    create table cozinha (
       id  bigserial not null,
        nome varchar(255) not null,
        primary key (id)
    );

    create table estado (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table forma_pagamento (
       id  bigserial not null,
        descricao varchar(255),
        primary key (id)
    );

    create table grupo (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table grupo_permissao (
       grupo_id int8 not null,
        permissao_id int8 not null
    );

    create table permissao (
       id  bigserial not null,
        descricao varchar(255),
        nome varchar(255),
        primary key (id)
    );

    create table produto (
       id  bigserial not null,
        ativo boolean,
        descricao varchar(255),
        nome varchar(255),
        preco numeric(19, 2),
        restaurante_id int8 not null,
        primary key (id)
    );

    create table restaurante (
       id  bigserial not null,
        data_atualizacao TIMESTAMP(0) not null,
        data_cadastro TIMESTAMP(0) not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete numeric(19, 2) not null,
        cozinha_id int8 not null,
        endereco_cidade_id int8,
        primary key (id)
    );

    create table restaurante_forma_pagamento (
       restaurante_id int8 not null,
        forma_pagamento_id int8 not null
    );

    create table usuario (
       id  bigserial not null,
        data_cadastro TIMESTAMP(0) not null,
        email varchar(255),
        nome varchar(255),
        senha varchar(255),
        primary key (id)
    );

    create table usuario_grupo (
       usuario_id int8 not null,
        grupo_id int8 not null
    );

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado;

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao;

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo;

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante;

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha;

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade;

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento;

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante;

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo;

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario;

    create table cidade (
       id  bigserial not null,
        nome varchar(255),
        estado_id int8,
        primary key (id)
    );

    create table cozinha (
       id  bigserial not null,
        nome varchar(255) not null,
        primary key (id)
    );

    create table estado (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table forma_pagamento (
       id  bigserial not null,
        descricao varchar(255),
        primary key (id)
    );

    create table grupo (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table grupo_permissao (
       grupo_id int8 not null,
        permissao_id int8 not null
    );

    create table permissao (
       id  bigserial not null,
        descricao varchar(255),
        nome varchar(255),
        primary key (id)
    );

    create table produto (
       id  bigserial not null,
        ativo boolean,
        descricao varchar(255),
        nome varchar(255),
        preco numeric(19, 2),
        restaurante_id int8 not null,
        primary key (id)
    );

    create table restaurante (
       id  bigserial not null,
        data_atualizacao TIMESTAMP(0) not null,
        data_cadastro TIMESTAMP(0) not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete numeric(19, 2) not null,
        cozinha_id int8 not null,
        endereco_cidade_id int8,
        primary key (id)
    );

    create table restaurante_forma_pagamento (
       restaurante_id int8 not null,
        forma_pagamento_id int8 not null
    );

    create table usuario (
       id  bigserial not null,
        data_cadastro TIMESTAMP(0) not null,
        email varchar(255),
        nome varchar(255),
        senha varchar(255),
        primary key (id)
    );

    create table usuario_grupo (
       usuario_id int8 not null,
        grupo_id int8 not null
    );

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado;

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao;

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo;

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante;

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha;

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade;

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento;

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante;

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo;

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario;

    create table cidade (
       id  bigserial not null,
        nome varchar(255),
        estado_id int8,
        primary key (id)
    );

    create table cozinha (
       id  bigserial not null,
        nome varchar(255) not null,
        primary key (id)
    );

    create table estado (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table forma_pagamento (
       id  bigserial not null,
        descricao varchar(255),
        primary key (id)
    );

    create table grupo (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table grupo_permissao (
       grupo_id int8 not null,
        permissao_id int8 not null
    );

    create table permissao (
       id  bigserial not null,
        descricao varchar(255),
        nome varchar(255),
        primary key (id)
    );

    create table produto (
       id  bigserial not null,
        ativo boolean,
        descricao varchar(255),
        nome varchar(255),
        preco numeric(19, 2),
        restaurante_id int8 not null,
        primary key (id)
    );

    create table restaurante (
       id  bigserial not null,
        data_atualizacao TIMESTAMP(0) not null,
        data_cadastro TIMESTAMP(0) not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete numeric(19, 2) not null,
        cozinha_id int8 not null,
        endereco_cidade_id int8,
        primary key (id)
    );

    create table restaurante_forma_pagamento (
       restaurante_id int8 not null,
        forma_pagamento_id int8 not null
    );

    create table usuario (
       id  bigserial not null,
        data_cadastro TIMESTAMP(0) not null,
        email varchar(255),
        nome varchar(255),
        senha varchar(255),
        primary key (id)
    );

    create table usuario_grupo (
       usuario_id int8 not null,
        grupo_id int8 not null
    );

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado;

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao;

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo;

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante;

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha;

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade;

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento;

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante;

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo;

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario;

    create table cidade (
       id  bigserial not null,
        nome varchar(255),
        estado_id int8,
        primary key (id)
    );

    create table cozinha (
       id  bigserial not null,
        nome varchar(255) not null,
        primary key (id)
    );

    create table estado (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table forma_pagamento (
       id  bigserial not null,
        descricao varchar(255),
        primary key (id)
    );

    create table grupo (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table grupo_permissao (
       grupo_id int8 not null,
        permissao_id int8 not null
    );

    create table permissao (
       id  bigserial not null,
        descricao varchar(255),
        nome varchar(255),
        primary key (id)
    );

    create table produto (
       id  bigserial not null,
        ativo boolean,
        descricao varchar(255),
        nome varchar(255),
        preco numeric(19, 2),
        restaurante_id int8 not null,
        primary key (id)
    );

    create table restaurante (
       id  bigserial not null,
        data_atualizacao TIMESTAMP(0) not null,
        data_cadastro TIMESTAMP(0) not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete numeric(19, 2) not null,
        cozinha_id int8 not null,
        endereco_cidade_id int8,
        primary key (id)
    );

    create table restaurante_forma_pagamento (
       restaurante_id int8 not null,
        forma_pagamento_id int8 not null
    );

    create table usuario (
       id  bigserial not null,
        data_cadastro TIMESTAMP(0) not null,
        email varchar(255),
        nome varchar(255),
        senha varchar(255),
        primary key (id)
    );

    create table usuario_grupo (
       usuario_id int8 not null,
        grupo_id int8 not null
    );

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado;

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao;

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo;

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante;

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha;

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade;

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento;

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante;

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo;

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario;

    create table cidade (
       id  bigserial not null,
        nome varchar(255),
        estado_id int8,
        primary key (id)
    );

    create table cozinha (
       id  bigserial not null,
        nome varchar(255) not null,
        primary key (id)
    );

    create table estado (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table forma_pagamento (
       id  bigserial not null,
        descricao varchar(255),
        primary key (id)
    );

    create table grupo (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table grupo_permissao (
       grupo_id int8 not null,
        permissao_id int8 not null
    );

    create table permissao (
       id  bigserial not null,
        descricao varchar(255),
        nome varchar(255),
        primary key (id)
    );

    create table produto (
       id  bigserial not null,
        ativo boolean,
        descricao varchar(255),
        nome varchar(255),
        preco numeric(19, 2),
        restaurante_id int8 not null,
        primary key (id)
    );

    create table restaurante (
       id  bigserial not null,
        data_atualizacao TIMESTAMP(0) not null,
        data_cadastro TIMESTAMP(0) not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete numeric(19, 2) not null,
        cozinha_id int8 not null,
        endereco_cidade_id int8,
        primary key (id)
    );

    create table restaurante_forma_pagamento (
       restaurante_id int8 not null,
        forma_pagamento_id int8 not null
    );

    create table usuario (
       id  bigserial not null,
        data_cadastro TIMESTAMP(0) not null,
        email varchar(255),
        nome varchar(255),
        senha varchar(255),
        primary key (id)
    );

    create table usuario_grupo (
       usuario_id int8 not null,
        grupo_id int8 not null
    );

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado;

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao;

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo;

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante;

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha;

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade;

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento;

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante;

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo;

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario;

    create table cidade (
       id  bigserial not null,
        nome varchar(255),
        estado_id int8,
        primary key (id)
    );

    create table cozinha (
       id  bigserial not null,
        nome varchar(255) not null,
        primary key (id)
    );

    create table estado (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table forma_pagamento (
       id  bigserial not null,
        descricao varchar(255),
        primary key (id)
    );

    create table grupo (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table grupo_permissao (
       grupo_id int8 not null,
        permissao_id int8 not null
    );

    create table permissao (
       id  bigserial not null,
        descricao varchar(255),
        nome varchar(255),
        primary key (id)
    );

    create table produto (
       id  bigserial not null,
        ativo boolean,
        descricao varchar(255),
        nome varchar(255),
        preco numeric(19, 2),
        restaurante_id int8 not null,
        primary key (id)
    );

    create table restaurante (
       id  bigserial not null,
        data_atualizacao TIMESTAMP(0) not null,
        data_cadastro TIMESTAMP(0) not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete numeric(19, 2) not null,
        cozinha_id int8 not null,
        endereco_cidade_id int8,
        primary key (id)
    );

    create table restaurante_forma_pagamento (
       restaurante_id int8 not null,
        forma_pagamento_id int8 not null
    );

    create table usuario (
       id  bigserial not null,
        data_cadastro TIMESTAMP(0) not null,
        email varchar(255),
        nome varchar(255),
        senha varchar(255),
        primary key (id)
    );

    create table usuario_grupo (
       usuario_id int8 not null,
        grupo_id int8 not null
    );

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado;

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao;

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo;

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante;

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha;

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade;

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento;

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante;

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo;

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario;

    create table cidade (
       id  bigserial not null,
        nome varchar(255),
        estado_id int8,
        primary key (id)
    );

    create table cozinha (
       id  bigserial not null,
        nome varchar(255) not null,
        primary key (id)
    );

    create table estado (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table forma_pagamento (
       id  bigserial not null,
        descricao varchar(255),
        primary key (id)
    );

    create table grupo (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table grupo_permissao (
       grupo_id int8 not null,
        permissao_id int8 not null
    );

    create table permissao (
       id  bigserial not null,
        descricao varchar(255),
        nome varchar(255),
        primary key (id)
    );

    create table produto (
       id  bigserial not null,
        ativo boolean,
        descricao varchar(255),
        nome varchar(255),
        preco numeric(19, 2),
        restaurante_id int8 not null,
        primary key (id)
    );

    create table restaurante (
       id  bigserial not null,
        data_atualizacao TIMESTAMP(0) not null,
        data_cadastro TIMESTAMP(0) not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete numeric(19, 2) not null,
        cozinha_id int8 not null,
        endereco_cidade_id int8,
        primary key (id)
    );

    create table restaurante_forma_pagamento (
       restaurante_id int8 not null,
        forma_pagamento_id int8 not null
    );

    create table usuario (
       id  bigserial not null,
        data_cadastro TIMESTAMP(0) not null,
        email varchar(255),
        nome varchar(255),
        senha varchar(255),
        primary key (id)
    );

    create table usuario_grupo (
       usuario_id int8 not null,
        grupo_id int8 not null
    );

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado;

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao;

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo;

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante;

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha;

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade;

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento;

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante;

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo;

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario;

    create table cidade (
       id  bigserial not null,
        nome varchar(255),
        estado_id int8,
        primary key (id)
    );

    create table cozinha (
       id  bigserial not null,
        nome varchar(255) not null,
        primary key (id)
    );

    create table estado (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table forma_pagamento (
       id  bigserial not null,
        descricao varchar(255),
        primary key (id)
    );

    create table grupo (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table grupo_permissao (
       grupo_id int8 not null,
        permissao_id int8 not null
    );

    create table permissao (
       id  bigserial not null,
        descricao varchar(255),
        nome varchar(255),
        primary key (id)
    );

    create table produto (
       id  bigserial not null,
        ativo boolean,
        descricao varchar(255),
        nome varchar(255),
        preco numeric(19, 2),
        restaurante_id int8 not null,
        primary key (id)
    );

    create table restaurante (
       id  bigserial not null,
        data_atualizacao TIMESTAMP(0) not null,
        data_cadastro TIMESTAMP(0) not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete numeric(19, 2) not null,
        cozinha_id int8 not null,
        endereco_cidade_id int8,
        primary key (id)
    );

    create table restaurante_forma_pagamento (
       restaurante_id int8 not null,
        forma_pagamento_id int8 not null
    );

    create table usuario (
       id  bigserial not null,
        data_cadastro TIMESTAMP(0) not null,
        email varchar(255),
        nome varchar(255),
        senha varchar(255),
        primary key (id)
    );

    create table usuario_grupo (
       usuario_id int8 not null,
        grupo_id int8 not null
    );

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado;

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao;

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo;

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante;

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha;

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade;

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento;

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante;

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo;

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario;

    create table cidade (
       id  bigserial not null,
        nome varchar(255),
        estado_id int8,
        primary key (id)
    );

    create table cozinha (
       id  bigserial not null,
        nome varchar(255) not null,
        primary key (id)
    );

    create table estado (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table forma_pagamento (
       id  bigserial not null,
        descricao varchar(255),
        primary key (id)
    );

    create table grupo (
       id  bigserial not null,
        nome varchar(255),
        primary key (id)
    );

    create table grupo_permissao (
       grupo_id int8 not null,
        permissao_id int8 not null
    );

    create table permissao (
       id  bigserial not null,
        descricao varchar(255),
        nome varchar(255),
        primary key (id)
    );

    create table produto (
       id  bigserial not null,
        ativo boolean,
        descricao varchar(255),
        nome varchar(255),
        preco numeric(19, 2),
        restaurante_id int8 not null,
        primary key (id)
    );

    create table restaurante (
       id  bigserial not null,
        data_atualizacao TIMESTAMP(0) not null,
        data_cadastro TIMESTAMP(0) not null,
        endereco_bairro varchar(255),
        endereco_cep varchar(255),
        endereco_complemento varchar(255),
        endereco_logradouro varchar(255),
        endereco_numero varchar(255),
        nome varchar(255) not null,
        taxa_frete numeric(19, 2) not null,
        cozinha_id int8 not null,
        endereco_cidade_id int8,
        primary key (id)
    );

    create table restaurante_forma_pagamento (
       restaurante_id int8 not null,
        forma_pagamento_id int8 not null
    );

    create table usuario (
       id  bigserial not null,
        data_cadastro TIMESTAMP(0) not null,
        email varchar(255),
        nome varchar(255),
        senha varchar(255),
        primary key (id)
    );

    create table usuario_grupo (
       usuario_id int8 not null,
        grupo_id int8 not null
    );

    alter table cidade 
       add constraint FKkworrwk40xj58kevvh3evi500 
       foreign key (estado_id) 
       references estado;

    alter table grupo_permissao 
       add constraint FKh21kiw0y0hxg6birmdf2ef6vy 
       foreign key (permissao_id) 
       references permissao;

    alter table grupo_permissao 
       add constraint FKta4si8vh3f4jo3bsslvkscc2m 
       foreign key (grupo_id) 
       references grupo;

    alter table produto 
       add constraint FKb9jhjyghjcn25guim7q4pt8qx 
       foreign key (restaurante_id) 
       references restaurante;

    alter table restaurante 
       add constraint FK76grk4roudh659skcgbnanthi 
       foreign key (cozinha_id) 
       references cozinha;

    alter table restaurante 
       add constraint FKbc0tm7hnvc96d8e7e2ulb05yw 
       foreign key (endereco_cidade_id) 
       references cidade;

    alter table restaurante_forma_pagamento 
       add constraint FK7aln770m80358y4olr03hyhh2 
       foreign key (forma_pagamento_id) 
       references forma_pagamento;

    alter table restaurante_forma_pagamento 
       add constraint FKa30vowfejemkw7whjvr8pryvj 
       foreign key (restaurante_id) 
       references restaurante;

    alter table usuario_grupo 
       add constraint FKk30suuy31cq5u36m9am4om9ju 
       foreign key (grupo_id) 
       references grupo;

    alter table usuario_grupo 
       add constraint FKdofo9es0esuiahyw2q467crxw 
       foreign key (usuario_id) 
       references usuario;
