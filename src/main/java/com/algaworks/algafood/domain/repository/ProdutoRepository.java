package com.algaworks.algafood.domain.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.algaworks.algafood.domain.model.FotoProduto;
import com.algaworks.algafood.domain.model.Produto;
import com.algaworks.algafood.domain.model.Restaurante;

@Repository
public interface ProdutoRepository extends JpaRepository<Produto, Long>, ProdutoRepositoryQueries {

	@Query("FROM Produto p WHERE restaurante_id = :restauranteId AND id = :produtoId")
	Optional<Produto> findByRestauranteIdAndProdutoId(@Param("restauranteId") Long restauranteId,
			@Param("produtoId") Long produtoId);

	@Query("FROM Produto WHERE restaurante_id = :restaurante AND ativo = true")
	List<Produto> findAtivosByRestaurante(Restaurante restaurante);

	List<Produto> findTodosByRestaurante(Restaurante restaurante);

	@Query("SELECT f FROM FotoProduto f JOIN f.produto p "
			+ "WHERE p.restaurante.id = :restauranteId AND f.produto.id = :produtoId")
	Optional<FotoProduto> findFotoById(Long restauranteId, Long produtoId);
}
