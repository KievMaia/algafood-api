package com.algaworks.algafood.api.controller.openapi.model;

import java.util.List;

import org.springframework.hateoas.Links;

import com.algaworks.algafood.api.model.UsuarioModel;

import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@ApiModel("UsuariosModel")
@Getter
@Setter
public class UsuarioModelOpenApi {

	private UsuariosEmbeddedModelOpenApi _embedded;

	private Links _links;
	
	@ApiModel("UsuariosEmbeddedModel")
	@Data
	public class UsuariosEmbeddedModelOpenApi {

		private List<UsuarioModel> usuarios;
	}
}
