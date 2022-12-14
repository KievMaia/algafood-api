package com.algaworks.algafood.domain.repository;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.algaworks.algafood.domain.model.Restaurante;

@Repository
public interface RestauranteRepository extends CustomJpaRepository<Restaurante, Long>, RestauranteRepositoryQueries, JpaSpecificationExecutor<Restaurante> {

	@Query("FROM Restaurante r JOIN FETCH r.cozinha LEFT JOIN FETCH r.formasPagamento")
	List<Restaurante> findAll();
	
	List<Restaurante> findByTaxaFreteBetween(BigDecimal taxaInicial, BigDecimal taxaFinal);

//	@Query("FROM Restaurante WHERE nome LIKE %:nome% AND cozinha.id = :cozinhaId")
	List<Restaurante> consultarPorNome(String nome, @Param("cozinhaId") Long cozinhaId);

	List<Restaurante> findByNomeContainingAndCozinhaId(String nome, Long cozinha);

	Optional<Restaurante> findFirstByNomeContaining(String nome);

	List<Restaurante> findTop2ByNomeContaining(String nome);

}
