package com.algaworks.algafood.core.openapi;

import java.io.File;
import java.io.InputStream;
import java.net.URI;
import java.net.URL;
import java.net.URLStreamHandler;
import java.util.Arrays;
import java.util.List;
import java.util.function.Consumer;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.data.domain.Pageable;
import org.springframework.hateoas.CollectionModel;
import org.springframework.hateoas.Links;
import org.springframework.hateoas.PagedModel;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.web.context.request.ServletWebRequest;

import com.algaworks.algafood.api.exceptionhandler.Problem;
import com.algaworks.algafood.api.v1.model.CidadeModel;
import com.algaworks.algafood.api.v1.model.CozinhaModel;
import com.algaworks.algafood.api.v1.model.EstadoModel;
import com.algaworks.algafood.api.v1.model.FormaPagamentoModel;
import com.algaworks.algafood.api.v1.model.GrupoModel;
import com.algaworks.algafood.api.v1.model.PedidoResumoModel;
import com.algaworks.algafood.api.v1.model.PermissaoModel;
import com.algaworks.algafood.api.v1.model.ProdutoModel;
import com.algaworks.algafood.api.v1.model.RestauranteBasicoModel;
import com.algaworks.algafood.api.v1.model.UsuarioModel;
import com.algaworks.algafood.api.v1.openapi.model.CidadesModelOpenApi;
import com.algaworks.algafood.api.v1.openapi.model.CozinhasModelOpenApi;
import com.algaworks.algafood.api.v1.openapi.model.EstadosModelOpenApi;
import com.algaworks.algafood.api.v1.openapi.model.FormasPagamentoModelOpenApi;
import com.algaworks.algafood.api.v1.openapi.model.GruposModelOpenApi;
import com.algaworks.algafood.api.v1.openapi.model.LinksModelOpenApi;
import com.algaworks.algafood.api.v1.openapi.model.PageableModelOpenApi;
import com.algaworks.algafood.api.v1.openapi.model.PedidosResumoModelOpenApi;
import com.algaworks.algafood.api.v1.openapi.model.PermissoesModelOpenApi;
import com.algaworks.algafood.api.v1.openapi.model.ProdutosModelOpenApi;
import com.algaworks.algafood.api.v1.openapi.model.RestauranteBasicoModelDocumentationOpenApi;
import com.algaworks.algafood.api.v1.openapi.model.UsuarioModelOpenApi;
import com.algaworks.algafood.api.v2.model.CidadeModelV2;
import com.algaworks.algafood.api.v2.model.CozinhaModelV2;
import com.algaworks.algafood.api.v2.openapi.model.CidadesModelOpenApiV2;
import com.algaworks.algafood.api.v2.openapi.model.CozinhasModelOpenApiV2;
import com.fasterxml.classmate.TypeResolver;

import springfox.bean.validators.configuration.BeanValidatorPluginsConfiguration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RepresentationBuilder;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.builders.ResponseBuilder;
import springfox.documentation.schema.AlternateTypeRules;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.AuthorizationScope;
import springfox.documentation.service.Contact;
import springfox.documentation.service.HttpAuthenticationScheme;
import springfox.documentation.service.Response;
import springfox.documentation.service.SecurityReference;
import springfox.documentation.service.Tag;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spi.service.contexts.SecurityContext;
import springfox.documentation.spring.web.plugins.Docket;

@Configuration
@Import(BeanValidatorPluginsConfiguration.class)
public class SpringFoxConfig {

