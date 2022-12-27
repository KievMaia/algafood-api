package com.algaworks.algafood.domain.model;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Entity
@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class ItemPedido {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	
	@Column(nullable = false)
	private BigDecimal precoUnitario;
	
	@Column(nullable = false)
	private BigDecimal precoTotal;

	@Column(nullable = false)
	private Integer quantidade;
	
	private String observacao;
	
	@ManyToOne //(fetch = FetchType.LAZY)
	@JoinColumn(name = "produto_id", nullable = false)
	private Produto produto;
	
	@ManyToOne //(fetch = FetchType.LAZY)
	@JoinColumn(name = "pedido_id", nullable = false)
	private Pedido pedido;
	
	//Calcular preço total do item vezes a quantidade.
//	public void calcularPrecoTotal() {
//	    BigDecimal precoUnitario = this.getPrecoUnitario();
//	    Integer quantidade = this.getQuantidade();
//
//	    if (precoUnitario == null) {
//	        precoUnitario = BigDecimal.ZERO;
//	    }
//
//	    if (quantidade == null) {
//	        quantidade = 0;
//	    }
//
//	    this.setPrecoTotal(precoUnitario.multiply(new BigDecimal(quantidade)));
//	}
}
