package com.algaworks.algafood.api.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.algaworks.algafood.api.assembler.PedidoModelAssembler;
import com.algaworks.algafood.api.assembler.PedidoResumoModelAssembler;
import com.algaworks.algafood.api.model.PedidoModel;
import com.algaworks.algafood.api.model.PedidoResumoModel;
import com.algaworks.algafood.api.model.input.PedidoInput;
import com.algaworks.algafood.domain.repository.PedidoRespository;
import com.algaworks.algafood.domain.service.CadastroPedidoService;

@RestController
@RequestMapping("/pedidos")
public class PedidoController {
	
	@Autowired
	private PedidoModelAssembler pedidoModelAssembler;
	
	@Autowired
	private PedidoResumoModelAssembler pedidoResumoModelAssembler ;
	
	@Autowired
	private PedidoRespository pedidoRespository;
	
	@Autowired
	private CadastroPedidoService cadastroPedidoService;

	@GetMapping
	public List<PedidoResumoModel> listar() {
		return pedidoResumoModelAssembler.toCollectionModel(pedidoRespository.findAll());
	}
	
	@GetMapping("/{pedidoId}")
	public PedidoModel buscar(@PathVariable Long pedidoId) {
		return pedidoModelAssembler.toModel(cadastroPedidoService.buscarOuFalhar(pedidoId));
	}
	
	@PostMapping
	@ResponseStatus(HttpStatus.CREATED)
	public PedidoModel adicionar(@RequestBody @Valid PedidoInput pedidoInput) {
		return pedidoModelAssembler.toModel(cadastroPedidoService.emitirPedido(pedidoInput));
	}
	
	//Outra forma de implementação do post (Emitir pedido)
	
//	@PostMapping
//	@ResponseStatus(HttpStatus.CREATED)
//	public PedidoModel adicionar(@Valid @RequestBody PedidoInput pedidoInput) {
//	    try {
//	        Pedido novoPedido = pedidoInputDisassembler.toDomainObject(pedidoInput);
//
//	        // TODO pegar usuário autenticado
//	        novoPedido.setCliente(new Usuario());
//	        novoPedido.getCliente().setId(1L);
//
//	        novoPedido = emissaoPedido.emitir(novoPedido);
//
//	        return pedidoModelAssembler.toModel(novoPedido);
//	    } catch (EntidadeNaoEncontradaException e) {
//	        throw new NegocioException(e.getMessage(), e);
//	    }
//	}

}