	@Bean
	public Docket apiDocketV1() {
		TypeResolver typeResolver = new TypeResolver();
		
		return new Docket(DocumentationType.OAS_30)
				.groupName("V1")
				.select()
				.apis(RequestHandlerSelectors.basePackage("com.algaworks.algafood.api"))
				.paths(PathSelectors.ant("/v1/**"))
				.build()
			.useDefaultResponseMessages(false)
			.globalResponses(HttpMethod.GET, globalGetResponseMessages())
			.globalResponses(HttpMethod.POST, globalPostPutResponseMessages())
			.globalResponses(HttpMethod.PUT, globalPostPutResponseMessages())
			.globalResponses(HttpMethod.DELETE, globalDeleteResponseMessages())
//			.globalRequestParameters(Collections.singletonList(new RequestParameterBuilder()
//					.name("campos")
//					.description("Nomes das propriedades para filtrar na resposta, separados por vírgula")
//					.in(ParameterType.QUERY)
//					.required(true)
//					.query(q -> q.model(m -> m.scalarModel(ScalarType.STRING)))
//					.build()))
			.additionalModels(typeResolver.resolve(Problem.class))
			.ignoredParameterTypes(ServletWebRequest.class, URL.class, URI.class, URLStreamHandler.class,
					Resource.class, File.class, InputStream.class, InputStreamResource.class)
			.directModelSubstitute(Pageable.class, PageableModelOpenApi.class)
			.directModelSubstitute(Links.class, LinksModelOpenApi.class)
			
			.alternateTypeRules(AlternateTypeRules.newRule(
					typeResolver.resolve(PagedModel.class, CozinhaModel.class),
					CozinhasModelOpenApi.class))
			
			.alternateTypeRules(AlternateTypeRules.newRule(
                    typeResolver.resolve(PagedModel.class, PedidoResumoModel.class),
                    PedidosResumoModelOpenApi.class))
			
			.alternateTypeRules(AlternateTypeRules.newRule(
                    typeResolver.resolve(CollectionModel.class, CidadeModel.class),
                    CidadesModelOpenApi.class))
			
			.alternateTypeRules(AlternateTypeRules.newRule(
                    typeResolver.resolve(CollectionModel.class, EstadoModel.class),
                    EstadosModelOpenApi.class))
			
			.alternateTypeRules(AlternateTypeRules.newRule(
                    typeResolver.resolve(CollectionModel.class, FormaPagamentoModel.class),
                    FormasPagamentoModelOpenApi.class))
			
			.alternateTypeRules(AlternateTypeRules.newRule(
                    typeResolver.resolve(CollectionModel.class, GrupoModel.class),
                    GruposModelOpenApi.class))
			
			.alternateTypeRules(AlternateTypeRules.newRule(
                    typeResolver.resolve(CollectionModel.class, PermissaoModel.class),
                    PermissoesModelOpenApi.class))
			
			.alternateTypeRules(AlternateTypeRules.newRule(
                    typeResolver.resolve(CollectionModel.class, ProdutoModel.class),
                    ProdutosModelOpenApi.class))
			
			.alternateTypeRules(AlternateTypeRules.newRule(
                    typeResolver.resolve(CollectionModel.class, RestauranteBasicoModel.class),
                    RestauranteBasicoModelDocumentationOpenApi.class))
			
			.alternateTypeRules(AlternateTypeRules.newRule(
                    typeResolver.resolve(CollectionModel.class, UsuarioModel.class),
                    UsuarioModelOpenApi.class))
			
			//Essa configuração é apenas para as versões springfox < 3 para se autenticar no swagger.
//			.securitySchemes(Arrays.asList(securityScheme()))
			
			//Essa configuração é apenas para as versões springfox > 2 para se autenticar no swagger.
			.securityContexts(Arrays.asList(securityContext()))
	        .securitySchemes(List.of(authenticationScheme()))
	        .securityContexts(List.of(securityContext()))
			
			.apiInfo(apiInfoV1())
			.tags(new Tag("Cidades", "Gerencia cidades"), 
				  new Tag("Grupos", "Gerencia os grupos de usuários"),
				  new Tag("Cozinhas", "Gerencia cozinhas"),
				  new Tag("Formas de Pagamento", "Gerencia formas de pagamento"),
				  new Tag("Pedidos", "Gerencia pedidos"),
				  new Tag("Restaurantes", "Gerencia restaurantes"),
				  new Tag("Estados", "Gerencia estados"),
				  new Tag("Fluxo Pedidos", "Gerencia o fluxo de pedidos"),
				  new Tag("Restaurante Formas de Pagamento", "Gerencia a forma de pagamento do restaurante"),
				  new Tag("Restaurante Usuário Responsável", "Gerencia os usuários responsáveis pelo restaurante"),
				  new Tag("Restaurante Produtos", "Gerencia os produtos de um restaurante"),
				  new Tag("Restaurante Produto Fotos", "Gerencia as fotos dos produtos de um restaurante"),
				  new Tag("Usuários", "Gerencia usuários"),
				  new Tag("Estatísticas", "Estastísticas da AlgaFood"),
				  new Tag("Permissões", "Gerencia as permissões")
				);
	}
	
