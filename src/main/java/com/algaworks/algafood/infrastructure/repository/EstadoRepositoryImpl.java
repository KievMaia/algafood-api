package com.algaworks.algafood.infrastructure.repository;

import java.util.List;
import java.util.Objects;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import com.algaworks.algafood.domain.model.Estado;
import com.algaworks.algafood.domain.repository.EstadoRepository;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Component;

@Component
public class EstadoRepositoryImpl implements EstadoRepository {

	@PersistenceContext
	private EntityManager manager;

	@Override
	public List<Estado> listar() {
		return manager.createQuery("from Estado", Estado.class).getResultList();
	}

	@Override
	public Estado buscar(Long id) {
		return manager.find(Estado.class, id);
	}

	@Transactional
	@Override
	public Estado salvar(Estado estado) {
		return manager.merge(estado);
	}

	@Transactional
	@Override
	public void remover(Long estadoId) {
		Estado estado = buscar(estadoId);

		if (Objects.isNull(estado)) {
			throw new EmptyResultDataAccessException(1);
		}

		manager.remove(estado);
	}

}
