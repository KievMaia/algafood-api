package com.algaworks.algafood.api.v1.openapi.controller;

import org.springframework.hateoas.CollectionModel;

import com.algaworks.algafood.api.exceptionhandler.Problem;
import com.algaworks.algafood.api.v1.model.ProdutoModel;
import com.algaworks.algafood.api.v1.model.input.ProdutoInput;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;

@Api(tags = "Restaurante Produtos")
public interface RestauranteProdutosControllerOpenApi {

	@ApiOperation("Lista os produtos de um restaurante")
    @ApiResponses({
        @ApiResponse(code = 400, message = "ID do restaurante inválido", response = Problem.class),
        @ApiResponse(code = 404, message = "Restaurante não encontrado", response = Problem.class)
    })
	CollectionModel<ProdutoModel> listar(
			 @ApiParam(value = "ID do restaurante", example = "1", required = true) Long restauranteId, 
			 @ApiParam(value = "Indica se deve ou não incluir produtos inativos no resultado da listagem", 
             example = "false", defaultValue = "false") Boolean incluirInativos);
	
	@ApiOperation("Busca um produto de um restaurante")
    @ApiResponses({
        @ApiResponse(code = 400, message = "ID do restaurante ou produto inválido", response = Problem.class),
        @ApiResponse(code = 404, message = "Produto de restaurante não encontrado", response = Problem.class)
    })
	ProdutoModel buscar(
			@ApiParam(value = "ID do restaurante", example = "1", required = true) Long restauranteId, 
			@ApiParam(value = "ID do produto", example = "1", required = true) Long produtoId);

	@ApiOperation("Cadastra um produto de um restaurante")
	@ApiResponse(code = 404, message = "Restaurante não encontrado", response = Problem.class)
	@io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "201", description = "Produto cadastrado")
	ProdutoModel adicionar(
			@ApiParam(value = "ID do restaurante", example = "1", required = true) Long restauranteId, 
			@ApiParam(name = "corpo", value = "Representação de um novo produto", required = true) ProdutoInput produtoInput);
	
	@ApiOperation("Atualiza um produto de um restaurante")
	@ApiResponse(code = 404, message = "Produto de restaurante não encontrado", response = Problem.class)
	@io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "Produto atualizado")
	ProdutoModel atualizar(Long restauranteId, Long produtoId, ProdutoInput produtoInput);
}
