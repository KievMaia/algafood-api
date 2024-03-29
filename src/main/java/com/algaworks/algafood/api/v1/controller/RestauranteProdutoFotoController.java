package com.algaworks.algafood.api.v1.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.HttpMediaTypeNotAcceptableException;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.algaworks.algafood.api.v1.assembler.FotoProdutoModelAssembler;
import com.algaworks.algafood.api.v1.model.input.FotoProdutoInput;
import com.algaworks.algafood.api.v1.openapi.controller.RestauranteProdutoFotoControllerOpenApi;
import com.algaworks.algafood.core.security.CheckSecurity;
import com.algaworks.algafood.domain.exception.EntidadeNaoEncontradaException;
import com.algaworks.algafood.domain.model.FotoProduto;
import com.algaworks.algafood.domain.model.FotoProdutoModel;
import com.algaworks.algafood.domain.model.Produto;
import com.algaworks.algafood.domain.service.CadastroProdutoService;
import com.algaworks.algafood.domain.service.CatalogoFotoProdutoService;
import com.algaworks.algafood.domain.service.FotoStorageService;

import springfox.documentation.annotations.ApiIgnore;

@RestController
@RequestMapping(value = "/v1/restaurantes/{restauranteId}/produtos/{produtoId}/foto", produces = {MediaType.APPLICATION_JSON_VALUE})
public class RestauranteProdutoFotoController implements RestauranteProdutoFotoControllerOpenApi{

	@Autowired
	private CatalogoFotoProdutoService catalogoFotoProdutoService;

	@Autowired
	private CadastroProdutoService cadastroProdutoService;

	@Autowired
	private FotoProdutoModelAssembler fotoProdutoModelAssembler;
	
	@Autowired
	private FotoStorageService fotoStorageService;

	@CheckSecurity.Restaurantes.PodeGerenciarFuncionamento
	@PutMapping(consumes = MediaType.MULTIPART_FORM_DATA_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public FotoProdutoModel atualizarFoto(@PathVariable Long restauranteId,
	                                      @PathVariable Long produtoId, 
	                                      @Valid FotoProdutoInput fotoProdutoInput,
	                                      @RequestPart(required = true) MultipartFile arquivo) throws IOException {
		Produto produto = cadastroProdutoService.buscarProdutoPorRestaurante(restauranteId, produtoId);

//		MultipartFile arquivo = fotoProdutoInput.getArquivo();

		FotoProduto foto = new FotoProduto();
		foto.setProduto(produto);
		foto.setDescricao(fotoProdutoInput.getDescricao());
		foto.setContentType(arquivo.getContentType());
		foto.setTamanho(arquivo.getSize());
		foto.setNomeArquivo(arquivo.getOriginalFilename());

		FotoProduto fotoSalva = catalogoFotoProdutoService.salvar(foto, arquivo.getInputStream());

		return fotoProdutoModelAssembler.toModel(fotoSalva);
	}
	
	@CheckSecurity.Restaurantes.PodeConsultar
	@GetMapping
	public FotoProdutoModel buscar(@PathVariable Long restauranteId, @PathVariable Long produtoId) {
		FotoProduto fotoProduto = catalogoFotoProdutoService.buscarOuFalhar(restauranteId, produtoId);
	
		return fotoProdutoModelAssembler.toModel(fotoProduto);
	}
	
	@CheckSecurity.Restaurantes.PodeGerenciarFuncionamento
	@DeleteMapping
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void remover(@PathVariable Long restauranteId, @PathVariable Long produtoId) {
		FotoProduto foto = catalogoFotoProdutoService.buscarOuFalhar(restauranteId, produtoId);
		
		this.catalogoFotoProdutoService.remover(foto);
	}
	
	@GetMapping(value = "/imagem", produces = {MediaType.IMAGE_JPEG_VALUE})
	public ResponseEntity<InputStreamResource> servirFoto(@PathVariable Long restauranteId, @PathVariable Long produtoId, 
			@ApiIgnore @RequestHeader(name = "accept", required = false) String acceptHeader) throws HttpMediaTypeNotAcceptableException {
		try {
		
		FotoProduto fotoProduto = catalogoFotoProdutoService.buscarOuFalhar(restauranteId, produtoId);
		
		MediaType mediaTypeFoto = MediaType.parseMediaType(fotoProduto.getContentType());
		List<MediaType> mediaTypesAceitas = MediaType.parseMediaTypes(acceptHeader);
		
		verificarCompatibilidadeMediaType(mediaTypeFoto, mediaTypesAceitas);
		
		InputStream inputStream = fotoStorageService.recuperar(fotoProduto.getNomeArquivo());
		
		return ResponseEntity.ok()
				.contentType(mediaTypeFoto)
				.body(new InputStreamResource(inputStream));
		} catch (EntidadeNaoEncontradaException e) {
			return ResponseEntity.notFound().build();
		}
	}
	
	//Implementação para recuperar do S3.
//	@GetMapping
//	private ResponseEntity<?> servirFotoS3(@PathVariable Long restauranteId, @PathVariable Long produtoId, 
//			@RequestHeader(name = "accept") String acceptHeader) throws HttpMediaTypeNotAcceptableException {
//		try {
//		
//		FotoProduto fotoProduto = catalogoFotoProdutoService.buscarOuFalhar(restauranteId, produtoId);
//		
//		MediaType mediaTypeFoto = MediaType.parseMediaType(fotoProduto.getContentType());
//		List<MediaType> mediaTypesAceitas = MediaType.parseMediaTypes(acceptHeader);
//		
//		verificarCompatibilidadeMediaType(mediaTypeFoto, mediaTypesAceitas);
//		
//		FotoRecuperada fotoRecuperada = fotoStorageService.recuperarS3(fotoProduto.getNomeArquivo());
//		
//		if (fotoRecuperada.temUrl()) {
//			return ResponseEntity.status(HttpStatus.FOUND)
//					.header(HttpHeaders.LOCATION, fotoRecuperada.getUrl())
//					.build();
//		} else {
//			return ResponseEntity.ok()
//					.contentType(mediaTypeFoto)
//					.body(new InputStreamResource(fotoRecuperada.getInputStream()));
//		}
//		
//		} catch (EntidadeNaoEncontradaException e) {
//			return ResponseEntity.notFound().build();
//		}
//	}

	private void verificarCompatibilidadeMediaType(MediaType mediaTypeFoto, List<MediaType> mediaTypesAceitas) throws HttpMediaTypeNotAcceptableException {
		boolean compativel = mediaTypesAceitas.stream()
				.anyMatch(mediaTypeAceita -> mediaTypeAceita.isCompatibleWith(mediaTypeFoto));
		
		if (!compativel) {
			throw new HttpMediaTypeNotAcceptableException(mediaTypesAceitas);
		}
		
	}
}
