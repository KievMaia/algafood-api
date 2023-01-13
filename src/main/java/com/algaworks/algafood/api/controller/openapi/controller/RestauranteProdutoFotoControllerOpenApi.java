package com.algaworks.algafood.api.controller.openapi.controller;

import java.io.IOException;

import org.springframework.core.io.InputStreamResource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.HttpMediaTypeNotAcceptableException;

import com.algaworks.algafood.api.exceptionhandler.Problem;
import com.algaworks.algafood.api.model.input.FotoProdutoInput;
import com.algaworks.algafood.domain.model.FotoProdutoModel;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;

@Api(tags = "Restaurante Produto Fotos")
public interface RestauranteProdutoFotoControllerOpenApi {

	@ApiOperation("Atualiza a foto do produto de um restaurante")
	@ApiResponse(code = 404, message = "Produto de restaurante não encontrado", response = Problem.class)
	@io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "Foto do produto atualizada")
	FotoProdutoModel atualizarFoto(
			@ApiParam(value = "ID do restaurante", example = "1", required = true) Long restauranteId, 
			@ApiParam(value = "ID do produto", example = "1", required = true) Long produtoId, 
			FotoProdutoInput fotoProdutoInput) throws IOException;
	
	@ApiOperation(value = "Busca a foto do produto de um restaurante",
            produces = "application/json, image/jpeg, image/png")
	@ApiResponses({
        @ApiResponse(code = 400, message = "ID do restaurante ou produto inválido", response = Problem.class),
        @ApiResponse(code = 404, message = "Foto de produto não encontrada", response = Problem.class)
    })
	FotoProdutoModel buscar(
			@ApiParam(value = "ID do restaurante", example = "1", required = true) Long restauranteId, 
			@ApiParam(value = "ID do produto", example = "1", required = true) Long produtoId);
	
	@ApiOperation("Exclui a foto do produto de um restaurante")
	@io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "204", description = "Foto do produto excluída")
    @ApiResponses({
        @ApiResponse(code = 400, message = "ID do restaurante ou produto inválido", response = Problem.class),
        @ApiResponse(code = 404, message = "Foto de produto não encontrada", response = Problem.class)
    })
	void remover(
			@ApiParam(value = "ID do restaurante", example = "1", required = true) Long restauranteId, 
			@ApiParam(value = "ID do produto", example = "1", required = true) Long produtoId);
	
	@ApiOperation(value = "Busca a foto do produto de um restaurante")
	ResponseEntity<InputStreamResource> servirFoto(Long restauranteId, Long produtoId, String acceptHeader) throws HttpMediaTypeNotAcceptableException;
}
