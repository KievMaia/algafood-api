package com.algaworks.algafood.api.assembler;

import java.util.List;
import java.util.function.Function;
import java.util.stream.Collectors;

import org.springframework.stereotype.Component;

import com.algaworks.algafood.api.model.CozinhaModel;
import com.algaworks.algafood.api.model.RestauranteModel;
import com.algaworks.algafood.api.model.input.CozinhaIdInput;
import com.algaworks.algafood.api.model.input.RestauranteInput;
import com.algaworks.algafood.domain.model.Restaurante;

@Component
public class RestauranteModelAssembler {

	public Function<Restaurante, RestauranteModel> toModel() {
		return entity -> {
			var restauranteModel = new RestauranteModel();
			var cozinhaModel = new CozinhaModel();
			restauranteModel.setId(entity.getId());
			restauranteModel.setNome(entity.getNome());
			restauranteModel.setTaxaFrete(entity.getTaxaFrete());
			cozinhaModel.setId(entity.getCozinha().getId());
			cozinhaModel.setNome(entity.getCozinha().getNome());
			restauranteModel.setCozinha(cozinhaModel);
			return restauranteModel;
		};
	}
	
	public List<RestauranteModel> toCollectionModel(List<Restaurante> restaurantes) {
		return restaurantes.stream()
				.map(restaurante -> toModel()
						.apply(restaurante))
				.collect(Collectors.toList());
	}
	
	public RestauranteInput toRestauranteInput(Restaurante restauranteAtual) {
		RestauranteInput restauranteInput = new RestauranteInput();
		CozinhaIdInput cozinhaIdInput = new CozinhaIdInput();
		cozinhaIdInput.setId(restauranteAtual.getId());
		
		restauranteInput.setNome(restauranteAtual.getNome());
		restauranteInput.setTaxaFrete(restauranteAtual.getTaxaFrete());
		restauranteInput.setCozinha(cozinhaIdInput);
		return restauranteInput;
	}
}
