package com.algaworks.algafood.infrastructure.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import com.algaworks.algafood.domain.model.FormaPagamento;
import com.algaworks.algafood.domain.repository.FormasPagamentoRepository;

import org.springframework.stereotype.Component;

@Component
public class FormasPagamentoRepositoryImpl implements FormasPagamentoRepository	 {

	@PersistenceContext
	private EntityManager manager;
	
	@Override
	public List<FormaPagamento> listar() {
		return manager.createQuery("from FormasPagamento", FormaPagamento.class)
				.getResultList();
	}
	
	@Override
	public FormaPagamento buscar(Long id) {
		return manager.find(FormaPagamento.class, id);
	}
	
	@Transactional
	@Override
	public FormaPagamento salvar(FormaPagamento formasPagamento) {
		return manager.merge(formasPagamento);
	}
	
	@Transactional
	@Override
	public void remover(FormaPagamento formasPagamento) {
		formasPagamento = buscar(formasPagamento.getId());
		manager.remove(formasPagamento);
	}

}
