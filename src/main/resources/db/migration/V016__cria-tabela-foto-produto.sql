create table foto_produto (
	produto_id bigserial not null,
	nome_arquivo varchar(150) not null,
	descricao varchar(150),
content_type varchar(80) not null,
tamanho integer not null,

primary key(produto_id)
);

alter table foto_produto
	add constraint fk_foto_produto 
	foreign key (produto_id)
	references produto (id);