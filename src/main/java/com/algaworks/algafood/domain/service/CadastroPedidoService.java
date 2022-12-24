package com.algaworks.algafood.domain.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.algaworks.algafood.domain.exception.PedidoNaoEncontradoException;
import com.algaworks.algafood.domain.model.Pedido;
import com.algaworks.algafood.domain.repository.PedidoRespository;

@Service
public class CadastroPedidoService {

	@Autowired
	private PedidoRespository pedidoRespository;
	
	public Pedido buscarOuFalhar(Long pedidoId) {
		return pedidoRespository.findById(pedidoId)
				.orElseThrow(() -> new PedidoNaoEncontradoException(pedidoId));
	}
}
