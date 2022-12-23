package com.algaworks.algafood.domain.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.algaworks.algafood.domain.model.Produto;

@Repository
public interface ProdutoRepository extends JpaRepository<Produto, Long>{

	@Query("FROM Produto p WHERE restaurante_id = :restauranteId AND id = :produtoId")
	Optional<Produto> findByRestauranteIdAndProdutoId(@Param("restauranteId") Long restauranteId, @Param("produtoId") Long produtoId);
}