	@Bean
	public Docket apiDocketV2() {
		TypeResolver typeResolver = new TypeResolver();
		
		return new Docket(DocumentationType.OAS_30)
				.groupName("V2")
				.select()
				.apis(RequestHandlerSelectors.basePackage("com.algaworks.algafood.api"))
				.paths(PathSelectors.ant("/v2/**"))
				.build()
			.useDefaultResponseMessages(false)
			.globalResponses(HttpMethod.GET, globalGetResponseMessages())
			.globalResponses(HttpMethod.POST, globalPostPutResponseMessages())
			.globalResponses(HttpMethod.PUT, globalPostPutResponseMessages())
			.globalResponses(HttpMethod.DELETE, globalDeleteResponseMessages())
//			.globalRequestParameters(Collections.singletonList(new RequestParameterBuilder()
//					.name("campos")
//					.description("Nomes das propriedades para filtrar na resposta, separados por vírgula")
//					.in(ParameterType.QUERY)
//					.required(true)
//					.query(q -> q.model(m -> m.scalarModel(ScalarType.STRING)))
//					.build()))
			.additionalModels(typeResolver.resolve(Problem.class))
			.ignoredParameterTypes(ServletWebRequest.class, URL.class, URI.class, URLStreamHandler.class,
					Resource.class, File.class, InputStream.class, InputStreamResource.class)
			.directModelSubstitute(Pageable.class, PageableModelOpenApi.class)
			.directModelSubstitute(Links.class, LinksModelOpenApi.class)
			
			.alternateTypeRules(AlternateTypeRules.newRule(
                    typeResolver.resolve(CollectionModel.class, CidadeModelV2.class),
                    CidadesModelOpenApiV2.class))
			
			.alternateTypeRules(AlternateTypeRules.newRule(
					typeResolver.resolve(PagedModel.class, CozinhaModelV2.class),
					CozinhasModelOpenApiV2.class))
			
			//Essa configuração é apenas para as versões springfox < 3 para se autenticar no swagger.
//			.securitySchemes(Arrays.asList(securityScheme()))
			
			//Essa configuração é apenas para as versões springfox > 2 para se autenticar no swagger.
			.securityContexts(Arrays.asList(securityContext()))
	        .securitySchemes(List.of(authenticationScheme()))
	        .securityContexts(List.of(securityContext()))
			
			.apiInfo(apiInfoV2())
			
			.tags(new Tag("Cidades", "Gerencia cidades"),
					new Tag("Cozinhas", "Gerencia cozinhas"));
			
	}
	//Essa configuração é apenas para as versões springfox < 3.
//	private SecurityScheme securityScheme() {
//		return new OAuthBuilder()
//					.name("Algafood")
//					.grantTypes(grantTypes())
//					.scopes(scopes())
//					.build();
//	}
//	
//	private List<GrantType> grantTypes(){
//		return Arrays.asList(new ResourceOwnerPasswordCredentialsGrant("/oauth/token"));
//	}
//	
//	private List<AuthorizationScope> scopes() {
//		return Arrays.asList(new AuthorizationScope("READ", "Acesso de leitura"),
//				new AuthorizationScope("WRITE", "Acesso de escrita"));
//	}
	
	//Já essa configuração é para as versões springfox > 2.
	private SecurityContext securityContext() {
		  return SecurityContext.builder()
		        .securityReferences(securityReference()).build();
		}

		private List<SecurityReference> securityReference() {
		  AuthorizationScope authorizationScope = new AuthorizationScope("global", "accessEverything");
		  AuthorizationScope[] authorizationScopes = new AuthorizationScope[1];
		  authorizationScopes[0] = authorizationScope;
		  return List.of(new SecurityReference("Authorization", authorizationScopes));
		}

		private HttpAuthenticationScheme authenticationScheme() {
		  return HttpAuthenticationScheme.JWT_BEARER_BUILDER.name("Authorization").build();
		}
	
