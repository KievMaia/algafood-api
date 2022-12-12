package com.algaworks.algafood.domain.repository;

import java.util.List;

import com.algaworks.algafood.domain.model.Cozinha;

public interface CozinhaRepository extends CustomJpaRepository<Cozinha, Long>{

	List<Cozinha> findByNomeContaining(String nome);

	boolean existsByNome(String nome);
}
