package com.algaworks.algafood.infrastructure.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Repository;

import com.algaworks.algafood.domain.filter.VendaDiariaFilter;
import com.algaworks.algafood.domain.model.dto.VendaDiaria;
import com.algaworks.algafood.domain.service.VendaQueryService;

@Repository
public class VendaQueryServiceImpl implements VendaQueryService {

	PreparedStatement ps;

	@Autowired
	private Environment environment;

	@Override
	public List<VendaDiaria> consultarVendasDiarias(VendaDiariaFilter filtro) {
		String DB_URL = environment.getProperty("spring.datasource.url");
		String USER = environment.getProperty("spring.datasource.username");
		String PASS = environment.getProperty("spring.datasource.password");

		StringBuilder sql = new StringBuilder();

		sql.append("SELECT DATE(p.data_criacao) AS data_criacao, ");
		sql.append("COUNT(p.id) AS total_vendas, ");
		sql.append("SUM(p.valor_total) AS total_faturado ");
		sql.append("FROM pedido p ");

		List<VendaDiaria> listaVendaDiaria = new ArrayList<>();
		
		try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
				Statement stmt = conn.createStatement();
				) 
		{
			if (Objects.nonNull(filtro.getRestauranteId())) {
				sql.append("WHERE restaurante_id = " + filtro.getRestauranteId() + " ");
				
			} else {
				sql.append("WHERE 1=1 ");
			}
			
			if (Objects.nonNull(filtro.getDataCriacaoInicio())) {
				sql.append("AND data_criacao >= '" + filtro.getDataCriacaoInicio() + "' ");
			}
			
			if (Objects.nonNull(filtro.getDataCriacaoFim())) {
				sql.append("AND data_criacao <= '" + filtro.getDataCriacaoFim() + "' ");
			}
			
			sql.append("GROUP BY date(p.data_criacao)");
			
			ps = conn.prepareStatement(sql.toString());
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				listaVendaDiaria.add(new VendaDiaria(rs.getDate("data_criacao"), rs.getLong("total_vendas"),
						rs.getBigDecimal("total_faturado")));
			}
			
			rs.close();
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return listaVendaDiaria;
	}

	// A construção da consulta está correta, porém não funcionou com banco Postgre.
	// Algo na conversão para Date na data de criação da entidade Pedido.
//	@Override
//	public List<VendaDiaria> consultarVendasDiarias(VendaDiariaFilter filtro) {
//		var builder = manager.getCriteriaBuilder();
//		var query = builder.createQuery(VendaDiaria.class);
//		var root = query.from(Pedido.class);
//		
//		var functionDateDataCriacao = builder.function(
//				"date", Date.class, root.get("dataCriacao"));
//		
//		var selection = builder.construct(VendaDiaria.class, 
//				functionDateDataCriacao,
//				builder.count(root.get("id")),
//				builder.sum(root.get("valorTotal")));
//		
//		query.select(selection);
//		query.groupBy(functionDateDataCriacao);
//		
//		return manager.createQuery(query).getResultList();
//	}
}
