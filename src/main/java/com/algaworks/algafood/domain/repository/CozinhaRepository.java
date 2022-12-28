package com.algaworks.algafood.domain.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.algaworks.algafood.domain.model.Cozinha;

@Repository
public interface CozinhaRepository extends CustomJpaRepository<Cozinha, Long>{

//	Se quiser paginar a implementação do repository.
//	Page<Cozinha> findByNomeContaining(String nome, Pageable pageble);
	
	List<Cozinha> findByNomeContaining(String nome);

	boolean existsByNome(String nome);
}
