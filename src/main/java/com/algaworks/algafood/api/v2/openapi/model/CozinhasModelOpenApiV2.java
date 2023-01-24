package com.algaworks.algafood.api.v2.openapi.model;

import java.util.List;

import org.springframework.hateoas.Links;

import com.algaworks.algafood.api.v2.model.CozinhaModelV2;

import io.swagger.annotations.ApiModel;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@ApiModel("CozinhasModel")
@Getter
@Setter
public class CozinhasModelOpenApiV2 {

	private CozinhasEmbeddedModelOpenApiV2 _embedded;

	private Links _links;
	
	private PageModelOpenApiV2 page;

	@ApiModel("CozinhasEmbeddedModel")
	@Data
	public class CozinhasEmbeddedModelOpenApiV2 {

		private List<CozinhaModelV2> cozinhas;
	}
}
