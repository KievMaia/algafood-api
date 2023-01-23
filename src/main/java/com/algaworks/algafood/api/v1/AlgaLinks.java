package com.algaworks.algafood.api.v1;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;
import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

import org.springframework.hateoas.IanaLinkRelations;
import org.springframework.hateoas.Link;
import org.springframework.hateoas.TemplateVariable;
import org.springframework.hateoas.TemplateVariable.VariableType;
import org.springframework.hateoas.TemplateVariables;
import org.springframework.hateoas.UriTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.HttpMediaTypeNotAcceptableException;

import com.algaworks.algafood.api.v1.controller.CidadeController;
import com.algaworks.algafood.api.v1.controller.CozinhaController;
import com.algaworks.algafood.api.v1.controller.EstadoController;
import com.algaworks.algafood.api.v1.controller.EstatisticasController;
import com.algaworks.algafood.api.v1.controller.FormaPagamentoController;
import com.algaworks.algafood.api.v1.controller.GrupoController;
import com.algaworks.algafood.api.v1.controller.GrupoPermissaoController;
import com.algaworks.algafood.api.v1.controller.PedidoController;
import com.algaworks.algafood.api.v1.controller.PedidoStatusController;
import com.algaworks.algafood.api.v1.controller.PermissaoController;
import com.algaworks.algafood.api.v1.controller.RestauranteController;
import com.algaworks.algafood.api.v1.controller.RestauranteFormaPagamentoController;
import com.algaworks.algafood.api.v1.controller.RestauranteProdutoFotoController;
import com.algaworks.algafood.api.v1.controller.RestauranteProdutosController;
import com.algaworks.algafood.api.v1.controller.RestauranteUsuarioResponsavelController;
import com.algaworks.algafood.api.v1.controller.UsuarioController;
import com.algaworks.algafood.api.v1.controller.UsuarioGrupoController;

@Component
public class AlgaLinks {

	public static final TemplateVariables PROJECAO_VARIABLES = new TemplateVariables(
			new TemplateVariable("projecao", VariableType.REQUEST_PARAM));

	public static final TemplateVariables PAGINACAO_VARIBLES = new TemplateVariables(
			new TemplateVariable("page", VariableType.REQUEST_PARAM),
			new TemplateVariable("size", VariableType.REQUEST_PARAM),
			new TemplateVariable("sort", VariableType.REQUEST_PARAM));

	public Link linkToPedidos(String rel) {
		TemplateVariables filtroVariables = new TemplateVariables(
				new TemplateVariable("clientId", VariableType.REQUEST_PARAM),
				new TemplateVariable("restauranteId", VariableType.REQUEST_PARAM),
				new TemplateVariable("dataCriacaoInicio", VariableType.REQUEST_PARAM),
				new TemplateVariable("dataCriacaoFim", VariableType.REQUEST_PARAM));

		String pedidosUrl = linkTo(PedidoController.class).toUri().toString();

		return Link.of(UriTemplate.of(pedidosUrl, PAGINACAO_VARIBLES.concat(filtroVariables)), rel);
	}

	public Link linkToRestaurante(Long restauranteId, String rel) {
		return linkTo(methodOn(RestauranteController.class).buscar(restauranteId)).withRel(rel);
	}

	public Link linkToRestaurante(Long restauranteId) {
		return linkToRestaurante(restauranteId, IanaLinkRelations.SELF_VALUE);
	}

	public Link linkToRestaurantes(String rel) {
		String restaurantesUrl = linkTo(RestauranteController.class).toUri().toString();

		return Link.of(UriTemplate.of(restaurantesUrl, PROJECAO_VARIABLES), rel);
	}

	public Link linkToRestaurantes() {
		return linkToRestaurantes(IanaLinkRelations.SELF.value());
	}

	public Link linkToRestauranteFormasPagamento(Long restauranteId, String rel) {
		return linkTo(methodOn(RestauranteFormaPagamentoController.class).listar(restauranteId)).withRel(rel);
	}

	public Link linkToRestauranteFormasPagamentoDesassociacao(Long restauranteId, Long formaPagamentoId, String rel) {
		return linkTo(methodOn(RestauranteFormaPagamentoController.class).desassociarFormaPagamento(restauranteId,
				formaPagamentoId)).withRel(rel);
	}

