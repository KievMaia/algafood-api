package com.algaworks.algafood.api.controller.openapi.controller;

import org.springframework.hateoas.CollectionModel;

import com.algaworks.algafood.api.exceptionhandler.Problem;
import com.algaworks.algafood.api.model.CidadeModel;
import com.algaworks.algafood.api.model.input.CidadeInput;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;

@Api(tags = "Cidades")
public interface CidadeControllerOpenApi {

	@ApiOperation("Lista as cidades.")
	CollectionModel<CidadeModel> listar();

	@ApiOperation("Busca uma cidade por id.")
	@ApiResponses({
		@ApiResponse(code = 400, message = "ID da cidade inválido", response = Problem.class),
		@ApiResponse(code = 404, message = "Cidade não encontrada", response = Problem.class)
	})
	CidadeModel buscar(
		@ApiParam(value = "ID de uma cidade", example = "1") Long cidadeId);

	@ApiOperation("Cadastra uma cidade.")
	CidadeModel adicionar(
			@ApiParam(name = "corpo", value = "Representação de uma nova cidade") CidadeInput cidadeInput);

	@ApiOperation("Atualiza uma cidade por id.")
	@ApiResponses({
		@ApiResponse(code = 200, message = "Cidade atualizada"),
		@ApiResponse(code = 404, message = "Cidade não encontrada", response = Problem.class)
	})
	CidadeModel atualizar(
			@ApiParam(value = "Id de uma cidade", example = "1") Long cidadeId, 
			@ApiParam(name = "corpo", value = "Representação de uma cidade com os novos dados") CidadeInput cidadeInput);

	@ApiOperation("Exclui uma cidade por id.")
	@ApiResponses({
		@ApiResponse(code = 404, message = "Cidade não encontrada", response = Problem.class)
	})
	void remover(
			@ApiParam(value = "Id de uma cidade", example = "1") Long cidadeId);
}
