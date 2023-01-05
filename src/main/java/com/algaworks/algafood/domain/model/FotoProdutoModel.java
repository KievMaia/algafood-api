package com.algaworks.algafood.domain.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FotoProdutoModel {

	private String nomeArquivo;
	private String descricao;
	private String contentType;
	private Long tamanho;
}