	public Link linkToRestauranteFormasPagamentoAssociacao(Long restauranteId, String rel) {
		return linkTo(methodOn(RestauranteFormaPagamentoController.class).asassociar(restauranteId, null)).withRel(rel);
	}

	public Link linkToRestauranteFormasPagamento(Long restauranteId) {
		return linkToRestauranteFormasPagamento(restauranteId, IanaLinkRelations.SELF.value());
	}

	public Link linkToFormasPagamento(String rel) {
		return linkTo(FormaPagamentoController.class).withRel(rel);
	}

	public Link linkToFormasPagamento() {
		return linkToFormasPagamento(IanaLinkRelations.SELF.value());
	}

	public Link linkToFecharRestaurante(Long restauranteId, String rel) {
		return linkTo(methodOn(RestauranteController.class).fechar(restauranteId)).withRel(rel);
	}

	public Link linkToAbrirRestaurante(Long restauranteId, String rel) {
		return linkTo(methodOn(RestauranteController.class).abrir(restauranteId)).withRel(rel);
	}

	public Link linkToAtivarRestaurante(Long restauranteId, String rel) {
		return linkTo(methodOn(RestauranteController.class).ativar(restauranteId)).withRel(rel);
	}

	public Link linkToInativarRestaurante(Long restauranteId, String rel) {
		return linkTo(methodOn(RestauranteController.class).inativar(restauranteId)).withRel(rel);
	}

	public Link linkToCozinhas(String rel) {
		return linkTo(CozinhaController.class).withRel(rel);
	}

	public Link linkToCozinha(Long cozinhaId) {
		return linkTo(methodOn(CozinhaController.class).buscar(cozinhaId)).withSelfRel();
	}

	public Link linkToUsuario(Long clientId) {
		return linkTo(methodOn(UsuarioController.class).buscar(clientId)).withSelfRel();
	}

	public Link linkToUsuarios(String rel) {
		return linkTo(UsuarioController.class).withRel(rel);
	}

	public Link linkToUsuarios() {
		return linkToUsuarios(IanaLinkRelations.SELF.value());
	}

	public Link linkToUsuarioGrupos(Long usuarioId, String rel) {
		return linkTo(methodOn(UsuarioGrupoController.class).listar(usuarioId)).withRel(rel);
	}

	public Link linkToUsuarioGrupoAssociacao(Long usuarioId, String rel) {
		return linkTo(methodOn(UsuarioGrupoController.class).associarGrupo(usuarioId, null)).withRel(rel);
	}

	public Link linkToUsuarioGrupoDesassociacao(Long usuarioId, Long grupoId, String rel) {
		return linkTo(methodOn(UsuarioGrupoController.class).desassociarGrupo(usuarioId, grupoId)).withRel(rel);
	}

	public Link linkToFormaPagamento(Long formaPagamentoId) {
		return linkTo(methodOn(FormaPagamentoController.class).buscar(formaPagamentoId, null)).withSelfRel();
	}

	public Link linkToCidade(Long cidadeId) {
		return linkTo(methodOn(CidadeController.class).buscar(cidadeId)).withSelfRel();
	}

	public Link linkToProduto(Long restauranteId, Long produtoId, String rel) {
		return linkTo(methodOn(RestauranteProdutosController.class).buscar(restauranteId, produtoId)).withRel(rel);
	}

	public Link linkToProduto(Long restauranteId, Long produtoId) {
		return linkToProduto(restauranteId, produtoId, IanaLinkRelations.SELF.value());
	}

	public Link linkToProdutos(Long restauranteId, String rel) {
		return linkTo(methodOn(RestauranteProdutosController.class).listar(restauranteId, null)).withRel(rel);
	}

	public Link linkToProdutos(Long restauranteId) {
		return linkToProdutos(restauranteId, IanaLinkRelations.SELF.value());
	}

	public Link linkToFotoProduto(Long restauranteId, Long produtoId, String rel) {
		return linkTo(methodOn(RestauranteProdutoFotoController.class).buscar(restauranteId, produtoId)).withRel(rel);
	}

	public Link linkToFotoProdutoDigital(Long restauranteId, Long produtoId, String rel)
			throws HttpMediaTypeNotAcceptableException {
		return linkTo(methodOn(RestauranteProdutoFotoController.class).servirFoto(restauranteId, produtoId, ""))
				.withRel(rel);
	}

	public Link linkToFotoProduto(Long restauranteId, Long produtoId) {
		return linkToFotoProduto(restauranteId, produtoId, IanaLinkRelations.SELF.value());
	}

