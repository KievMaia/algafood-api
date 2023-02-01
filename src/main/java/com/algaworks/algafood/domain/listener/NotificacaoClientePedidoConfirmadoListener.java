package com.algaworks.algafood.domain.listener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.event.TransactionalEventListener;

import com.algaworks.algafood.domain.event.PedidoEvent;
import com.algaworks.algafood.domain.model.Pedido;
import com.algaworks.algafood.domain.model.StatusPedido;
import com.algaworks.algafood.domain.service.EnvioEmailService;
import com.algaworks.algafood.domain.service.EnvioEmailService.Mensagem;

@Component
public class NotificacaoClientePedidoConfirmadoListener {

	@Autowired
	private EnvioEmailService envioEmail;
	
	//No caso para executar o evento antes do commit. (Se der erro no evento, é feito o rollback).
//	@TransactionalEventListener(phase = TransactionPhase.BEFORE_COMMIT) (O padrão é AFTER_COMMIT).
	@TransactionalEventListener
	public void aoTrocarStatusPedido(PedidoEvent event) {
		Pedido pedido = event.getPedido();
		
		if (pedido.getStatus().equals(StatusPedido.CONFIRMADO)) {
			var mensagem = Mensagem.builder()
					.assunto(pedido.getRestaurante().getNome() + " - Pedido confirmado")
					.corpo("emails/pedido-confirmado.html")
					.variavel("pedido", pedido)
					.destinatario(pedido.getCliente().getEmail())
					.build();
			
			envioEmail.enviar(mensagem);
		} else if(pedido.getStatus().equals(StatusPedido.CANCELADO)){
			var mensagem = Mensagem.builder()
					.assunto(pedido.getRestaurante().getNome() + " - Pedido confirmado")
					.corpo("emails/pedido-cancelado.html")
					.variavel("pedido", pedido)
					.destinatario(pedido.getCliente().getEmail())
					.build();
			
			envioEmail.enviar(mensagem);
		}
	}
}
