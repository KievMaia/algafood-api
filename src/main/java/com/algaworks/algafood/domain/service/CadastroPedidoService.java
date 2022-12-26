package com.algaworks.algafood.domain.service;

import java.math.BigDecimal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.algaworks.algafood.api.assembler.PedidoInputDisassembler;
import com.algaworks.algafood.api.model.input.ItemPedidoInput;
import com.algaworks.algafood.api.model.input.PedidoInput;
import com.algaworks.algafood.domain.exception.PedidoNaoEncontradoException;
import com.algaworks.algafood.domain.model.Pedido;
import com.algaworks.algafood.domain.model.Produto;
import com.algaworks.algafood.domain.model.Restaurante;
import com.algaworks.algafood.domain.repository.PedidoRespository;

@Service
public class CadastroPedidoService {

	@Autowired
	private PedidoRespository pedidoRespository;

	@Autowired
	private CadastroRestauranteService restauranteService;

	@Autowired
	private CadastroProdutoService produtoService;

	@Autowired
	private PedidoInputDisassembler pedidoInputDisassembler;

	@Autowired
	private CadastroUsuarioService usuarioService;

	public Pedido buscarOuFalhar(Long pedidoId) {
		return pedidoRespository.findById(pedidoId).orElseThrow(() -> new PedidoNaoEncontradoException(pedidoId));
	}

	@Transactional
	public Pedido emitirPedido(PedidoInput pedidoInput) {
		Restaurante restaurante = restauranteService.buscarOuFalhar(pedidoInput.getRestaurante().getId());
		restauranteService.buscarFormaPagamentoEspecifico(pedidoInput.getFormaPagamento().getId(), restaurante);
		
		Pedido pedido = pedidoInputDisassembler.toDomainObject(pedidoInput);

		pedido.setCliente(usuarioService.buscarOuFalhar(1L));
		pedido.setTaxaFrete(restaurante.getTaxaFrete());
		pedido.setValorTotal(CalculaValorTotal(pedidoInput, restaurante).add(restaurante.getTaxaFrete()));
		pedido.setSubtotal(CalculaValorTotal(pedidoInput, restaurante));

		return pedidoRespository.save(pedido);
	}

	private BigDecimal CalculaValorTotal(PedidoInput pedidoInput, Restaurante restaurante) {
		BigDecimal valorTotal = BigDecimal.ZERO;
		for (ItemPedidoInput item : pedidoInput.getItens()) {
			Produto produto = produtoService.buscarProdutoPorRestaurante(restaurante.getId(),
					item.getProdutoId());
			valorTotal = valorTotal.add(produto.getPreco().multiply(new BigDecimal(item.getQuantidade())));
		}
		return valorTotal;
	}
}
