package com.algaworks.algafood.utils;

import java.time.OffsetDateTime;
import java.time.format.DateTimeFormatter;

public class ConvertDates {

	//Converte uma String em um timestamp with timezone para banco PostgreSql (Padrão informando o fuso 2019-10-30T18:10:00-03:00 ou 2019-10-30T18:10:00Z informando o UTC).
	public static OffsetDateTime convertStringToOffsetDateTime(String data) {	
		OffsetDateTime dataConvertida = OffsetDateTime
                .parse(data, DateTimeFormatter.ISO_DATE_TIME);
		
		return dataConvertida;
	}
}
