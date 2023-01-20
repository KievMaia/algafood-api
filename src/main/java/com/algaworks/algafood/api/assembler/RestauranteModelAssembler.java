package com.algaworks.algafood.api.assembler;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;

import java.util.Objects;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.CollectionModel;
import org.springframework.hateoas.server.mvc.RepresentationModelAssemblerSupport;
import org.springframework.stereotype.Component;

import com.algaworks.algafood.api.AlgaLinks;
import com.algaworks.algafood.api.controller.RestauranteController;
import com.algaworks.algafood.api.model.RestauranteModel;
import com.algaworks.algafood.api.model.input.RestauranteInput;
import com.algaworks.algafood.domain.model.Restaurante;

@Component
public class RestauranteModelAssembler extends RepresentationModelAssemblerSupport<Restaurante, RestauranteModel>{

	@Autowired
	private ModelMapper modelMapper;
	
	@Autowired
	private AlgaLinks algaLinks;
	
	public RestauranteModelAssembler() {	
		super(RestauranteController.class, RestauranteModel.class);
	}

	public RestauranteModel toModel(Restaurante restaurante) {
		RestauranteModel restauranteModel = createModelWithId(restaurante.getId(), restaurante);
		
		modelMapper.map(restaurante, restauranteModel);
		
		restauranteModel.add(
				algaLinks.linkToRestaurantes("restaurantes"));
		
		restauranteModel.getCozinha().add(
				algaLinks.linkToCozinha(restauranteModel.getCozinha().getId()));
		
		if (Objects.nonNull(restauranteModel.getEndereco())) {
			restauranteModel.getEndereco().getCidade().add(
					algaLinks.linkToCidade(restauranteModel.getEndereco().getCidade().getId()));
		}
		
		restauranteModel.add(
				algaLinks.linkToRestauranteFormasPagamento(restauranteModel.getId(), "formas-pagamento"));
		
		restauranteModel.add(
				algaLinks.linkToResponsaveisRestaurante(restauranteModel.getId(), "responsaveis")
				);
		
		if (restaurante.ativacaoPermitida()) {
			restauranteModel.add(
					algaLinks.linkToAtivarRestaurante(restaurante.getId(), "ativar"));
		}

		if (restaurante.inativacaoPermitida()) {
			restauranteModel.add(
					algaLinks.linkToInativarRestaurante(restaurante.getId(), "inativar"));
		}

		if (restaurante.aberturaPermitida()) {
			restauranteModel.add(
					algaLinks.linkToAbrirRestaurante(restaurante.getId(), "abrir"));
		}

		if (restaurante.fechamentoPermitido()) {
			restauranteModel.add(
					algaLinks.linkToFecharRestaurante(restaurante.getId(), "fechar"));
		}
		
		return restauranteModel;
	}

	@Override
	public CollectionModel<RestauranteModel> toCollectionModel(Iterable<? extends Restaurante> entities) {
		return super.toCollectionModel(entities)
				.add(linkTo(RestauranteController.class).withSelfRel());
	}
	
//	public List<RestauranteModel> toCollectionModel(List<Restaurante> restaurantes) {
//		return restaurantes.stream()
//				.map(restaurante -> toModel(restaurante))
//				.collect(Collectors.toList());
//	}

	public RestauranteInput toRestauranteInput(Restaurante restauranteAtual) {
		return modelMapper.map(restauranteAtual, RestauranteInput.class);
	}
}
