package com.algaworks.algafood.api.controller.openapi.controller;

import com.algaworks.algafood.api.exceptionhandler.Problem;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.annotations.ApiResponse;

@Api(tags = "Fluxo Pedidos")
public interface PedidoStatusControllerOpenApi {

	@ApiOperation("Confirmação de pedido")
	@io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "204", description = "Pedido confirmado com sucesso")
	@ApiResponse(code = 404, message = "Pedido não encontrado", response = Problem.class)
	void alteraStatusConfirmacao(
			@ApiParam(value = "Código do pedido", example = "f9981ca4-5a5e-4da3-af04-933861df3e55", required = true) String codigoPedido);

	@ApiOperation("Registrar entrega de pedido")
	@io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "204", description = "Entrega de pedido registrada com sucesso")
	@ApiResponse(code = 404, message = "Pedido não encontrado", response = Problem.class)
	void alteraStatusEntregue(
			@ApiParam(value = "Código do pedido", example = "f9981ca4-5a5e-4da3-af04-933861df3e55", required = true) String codigoPedido);

	@ApiOperation("Cancelamento de pedido")
	@io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "204", description = "Pedido cancelado com sucesso")
	@ApiResponse(code = 404, message = "Pedido não encontrado", response = Problem.class)
	void alteraStatusCancelado(
			@ApiParam(value = "Código do pedido", example = "f9981ca4-5a5e-4da3-af04-933861df3e55", required = true) String codigoPedido);
}
