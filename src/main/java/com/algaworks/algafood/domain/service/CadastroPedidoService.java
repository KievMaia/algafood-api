package com.algaworks.algafood.domain.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.algaworks.algafood.domain.exception.NegocioException;
import com.algaworks.algafood.domain.exception.PedidoNaoEncontradoException;
import com.algaworks.algafood.domain.model.Cidade;
import com.algaworks.algafood.domain.model.FormaPagamento;
import com.algaworks.algafood.domain.model.Pedido;
import com.algaworks.algafood.domain.model.Produto;
import com.algaworks.algafood.domain.model.Restaurante;
import com.algaworks.algafood.domain.model.Usuario;
import com.algaworks.algafood.domain.repository.PedidoRepository;

@Service
public class CadastroPedidoService {

	@Autowired
	private PedidoRepository pedidoRespository;

	@Autowired
	private CadastroRestauranteService cadastroRestauranteService;

	@Autowired
	private CadastroProdutoService cadastroProdutoService;
	
	@Autowired
	private CadastroCidadeService cadastroCidadeService;
	
	@Autowired
	private CadastroUsuarioService cadastroUsuarioService;
	
	@Autowired
	private CadastroFormaPagamentoService cadastroFormaPagamentoService;

//	@Autowired
//	private PedidoInputDisassembler pedidoInputDisassembler;

	public Pedido buscarOuFalhar(String codigoPedido) {
		return pedidoRespository.findByCodigo(codigoPedido)
				.orElseThrow(() -> new PedidoNaoEncontradoException(codigoPedido));
	}
	
	@Transactional
	public Pedido emitir(Pedido pedido) {
	    validarPedido(pedido);
	    validarItens(pedido);

	    pedido.setTaxaFrete(pedido.getRestaurante().getTaxaFrete());
	    pedido.calcularValorTotal();

	    return pedidoRespository.save(pedido);
	}

	private void validarPedido(Pedido pedido) {
	    Cidade cidade = cadastroCidadeService.buscarOuFalhar(pedido.getEnderecoEntrega().getCidade().getId());
	    Usuario cliente = cadastroUsuarioService.buscarOuFalhar(pedido.getCliente().getId());
	    Restaurante restaurante = cadastroRestauranteService.buscarOuFalhar(pedido.getRestaurante().getId());
	    FormaPagamento formaPagamento = cadastroFormaPagamentoService.buscarOuFalhar(pedido.getFormaPagamento().getId());

	    pedido.getEnderecoEntrega().setCidade(cidade);
	    pedido.setCliente(cliente);
	    pedido.setRestaurante(restaurante);
	    pedido.setFormaPagamento(formaPagamento);
	    
	    if (restaurante.naoAceitaFormaPagamento(formaPagamento)) {
	        throw new NegocioException(String.format("Forma de pagamento '%s' não é aceita por esse restaurante.",
	                formaPagamento.getDescricao()));
	    }
	}

	private void validarItens(Pedido pedido) {
	    pedido.getItens().forEach(item -> {

	    	Produto produto = cadastroProdutoService.buscarProdutoPorRestaurante(
	                pedido.getRestaurante().getId(), item.getProduto().getId());
	        
	        item.setPedido(pedido);
	        item.setProduto(produto);
	        item.setPrecoUnitario(produto.getPreco());
	    });
	}
	
	//Outra forma de implementação.

//	@Transactional
//	public Pedido emitirPedido(PedidoInput pedidoInput) {
//		Cidade cidade = cadastroCidadeService.buscarOuFalhar(pedidoInput.getEnderecoEntrega().getCidade().getId());
//		Restaurante restaurante = restauranteService.buscarOuFalhar(pedidoInput.getRestaurante().getId());
//		Usuario cliente = cadastroUsuarioService.buscarOuFalhar(1L);
//		FormaPagamento formaPagamento = restauranteService.buscarFormaPagamentoEspecifico(pedidoInput.getFormaPagamento().getId(), restaurante);
//		
//		Pedido pedido = pedidoInputDisassembler.toDomainObject(pedidoInput);
//		
//		pedido.getEnderecoEntrega().setCidade(cidade);
//		pedido.setCliente(cliente);
//		pedido.setRestaurante(restaurante);
//		pedido.setFormaPagamento(formaPagamento);
//		pedido.setTaxaFrete(restaurante.getTaxaFrete());
//		pedido.setSubtotal(CalculaValorTotal(pedido));
//		pedido.setValorTotal(CalculaValorTotal(pedido).add(restaurante.getTaxaFrete()));
//
//		return pedidoRespository.save(pedido);
//	}
//
//	private BigDecimal CalculaValorTotal(Pedido pedido) {
//		BigDecimal valorTotal = BigDecimal.ZERO;
//		for (ItemPedido item : pedido.getItens()) {
//			Produto produto = produtoService.buscarProdutoPorRestaurante(pedido.getRestaurante().getId(),
//					item.getProduto().getId());
//			valorTotal = valorTotal.add(produto.getPreco().multiply(new BigDecimal(item.getQuantidade())));
//			
//			item.setProduto(produto);
//			item.setPedido(pedido);
//			item.setPrecoUnitario(produto.getPreco());
//			item.setPrecoTotal(valorTotal);
//		}
//		return valorTotal;
//	}
}