	public Link linkToCidades(String rel) {
		return linkTo(methodOn(CidadeController.class).listar()).withRel(rel);
	}

	public Link linkToCidades() {
		return linkToCidades(IanaLinkRelations.SELF.value());
	}

	public Link linkToEstado(Long estadoId) {
		return linkTo(methodOn(EstadoController.class).buscar(estadoId)).withSelfRel();
	}

	public Link linkToEstados(String rel) {
		return linkTo(EstadoController.class).withRel(rel);
	}

	public Link linkToEstados() {
		return linkToEstados(IanaLinkRelations.SELF.value());
	}

	public Link linkToResponsaveisRestaurante(Long restauranteId, String rel) {
		return linkTo(methodOn(RestauranteUsuarioResponsavelController.class).listar(restauranteId)).withRel(rel);
	}

	public Link linkToResponsaveisRestaurante(Long restauranteId) {
		return linkToResponsaveisRestaurante(restauranteId, IanaLinkRelations.SELF.value());
	}

	public Link linkToResponsaveisRestauranteDesassociar(Long restauranteId, Long usuarioId, String rel) {
		return linkTo(methodOn(RestauranteUsuarioResponsavelController.class).desassociarResponsavel(restauranteId,
				usuarioId)).withRel(rel);
	}

	public Link linkToResponsaveisRestauranteAssociar(Long restauranteId, String rel) {
		return linkTo(
				methodOn(RestauranteUsuarioResponsavelController.class).asassociarResponsavel(restauranteId, null))
				.withRel(rel);
	}

	public Link linkToConfirmacaoPedido(String codigoPedido, String rel) {
		return linkTo(methodOn(PedidoStatusController.class).alteraStatusConfirmacao(codigoPedido)).withRel(rel);
	}

	public Link linkToEntgregaPedido(String codigoPedido, String rel) {
		return linkTo(methodOn(PedidoStatusController.class).alteraStatusEntregue(codigoPedido)).withRel(rel);
	}

	public Link linkToCancelamentoPedido(String codigoPedido, String rel) {
		return linkTo(methodOn(PedidoStatusController.class).alteraStatusCancelado(codigoPedido)).withRel(rel);
	}

	public Link linkToGrupos() {
		return linkToGrupos(IanaLinkRelations.SELF.value());
	}

	public Link linkToGrupos(String rel) {
		return linkTo(methodOn(GrupoController.class).listar()).withRel(rel);
	}

	public Link linkToPermissoes(String rel) {
		return linkTo(PermissaoController.class).withRel(rel);
	}

	public Link linkToPermissoes() {
		return linkToPermissoes(IanaLinkRelations.SELF.value());
	}

	public Link linkToGrupoPermissoes(Long grupoId, String rel) {
		return linkTo(methodOn(GrupoPermissaoController.class).listar(grupoId)).withRel(rel);
	}

	public Link linkToGrupoPermissoes(Long grupoId) {
		return linkToGrupoPermissoes(grupoId, IanaLinkRelations.SELF.value());
	}

	public Link linkToGrupoPermissaoAssociacao(Long grupoId, String rel) {
		return linkTo(methodOn(GrupoPermissaoController.class).associar(grupoId, null)).withRel(rel);
	}

	public Link linkToGrupoPermissaoDesassociacao(Long grupoId, Long permissaoId, String rel) {
		return linkTo(methodOn(GrupoPermissaoController.class).desassociar(grupoId, permissaoId)).withRel(rel);
	}

	public Link linkToEstatisticas(String rel) {
		return linkTo(EstatisticasController.class).withRel(rel);
	}

	public Link linkToEstatisticasVendasDiarias(String rel) {
		TemplateVariables filtroVariables = new TemplateVariables(
				new TemplateVariable("restauranteId", VariableType.REQUEST_PARAM),
				new TemplateVariable("dataCriacaoInicio", VariableType.REQUEST_PARAM),
				new TemplateVariable("dataCriacaoFim", VariableType.REQUEST_PARAM),
				new TemplateVariable("timeOffset", VariableType.REQUEST_PARAM));

		String pedidosUrl = linkTo(methodOn(EstatisticasController.class)
				.consultarVendasDiarias(null, null)).toUri().toString();

		return Link.of(UriTemplate.of(pedidosUrl, filtroVariables), rel);
	}
}
