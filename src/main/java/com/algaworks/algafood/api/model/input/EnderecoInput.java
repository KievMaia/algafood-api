package com.algaworks.algafood.api.model.input;

import javax.validation.Valid;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class EnderecoInput {

	@NotBlank
	@Size(max = 9)
	private String cep;

	@NotBlank
	private String logradouro;

	@NotBlank
	private String numero;

	private String complemento;

	@NotBlank
	private String bairro;

	@Valid
	@NotNull
	private CidadeIdInput cidade;
}
