package com.algaworks.algafood.api.v1.openapi.controller;

import org.springframework.hateoas.CollectionModel;
import org.springframework.http.ResponseEntity;

import com.algaworks.algafood.api.exceptionhandler.Problem;
import com.algaworks.algafood.api.v1.model.GrupoModel;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;

@Api(tags = "Usuários")
public interface UsuarioGrupoControllerOpenApi {

	@ApiOperation("Lista os grupos associados a um usuário")
    @ApiResponses({
        @ApiResponse(code = 404, message = "Usuário não encontrado", response = Problem.class)
    })
	CollectionModel<GrupoModel> listar(
			@ApiParam(value = "ID do usuário", example = "1", required = true) Long usuarioId);
	
	@ApiOperation("Desassociação de grupo com usuário")
	@ApiResponse(code = 404, message = "Usuário ou grupo não encontrado", response = Problem.class)
	@io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "204", description = "Desassociação realizada com sucesso")
	ResponseEntity<Void> desassociarGrupo(
			@ApiParam(value = "ID do usuário", example = "1", required = true) Long usuarioId, 
			@ApiParam(value = "ID do grupo", example = "1", required = true) Long grupoId);
	
	@ApiOperation("Associação de grupo com usuário")
	@ApiResponse(code = 404, message = "Usuário ou grupo não encontrado", response = Problem.class)
	@io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "204", description = "Associação realizada com sucesso")
	ResponseEntity<Void> associarGrupo(
			@ApiParam(value = "ID do usuário", example = "1", required = true) Long usuarioId, 
			@ApiParam(value = "ID do grupo", example = "1", required = true) Long grupoId);
}
