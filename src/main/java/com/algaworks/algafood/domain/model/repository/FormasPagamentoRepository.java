package com.algaworks.algafood.domain.model.repository;

import java.util.List;

import com.algaworks.algafood.domain.model.FormasPagamento;

public interface FormasPagamentoRepository {

	List<FormasPagamento> listar();
	FormasPagamento buscar(Long id);
	FormasPagamento salvar(FormasPagamento cozinha);
	void remover(FormasPagamento cozinha);
}
