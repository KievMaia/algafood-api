package com.algaworks.algafood.api.v1.assembler;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;

import java.util.Objects;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.CollectionModel;
import org.springframework.hateoas.server.mvc.RepresentationModelAssemblerSupport;
import org.springframework.stereotype.Component;

import com.algaworks.algafood.api.v1.AlgaLinks;
import com.algaworks.algafood.api.v1.controller.RestauranteController;
import com.algaworks.algafood.api.v1.model.RestauranteModel;
import com.algaworks.algafood.api.v1.model.input.RestauranteInput;
import com.algaworks.algafood.core.security.AlgaSecurity;
import com.algaworks.algafood.domain.model.Restaurante;

@Component
public class RestauranteModelAssembler extends RepresentationModelAssemblerSupport<Restaurante, RestauranteModel>{

	@Autowired
	private ModelMapper modelMapper;
	
	@Autowired
	private AlgaLinks algaLinks;
	
	@Autowired
	private AlgaSecurity algaSecurity;
	
	public RestauranteModelAssembler() {	
		super(RestauranteController.class, RestauranteModel.class);
	}

	public RestauranteModel toModel(Restaurante restaurante) {
		RestauranteModel restauranteModel = createModelWithId(restaurante.getId(), restaurante);
		
		modelMapper.map(restaurante, restauranteModel);
		
		if (algaSecurity.podeConsultarRestaurantes()) {
			restauranteModel.add(
					algaLinks.linkToRestaurantes("restaurantes"));
		}
		
		if (algaSecurity.podeGerenciarCadastroRestaurantes()) {
			if (restaurante.ativacaoPermitida()) {
				restauranteModel.add(
						algaLinks.linkToAtivarRestaurante(restaurante.getId(), "ativar"));
			}
			
			if (restaurante.inativacaoPermitida()) {
				restauranteModel.add(
						algaLinks.linkToInativarRestaurante(restaurante.getId(), "inativar"));
			}
		}
		
		if (algaSecurity.podeGerenciarFuncionamentoRestaurantes(restaurante.getId())) {
			if (restaurante.aberturaPermitida()) {
				restauranteModel.add(
						algaLinks.linkToAbrirRestaurante(restaurante.getId(), "abrir"));
			}

			if (restaurante.fechamentoPermitido()) {
				restauranteModel.add(
						algaLinks.linkToFecharRestaurante(restaurante.getId(), "fechar"));
			}
		}
		
		if (algaSecurity.podeConsultarRestaurantes()) {
			restauranteModel.add(algaLinks.linkToProdutos(restaurante.getId(), "produtos"));
		}
		
		if (algaSecurity.podeConsultarCozinhas()) {
			restauranteModel.getCozinha().add(
					algaLinks.linkToCozinha(restauranteModel.getCozinha().getId()));
		}
		
		if (algaSecurity.podeConsultarCidades()) {
			if (Objects.nonNull(restauranteModel.getEndereco())) {
				restauranteModel.getEndereco().getCidade().add(
						algaLinks.linkToCidade(restauranteModel.getEndereco().getCidade().getId()));
			}
		}
		
		if (algaSecurity.podeConsultarRestaurantes()) {
			restauranteModel.add(
					algaLinks.linkToRestauranteFormasPagamento(restauranteModel.getId(), "formas-pagamento"));
		}
		
		if (algaSecurity.podeGerenciarCadastroRestaurantes()) {
			restauranteModel.add(
					algaLinks.linkToResponsaveisRestaurante(restauranteModel.getId(), "responsaveis")
					);
		}
		
		return restauranteModel;
	}

	@Override
	public CollectionModel<RestauranteModel> toCollectionModel(Iterable<? extends Restaurante> entities) {
		 CollectionModel<RestauranteModel> collectionModel  = super.toCollectionModel(entities)
				.add(linkTo(RestauranteController.class).withSelfRel());
		 
		 if (algaSecurity.podeConsultarRestaurantes()) {
			collectionModel.add(algaLinks.linkToRestaurantes());
		}
		 
		 return collectionModel;
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
