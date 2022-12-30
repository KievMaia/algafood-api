package com.algaworks.algafood.infrastructure.service;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import com.algaworks.algafood.domain.filter.VendaDiariaFilter;
import com.algaworks.algafood.domain.model.Pedido;
import com.algaworks.algafood.domain.model.dto.VendaDiaria;
import com.algaworks.algafood.domain.service.VendaQueryService;

@Repository
public class VendaQueryServiceImpl implements VendaQueryService{

	@PersistenceContext
	private EntityManager manager;
	
	@Override
	public List<VendaDiaria> consultarVendasDiarias(VendaDiariaFilter filtro) {
		var builder = manager.getCriteriaBuilder();
		var query = builder.createQuery(VendaDiaria.class);
		var root = query.from(Pedido.class);
		
		var functionDateDataCriacao = builder.function(
				"date", LocalDate.class, root.get("dataCriacao"));
		
		var selection = builder.construct(VendaDiaria.class, 
				functionDateDataCriacao,
				builder.count(root.get("id")),
				builder.sum(root.get("valorTotal")));
		
		query.select(selection);
		query.groupBy(functionDateDataCriacao);
		
		return manager.createQuery(query).getResultList();
	}

	@Override
	public List<VendaDiaria> consultarVendasDiariasJpql(VendaDiariaFilter filtro) {
		StringBuilder sql = new StringBuilder();
		Map<String, Object> params = new HashMap<>();
		
		sql.append("SELECT date(p.dataCriacao), count(p.id), sum(p.valorTotal) FROM Pedido p GROUP BY date(p.dataCriacao)");
		Query createNativeQuery = manager.createNativeQuery(sql.toString(), VendaDiaria.class);
		return createNativeQuery.getResultList();
	}
}
