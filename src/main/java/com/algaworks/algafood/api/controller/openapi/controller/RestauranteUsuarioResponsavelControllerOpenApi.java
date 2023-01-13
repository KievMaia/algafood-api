package com.algaworks.algafood.api.controller.openapi.controller;

import java.util.List;

import com.algaworks.algafood.api.exceptionhandler.Problem;
import com.algaworks.algafood.api.model.UsuarioModel;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;

@Api(tags = "Restaurante Usuário Responsável")
public interface RestauranteUsuarioResponsavelControllerOpenApi {

	@ApiOperation("Lista os usuários responsáveis associados a um restaurante")
    @ApiResponses({
        @ApiResponse(code = 404, message = "Restaurante não encontrado", response = Problem.class)
    })
	List<UsuarioModel> listar(
			@ApiParam(value = "ID do restaurante", example = "1", required = true) Long restauranteId);
	
	@ApiOperation("Desassociação de restaurante com usuário responsável")
	@ApiResponse(code = 404, message = "Restaurante ou usuário não encontrado")
	@io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "204", description = "Desassociação realizada com sucesso")
	void desassociarResponsavel(
			@ApiParam(value = "ID do restaurante", example = "1", required = true) Long restauranteId, 
			@ApiParam(value = "ID do usuário", example = "1", required = true) Long usuarioId);
	
	void asassociarResponsavel(
			@ApiParam(value = "ID do restaurante", example = "1", required = true) Long restauranteId, 
			@ApiParam(value = "ID do usuário", example = "1", required = true) Long usuarioId);
}
