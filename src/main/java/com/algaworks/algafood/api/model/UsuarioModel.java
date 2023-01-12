package com.algaworks.algafood.api.model;

import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UsuarioModel {

	@ApiModelProperty(example = "1")
	private Long id;

	@ApiModelProperty(example = "Kiev Maia")
	private String nome;

	@ApiModelProperty(example = "kievmaia@gmail.com")
	private String email;
}
