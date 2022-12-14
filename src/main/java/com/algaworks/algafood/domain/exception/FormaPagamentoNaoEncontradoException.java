package com.algaworks.algafood.domain.exception;

public class FormaPagamentoNaoEncontradoException extends EntidadeNaoEncontradaException{

	private static final long serialVersionUID = 1L;

	public FormaPagamentoNaoEncontradoException(String mensagem) {
		super(mensagem);
	}

	public FormaPagamentoNaoEncontradoException(Long formaPagamentoId) {
		this(String.format("Não existe um cadastro de forma de pagamento com o codigo %d", formaPagamentoId));
	}
	
	public FormaPagamentoNaoEncontradoException(Long formaPagamentoId, Long restauranteId) {
		this(String.format("Não existe um cadastro de forma de pagamento com o codigo %d para o restaurante código %d", formaPagamentoId, restauranteId));
	}
}
