package com.algaworks.algafood.infrastructure.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import com.algaworks.algafood.domain.model.FormasPagamento;
import com.algaworks.algafood.domain.model.repository.FormasPagamentoRepository;

import org.springframework.stereotype.Component;

@Component
public class FormasPagamentoRepositoryImpl implements FormasPagamentoRepository	 {

	@PersistenceContext
	private EntityManager manager;
	
	@Override
	public List<FormasPagamento> listar() {
		return manager.createQuery("from FormasPagamento", FormasPagamento.class)
				.getResultList();
	}
	
	@Override
	public FormasPagamento buscar(Long id) {
		return manager.find(FormasPagamento.class, id);
	}
	
	@Transactional
	@Override
	public FormasPagamento salvar(FormasPagamento formasPagamento) {
		return manager.merge(formasPagamento);
	}
	
	@Transactional
	@Override
	public void remover(FormasPagamento formasPagamento) {
		formasPagamento = buscar(formasPagamento.getId());
		manager.remove(formasPagamento);
	}

}
