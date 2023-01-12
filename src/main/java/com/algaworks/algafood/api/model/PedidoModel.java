package com.algaworks.algafood.api.model;

import java.math.BigDecimal;
import java.time.OffsetDateTime;
import java.util.List;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class PedidoModel {

	@ApiModelProperty(example = "f9981ca4-5a5e-4da3-af04-933861df3e55")
    private String codigo;
	
	@ApiModelProperty(example = "298.90")
    private BigDecimal subtotal;
	
	@ApiModelProperty(example = "10.00")
    private BigDecimal taxaFrete;
	
	@ApiModelProperty(example = "308.90")
    private BigDecimal valorTotal;
	
	@ApiModelProperty(example = "CRIADO")
    private String status;
	
	@ApiModelProperty(example = "YYYY-mm-ddTHH:mm:ssZ")
    private OffsetDateTime dataCriacao;
	
	@ApiModelProperty(example = "YYYY-mm-ddTHH:mm:ssZ")
    private OffsetDateTime dataConfirmacao;
	
	@ApiModelProperty(example = "YYYY-mm-ddTHH:mm:ssZ")
    private OffsetDateTime dataEntrega;
	
	@ApiModelProperty(example = "YYYY-mm-ddTHH:mm:ssZ")
    private OffsetDateTime dataCancelamento;
	
    private RestauranteResumoModel restaurante;
    private UsuarioModel cliente;
    private FormaPagamentoModel formaPagamento;
    private EnderecoModel enderecoEntrega;
    private List<ItemPedidoModel> itens;
}
