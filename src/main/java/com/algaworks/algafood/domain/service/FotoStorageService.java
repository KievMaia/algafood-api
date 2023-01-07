package com.algaworks.algafood.domain.service;

import java.io.InputStream;
import java.util.Objects;
import java.util.UUID;

import lombok.Builder;
import lombok.Getter;

public interface FotoStorageService {
	
	InputStream recuperar(String nomeArquivo);
	
	FotoRecuperada recuperarS3(String nomeArquivo);

	void armazenar(NovaFoto novaFoto);
	
	void remover(String nomeArquivo);
	
	default String gerarNomeArquivo(String nomeOriginal) {
		return UUID.randomUUID().toString() + "_" + nomeOriginal;
	}
	
	@Builder
	@Getter
	class NovaFoto {
		private String nomeArquivo;
		private String contentType;
		private InputStream inputStream;
	}
	
	@Builder
	@Getter
	class FotoRecuperada {
		private InputStream inputStream;
		private String url;
		
		public boolean temUrl() {
			return url != null;
		}
		
		public boolean temInputStream() {
			return inputStream != null;
		}
	}

	default void substituir(String nomeArquivoAntigo, NovaFoto novaFoto) {
		this.armazenar(novaFoto);
		
		if (Objects.nonNull(nomeArquivoAntigo)) {
			this.remover(nomeArquivoAntigo);
		}
	}
}
