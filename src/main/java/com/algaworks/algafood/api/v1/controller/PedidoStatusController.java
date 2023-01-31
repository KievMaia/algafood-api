package com.algaworks.algafood.api.v1.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.algaworks.algafood.api.v1.openapi.controller.PedidoStatusControllerOpenApi;
import com.algaworks.algafood.core.security.CheckSecurity;
import com.algaworks.algafood.domain.service.FluxoPedidoService;

@RestController
@RequestMapping("/v1/pedidos/{codigoPedido}")
public class PedidoStatusController implements PedidoStatusControllerOpenApi{

	@Autowired
	private FluxoPedidoService fluxoPedidoService;

	@CheckSecurity.Pedidos.PodeGerenciarPedidos
	@PutMapping("/confirmacao")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public ResponseEntity<Void> alteraStatusConfirmacao(@PathVariable String codigoPedido) {
		fluxoPedidoService.confirma(codigoPedido);
		
		return ResponseEntity.noContent().build();
	}

	@CheckSecurity.Pedidos.PodeGerenciarPedidos
	@PutMapping("/entrega")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public ResponseEntity<Void> alteraStatusEntregue(@PathVariable String codigoPedido) {
		fluxoPedidoService.entrega(codigoPedido);
		
		return ResponseEntity.noContent().build();
	}

	@CheckSecurity.Pedidos.PodeGerenciarPedidos
	@PutMapping("/cancelamento")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public ResponseEntity<Void> alteraStatusCancelado(@PathVariable String codigoPedido) {
		fluxoPedidoService.cancela(codigoPedido);
		
		return ResponseEntity.noContent().build();
	}
}
