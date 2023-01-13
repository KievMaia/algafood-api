package com.algaworks.algafood.api.controller.openapi.controller;

import java.util.List;

import com.algaworks.algafood.api.exceptionhandler.Problem;
import com.algaworks.algafood.api.model.FormaPagamentoModel;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;

@Api(tags = "Restaurante Formas de Pagamento")
public interface RestauranteFormaPagamentoControllerOpenApi {

	@ApiOperation("Lista as formas de pagamento associadas a um restaurante")
    @ApiResponses({
        @ApiResponse(code = 404, message = "Restaurante não encontrado", response = Problem.class)
    })
	List<FormaPagamentoModel> listar(
			@ApiParam(value = "ID do restaurante", example = "1", required = true) Long restauranteId);
	
	@ApiOperation("Desassociação de restaurante com forma de pagamento")
	@ApiResponse(code = 404, message = "Restaurante ou forma de pagamento não encontrado")
	@io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "204", description = "Desassociação realizada com sucesso")
	void desassociarFormaPagamento(
			@ApiParam(value = "ID do restaurante", example = "1", required = true) Long restauranteId, 
			@ApiParam(value = "ID da forma de pagamento", example = "1", required = true) Long formaPagamentoId);
	
	@ApiOperation("Associação de restaurante com forma de pagamento")
	@ApiResponse(code = 404, message = "Restaurante ou forma de pagamento não encontrado", 
    response = Problem.class)
	@io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "204", description = "Associação realizada com sucesso")
	void asassociar(
			@ApiParam(value = "ID do restaurante", example = "1", required = true) Long restauranteId, 
			@ApiParam(value = "ID da forma de pagamento", example = "1", required = true) Long formaPagamentoId);
}
