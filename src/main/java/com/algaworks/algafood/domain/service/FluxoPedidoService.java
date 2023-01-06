package com.algaworks.algafood.domain.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.algaworks.algafood.domain.model.Pedido;
import com.algaworks.algafood.domain.service.EnvioEmailService.Mensagem;

@Service
public class FluxoPedidoService {

	@Autowired
	private CadastroPedidoService cadastroPedidoService;

	@Autowired
	private EnvioEmailService envioEmail;
	
	@Transactional
	public void confirma(String codigoPedido) {
		Pedido pedido = cadastroPedidoService.buscarOuFalhar(codigoPedido);
		pedido.confirmar();
		
		var mensagem = Mensagem.builder()
				.assunto(pedido.getRestaurante().getNome() + " - Pedido confirmado")
				.corpo("pedido-confirmado.html")
				.variavel("pedido", pedido)
				.destinatario(pedido.getCliente().getEmail())
				.build();
				
		envioEmail.enviar(mensagem);
	}

	@Transactional
	public void entrega(String codigoPedido) {
		Pedido pedido = cadastroPedidoService.buscarOuFalhar(codigoPedido);
		pedido.entregar();
	}

	@Transactional
	public void cancela(String codigoPedido) {
		Pedido pedido = cadastroPedidoService.buscarOuFalhar(codigoPedido);
		pedido.cancelar();
	}
}
