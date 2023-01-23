package com.algaworks.algafood.api.v1.openapi.controller;

import org.springframework.hateoas.CollectionModel;

import com.algaworks.algafood.api.exceptionhandler.Problem;
import com.algaworks.algafood.api.v1.model.UsuarioModel;
import com.algaworks.algafood.api.v1.model.input.SenhaInput;
import com.algaworks.algafood.api.v1.model.input.UsuarioComSenhaInput;
import com.algaworks.algafood.api.v1.model.input.UsuarioInput;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;

@Api(tags = "Usuários")
public interface UsuarioControllerOpenApi {

	@ApiOperation("Lista os usuários")
	CollectionModel<UsuarioModel> listar();
	
	@ApiOperation("Busca um usuário por ID")
    @ApiResponses({
        @ApiResponse(code = 400, message = "ID do usuário inválido", response = Problem.class),
        @ApiResponse(code = 404, message = "Usuário não encontrado", response = Problem.class)
    })
	UsuarioModel buscar(
			@ApiParam(value = "ID do usuário", example = "1", required = true) Long usuarioId);
	
	@ApiOperation("Cadastra um usuário")
	@io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "201", description = "Usuário cadastrado")
	UsuarioModel adicionar(UsuarioComSenhaInput usuarioInput);
	
	@ApiOperation("Atualiza um usuário por ID")
	@io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "200", description = "Usuário atualizado")
	@ApiResponse(code = 404, message = "Usuário não encontrado", response = Problem.class)
	UsuarioModel atualizar(
			@ApiParam(value = "ID do usuário", example = "1", required = true) Long usuarioId, 
			@ApiParam(name = "corpo", value = "Representação de um usuário com os novos dados",
            required = true) UsuarioInput usuarioInput);	
	
	@ApiOperation("Atualiza a senha de um usuário")
	@io.swagger.v3.oas.annotations.responses.ApiResponse(responseCode = "204", description = "Senha alterada com sucesso")
	@ApiResponse(code = 404, message = "Usuário não encontrado", response = Problem.class)
	void alterarSenha(Long usuarioId, SenhaInput senhaInput);
}
