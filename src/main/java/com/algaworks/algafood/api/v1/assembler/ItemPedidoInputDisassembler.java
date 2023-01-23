package com.algaworks.algafood.api.v1.assembler;

import java.util.List;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.algaworks.algafood.api.v1.model.input.ItemPedidoInput;
import com.algaworks.algafood.domain.model.ItemPedido;

@Component
public class ItemPedidoInputDisassembler {

	@Autowired
	private ModelMapper modelMapper;
	
	public ItemPedido toDoaminObject(ItemPedidoInput itemPedidoInput) {
		return modelMapper.map(itemPedidoInput, ItemPedido.class);
	}
	
	public void copyToDomainListObject(List<ItemPedidoInput> itensPedidoInput, List<ItemPedido> itensPedido) {
		modelMapper.map(itensPedidoInput, itensPedido);
	}
}
