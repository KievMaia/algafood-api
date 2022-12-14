create table estado (
       id  bigserial not null,
        nome varchar(80) not null,
        primary key (id)
    );
	
alter table cidade add column estado_id bigserial not null;

alter table cidade add constraint fk_cidade_estado FOREIGN key (estado_id) references estado (id);

alter table cidade drop column nome_estado;

alter table cidade RENAME nome_cidade to nome;