package com.algaworks.algafood.core.openapi;

import java.util.Arrays;
import java.util.List;
import java.util.function.Consumer;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.web.context.request.ServletWebRequest;

import com.algaworks.algafood.api.controller.openapi.model.CozinhasModelOpenApi;
import com.algaworks.algafood.api.controller.openapi.model.PedidosResumoModelOpenApi;
import com.algaworks.algafood.api.exceptionhandler.Problem;
import com.algaworks.algafood.api.model.CozinhaModel;
import com.algaworks.algafood.api.model.PedidoResumoModel;
import com.algaworks.algafood.core.openapi.model.PageableModelOpenApi;
import com.fasterxml.classmate.TypeResolver;

import springfox.bean.validators.configuration.BeanValidatorPluginsConfiguration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.RepresentationBuilder;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.builders.ResponseBuilder;
import springfox.documentation.schema.AlternateTypeRules;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.service.Response;
import springfox.documentation.service.Tag;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;

@Configuration
@Import(BeanValidatorPluginsConfiguration.class)
public class SpringFoxConfig {

	@Bean
	public Docket apiDocket() {
		TypeResolver typeResolver = new TypeResolver();
		
		return new Docket(DocumentationType.OAS_30)
				.select()
				.apis(RequestHandlerSelectors.basePackage("com.algaworks.algafood.api"))
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
			.ignoredParameterTypes(ServletWebRequest.class)
			.directModelSubstitute(Pageable.class, PageableModelOpenApi.class)
			.alternateTypeRules(AlternateTypeRules.newRule(
					typeResolver.resolve(Page.class, CozinhaModel.class),
					CozinhasModelOpenApi.class))
			.alternateTypeRules(AlternateTypeRules.newRule(
                    typeResolver.resolve(Page.class, PedidoResumoModel.class),
                    PedidosResumoModelOpenApi.class))
			.apiInfo(apiInfo())
			.tags(new Tag("Cidades", "Gerencia cidades"), 
				  new Tag("Grupos", "Gerencia grupos"),
				  new Tag("Cozinhas", "Gerencia cozinhas"),
				  new Tag("Formas de Pagamento", "Gerencia formas de pagamento"),
				  new Tag("Pedidos", "Gerencia pedidos"),
				  new Tag("Restaurantes", "Gerencia restaurantes")
				  );
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
	
	private ApiInfo apiInfo() {
		return new ApiInfoBuilder()
				.title("Algafood API")
				.description("API aberta para clientes e restaurantes")
				.version("1")
				.contact(new Contact("Kiev Maia", "https://www.linkedin.com/in/kievmaia/", "kievmaia@gmail.com"))
				.build();
	}
	
	private Consumer<RepresentationBuilder> getProblemaModelReference() {
	    return r -> r.model(m -> m.name("Problema")
	            .referenceModel(ref -> ref.key(k -> k.qualifiedModelName(
	                    q -> q.name("Problema").namespace("com.algaworks.algafood.api.exceptionhandler")))));
	}
}
