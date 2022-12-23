package com.algaworks.algafood.domain.exception;

public class ProdutoNaoEncontradoException extends EntidadeNaoEncontradaException{

	private static final long serialVersionUID = 1L;

	public ProdutoNaoEncontradoException(String mensagem) {
		super(mensagem);
	}
	
	public ProdutoNaoEncontradoException(Long produtoId) {
		this(String.format("Não existe um cadastro de produto com o codigo %d", produtoId));
	}
	
	public ProdutoNaoEncontradoException(Long produtoId, Long restauranteId) {
		this(String.format("Não existe um cadastro de produto com o código %d para o restaurante de código %d", produtoId, restauranteId));
	}
}
