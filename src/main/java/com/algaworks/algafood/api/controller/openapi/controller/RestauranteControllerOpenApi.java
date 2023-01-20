package com.algaworks.algafood.api.controller.openapi.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.hateoas.CollectionModel;
import org.springframework.http.ResponseEntity;

import com.algaworks.algafood.api.exceptionhandler.Problem;
import com.algaworks.algafood.api.model.RestauranteApenasNomeModel;
import com.algaworks.algafood.api.model.RestauranteBasicoModel;
import com.algaworks.algafood.api.model.RestauranteModel;
import com.algaworks.algafood.api.model.input.RestauranteInput;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;

@Api(tags = "Restaurantes")
public interface RestauranteControllerOpenApi {

	@ApiOperation(value = "Lista restaurantes")
	@ApiImplicitParams({
			@ApiImplicitParam(value = "Nome da projeção de pedidos. opção = apenas-nome", allowableValues = "apenas-nome",
					example = "apenas-nome", name = "projecao", paramType = "query", type = "string")
	})
	CollectionModel<RestauranteBasicoModel> listar();

	@ApiOperation(value = "Lista restaurantes", hidden = true)
	CollectionModel<RestauranteApenasNomeModel> listarApenasNomes();
	
	@ApiOperation("Busca um restaurante por código")
	   		@ApiResponses({
	   			@ApiResponse(code = 404, message = "Restaurante não encontrado", response = Problem.class),
	   			@ApiResponse(code = 400, message = "ID do restaurante inválido", response = Problem.class)
	   	})
	RestauranteModel buscar(@ApiParam(value = "ID de um restaurante", example = "1") Long restauranteId);
	
	@ApiOperation("Cadastra um restaurante")
    @ApiResponses({
        @ApiResponse(code = 201, message = "Restaurante criado"),
    })
	RestauranteModel adicionar(
			@ApiParam(name = "corpo", value = "Representação de um novo restaurante")RestauranteInput restauranteInput);

	@ApiOperation("Atualiza um restaurante por id.")
	@ApiResponses({
		@ApiResponse(code = 200, message = "Restaurante atualizado"),
		@ApiResponse(code = 404, message = "Restaurante não encontrado", response = Problem.class)
	})
	RestauranteModel atualizar(
			@ApiParam(value = "Id de um restaurante", example = "1") Long restauranteId, 
			@ApiParam(name = "corpo", value = "Representação de um restaurante com os novos dados") RestauranteInput restauranteInput);

	@ApiOperation("Atualiza parâmetros específicados de um restaurante.")
	@ApiResponses({
		@ApiResponse(code = 200, message = "Restaurante atualizado"),
		@ApiResponse(code = 404, message = "Restaurante não encontrado", response = Problem.class)
	})
	RestauranteModel atualizarParcial(
			@ApiParam(value = "Id de um restaurante", example = "1") Long restauranteId, Map<String, Object> campos,
			HttpServletRequest request);
	
	@ApiOperation("Ativa um restaurante por id.")
	@ApiResponses({
        @ApiResponse(code = 404, message = "Restaurante não encontrado", response = Problem.class)
    })
	ResponseEntity<Void> ativar(
			@ApiParam(value = "Id de um restaurante", example = "1") Long restauranteId);
	
	@ApiOperation("Abre um restaurante por id.")
	@ApiResponses({
		@ApiResponse(code = 404, message = "Restaurante não encontrado", response = Problem.class)
	})
	ResponseEntity<Void> abrir(
			@ApiParam(value = "Id de um restaurante", example = "1") Long restauranteId);
	
	@ApiOperation("Inativa um restaurante por id.")
	@ApiResponses({
		@ApiResponse(code = 404, message = "Restaurante não encontrado", response = Problem.class)
	})
	ResponseEntity<Void> inativar(
			@ApiParam(value = "Id de um restaurante", example = "1") Long restauranteId);
	
	@ApiOperation("Fechar um restaurante por id.")
	@ApiResponses({
		@ApiResponse(code = 404, message = "Restaurante não encontrado", response = Problem.class)
	})
	ResponseEntity<Void> fechar(
			@ApiParam(value = "Id de um restaurante", example = "1") Long restauranteId);
	
	@ApiOperation("Ativa restaurantes em lote por uma lista de ids.")
	@ApiResponses({
		@ApiResponse(code = 404, message = "Restaurante não encontrado", response = Problem.class)
	})
	void ativarLote(
			@ApiParam(value = "Lista de ids de restaurantes", example = "1,2,3") List<Long> restauranteIds);
	
	@ApiOperation("Desativa restaurantes em lote por uma lista de ids.")
	@ApiResponses({
		@ApiResponse(code = 404, message = "Restaurante não encontrado", response = Problem.class)
	})
	void desativarLote(
			@ApiParam(value = "Lista de ids de restaurantes", example = "1,2,3") List<Long> restauranteIds);
}
