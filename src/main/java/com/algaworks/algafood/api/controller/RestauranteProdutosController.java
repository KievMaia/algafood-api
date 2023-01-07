package com.algaworks.algafood.api.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.algaworks.algafood.api.assembler.ProdutoInputDisassembler;
import com.algaworks.algafood.api.assembler.ProdutoModelAssembler;
import com.algaworks.algafood.api.model.ProdutoModel;
import com.algaworks.algafood.api.model.input.ProdutoInput;
import com.algaworks.algafood.domain.model.Produto;
import com.algaworks.algafood.domain.model.Restaurante;
import com.algaworks.algafood.domain.repository.ProdutoRepository;
import com.algaworks.algafood.domain.service.CadastroProdutoService;
import com.algaworks.algafood.domain.service.CadastroRestauranteService;

@RestController
@RequestMapping(value = "/restaurantes/{restauranteId}/produtos")
public class RestauranteProdutosController {

	@Autowired
	private CadastroRestauranteService cadastroRestaurante;
	
	@Autowired
	private CadastroProdutoService cadastroProdutoService;
	
	@Autowired
	private ProdutoModelAssembler produtoModelAssembler;
	
	@Autowired
	private ProdutoRepository produtoRepository;
	
	@Autowired
	private ProdutoInputDisassembler produtoInputDisassembler;
	
	//Duas implementações buscando pelo serviço Java, sem ir no banco.
//	@GetMapping
//	public List<ProdutoModel> listar(@PathVariable Long restauranteId) {
//		Restaurante restaurante = cadastroRestaurante.buscarOuFalhar(restauranteId);
//		
//		return produtoModelAssembler.toCollectionModel(restaurante.getProdutos());
//	}
	
//	@GetMapping("/{produtoId}")
//	public ProdutoModel buscar(@PathVariable Long restauranteId, @PathVariable Long produtoId) {
//		try {
//			Restaurante restaurante = cadastroRestaurante.buscarOuFalhar(restauranteId);
//			
//			return produtoModelAssembler.toModel(this.cadastroRestaurante.buscarProdutoEspecifico(produtoId, restaurante.getProdutos()));
//			
//		} catch (ProdutoNaoEncontradoException e) {
//			throw new ProdutoNaoEncontradoException(produtoId, restauranteId);
//		}
//	}
	
	@GetMapping
	public List<ProdutoModel> listar(@PathVariable Long restauranteId, @RequestParam(required = false) boolean incluirInativos) {
		Restaurante restaurante = cadastroRestaurante.buscarOuFalhar(restauranteId);
		
		if (incluirInativos) {
			return produtoModelAssembler.toCollectionModel(produtoRepository.findTodosByRestaurante(restaurante));
		}
		
		return produtoModelAssembler.toCollectionModel(produtoRepository.findAtivosByRestaurante(restaurante));
	}
	
	@GetMapping("/{produtoId}")
	public ProdutoModel buscar(@PathVariable Long restauranteId, @PathVariable Long produtoId) {
		
		Produto produto = cadastroProdutoService.buscarProdutoPorRestaurante(restauranteId, produtoId);
			
		return produtoModelAssembler.toModel(produto);
	}

	@PostMapping
	@ResponseStatus(HttpStatus.CREATED)
	public ProdutoModel adicionar(@PathVariable Long restauranteId, @RequestBody @Valid ProdutoInput produtoInput) {
		Restaurante restaurante = cadastroRestaurante.buscarOuFalhar(restauranteId);
		
		Produto produto = produtoInputDisassembler.toDomainObject(produtoInput);
		produto.setRestaurante(restaurante);
		
		
		return produtoModelAssembler.toModel(cadastroProdutoService.salvar(produto));
	}
	
	@PutMapping("/{produtoId}")
	public ProdutoModel atualizar(@PathVariable Long restauranteId, @PathVariable Long produtoId, @RequestBody @Valid ProdutoInput produtoInput) {
		Produto produtoEncontrado = cadastroProdutoService.buscarProdutoPorRestaurante(restauranteId, produtoId);
		
		produtoInputDisassembler.copyToDomainObject(produtoInput, produtoEncontrado);
		
		return produtoModelAssembler.toModel(cadastroProdutoService.salvar(produtoEncontrado));
	}
}
