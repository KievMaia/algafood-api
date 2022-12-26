package com.algaworks.algafood.core.modelmapper;

import org.modelmapper.ModelMapper;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.algaworks.algafood.api.model.EnderecoModel;
import com.algaworks.algafood.api.model.input.ItemPedidoInput;
import com.algaworks.algafood.domain.model.Endereco;
import com.algaworks.algafood.domain.model.ItemPedido;

@Configuration
public class ModelMapperConfig {

	@Bean
	public ModelMapper modelMapper() {
		var modelMapper = new ModelMapper();
		
		//Ignora o mapeamento para setId, pula o mapeamento do setId, não atribui.
		modelMapper.createTypeMap(ItemPedidoInput.class, ItemPedido.class)
	    .addMappings(mapper -> mapper.skip(ItemPedido::setId));  
		
		//11.16 - Customizando o mapeamento de propriedades com ModelMapper.
//		modelMapper.createTypeMap(Restaurante.class, RestauranteModel.class)
//			.addMapping(Restaurante::getTaxaFrete, RestauranteModel::setPrecoFrete);
		
		var enderecoToEnderecoModeTypeMap = modelMapper.createTypeMap(Endereco.class, EnderecoModel.class);
		
		//Customizando o mapeamento de propriedades internas a outras propriedades com ModelMapper.
		enderecoToEnderecoModeTypeMap.<String>addMapping(
				enderecoSrc -> enderecoSrc.getCidade().getEstado().getNome(), 
				(enderecoModelDest, value) -> enderecoModelDest.getCidade().setEstado(value));
		
		return modelMapper;
	}
}