	private List<Response> globalGetResponseMessages(){
		return Arrays.asList(
				new ResponseBuilder()
					.code(String.valueOf(HttpStatus.INTERNAL_SERVER_ERROR.value()))
					.description("Erro interno do servidor.")
					.representation( MediaType.APPLICATION_JSON )
                    .apply(getProblemaModelReference())
					.build(),
				new ResponseBuilder()
					.code(String.valueOf(HttpStatus.NOT_ACCEPTABLE.value()))
					.description("Recurso não possui representação que poderia ser aceito pelo consumidor.")
					.build(),
				new ResponseBuilder()
					.code(String.valueOf(HttpStatus.NOT_FOUND.value()))
					.description("Recurso não encontrado.")
					.build()
				
				//Dessa forma para o springfox 2.X.X
//				new ResponseMessageBuilder()
//					.code(HttpStatus.INTERNAL_SERVER_ERROR.value())
//					.message("Erro interno do servidor")
//					.build(),
//				new ResponseMessageBuilder()
//					.code(HttpStatus.NOT_ACCEPTABLE.value())
//					.message("Recurso não possui representação que poderia ser aceito pelo servidor")
//					.build()
				);
	}
	
	private List<Response> globalPostPutResponseMessages(){
		return Arrays.asList(
				new ResponseBuilder()
					.code(String.valueOf(HttpStatus.INTERNAL_SERVER_ERROR.value()))
					.description("Erro interno do servidor")
					.representation( MediaType.APPLICATION_JSON )
                    .apply(getProblemaModelReference())
					.build(),
				new ResponseBuilder()
					.code(String.valueOf(HttpStatus.NOT_ACCEPTABLE.value()))
					.description("Recurso não possui representação que poderia ser aceita pelo consumidor.")
					.build(),
				new ResponseBuilder()
					.code(String.valueOf(HttpStatus.BAD_REQUEST.value()))
					.description("Requisição inválida (erro do cliente), verifique a sintaxe da solicitação ou a mensagem de solicitação que pode estar inválida.")
					.representation(MediaType.APPLICATION_JSON)
					.apply(getProblemaModelReference())
					.build(),
				new ResponseBuilder()
					.code(String.valueOf(HttpStatus.UNSUPPORTED_MEDIA_TYPE.value()))
					.description("Tipo de mídia não suportado. A carga útil está em um formato não suportado por este método.")
					.representation( MediaType.APPLICATION_JSON )
                    .apply(getProblemaModelReference())
					.build()
				);
	}
	
	private List<Response> globalDeleteResponseMessages(){
		return Arrays.asList(
				new ResponseBuilder()
					.code(String.valueOf(HttpStatus.INTERNAL_SERVER_ERROR.value()))
					.description("Erro interno do servidor")
					.representation( MediaType.APPLICATION_JSON )
                    .apply(getProblemaModelReference())
					.build(),
				new ResponseBuilder()
					.code(String.valueOf(HttpStatus.BAD_REQUEST.value()))
					.description("Erro do cliente, verifique a sintaxe da solicitação ou a mensagem de solicitação que pode estar inválida")
					.representation( MediaType.APPLICATION_JSON )
                    .apply(getProblemaModelReference())
					.build()
				);
	}
	
	private ApiInfo apiInfoV1() {
		return new ApiInfoBuilder()
				.title("Algafood API")
				.description("<strong>API aberta para clientes e restaurantes</strong>")
				.version("1")
				.contact(new Contact("Kiev Maia", "https://www.linkedin.com/in/kievmaia/", "kievmaia@gmail.com"))
				.build();
	}
	
	private ApiInfo apiInfoV2() {
		return new ApiInfoBuilder()
				.title("Algafood API")
				.description("<strong>API aberta para clientes e restaurantes</strong>")
				.version("2")
				.contact(new Contact("Kiev Maia", "https://www.linkedin.com/in/kievmaia/", "kievmaia@gmail.com"))
				.build();
	}
	
	private Consumer<RepresentationBuilder> getProblemaModelReference() {
	    return r -> r.model(m -> m.name("Problema")
	            .referenceModel(ref -> ref.key(k -> k.qualifiedModelName(
	                    q -> q.name("Problema").namespace("com.algaworks.algafood.api.exceptionhandler")))));
	}
}
