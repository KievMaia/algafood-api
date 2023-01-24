package com.algaworks.algafood.api.v2.openapi.controller;

import org.springframework.data.domain.Pageable;
import org.springframework.hateoas.PagedModel;

import com.algaworks.algafood.api.exceptionhandler.Problem;
import com.algaworks.algafood.api.v2.model.CozinhaModelV2;
import com.algaworks.algafood.api.v2.model.input.CozinhaInputV2;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;

@Api(tags = "Cozinhas")
public interface CozinhaControllerOpenApiV2 {

	@ApiOperation("Lista as cozinhas com paginação.")
	PagedModel<CozinhaModelV2> listar(Pageable pageable);

	@ApiOperation("Busca uma cozinha por id.")
	@ApiResponses({
		@ApiResponse(code = 400, message = "ID da cozinha inválido", response = Problem.class),
		@ApiResponse(code = 404, message = "Cozinha não encontrada", response = Problem.class)
	})
	CozinhaModelV2 buscar(@ApiParam(value = "ID de uma cozinha", example = "1") Long cozinhaId);

	@ApiOperation("Cadastra uma cozinha.")
	CozinhaModelV2 adicionar(@ApiParam(name = "corpo", value = "Representação de uma nova cozinha") CozinhaInputV2 cozinhaInput);

	@ApiOperation("Atualiza uma cozinha por id.")
	@ApiResponses({
		@ApiResponse(code = 200, message = "Cozinha atualizada"),
		@ApiResponse(code = 404, message = "Cozinha não encontrada", response = Problem.class)
	})
	CozinhaModelV2 atualizar(
			@ApiParam(value = "Id de uma cozinha", example = "1") Long cozinhaId, 
			@ApiParam(name = "corpo", value = "Representação de uma cozinha com os novos dados") CozinhaInputV2 cozinhaInput);

	@ApiOperation("Exclui uma cozinha por id.")
	@ApiResponses({
		@ApiResponse(code = 404, message = "Cozinha não encontrada", response = Problem.class)
	})
	void remover(@ApiParam(value = "Id de uma cozinha", example = "1") Long cozinhaId);
}
