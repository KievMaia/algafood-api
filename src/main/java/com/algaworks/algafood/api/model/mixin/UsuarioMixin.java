package com.algaworks.algafood.api.model.mixin;

import java.time.OffsetDateTime;
import java.util.ArrayList;
import java.util.List;

import com.algaworks.algafood.domain.model.Grupo;
import com.fasterxml.jackson.annotation.JsonIgnore;

public abstract class UsuarioMixin {

	@JsonIgnore
	private OffsetDateTime dataCadastro;
	
	@JsonIgnore
	private List<Grupo> grupos = new ArrayList<>(); 
}
