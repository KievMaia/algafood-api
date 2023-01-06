package com.algaworks.algafood.infrastructure.service.email;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;

import com.algaworks.algafood.domain.service.EnvioEmailService;

import freemarker.template.Configuration;
import freemarker.template.Template;

@Service
public class SmptEnvioEmailService implements EnvioEmailService{

	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private Environment environment;
	
	@Autowired
	private Configuration freemarkerConfig;
	
	@Override
	public void enviar(Mensagem mensagem) {
		try {
			String corpo = processarTemplate(mensagem);
			MimeMessage mimeMessage = mailSender.createMimeMessage();
			
			MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, "UTF-8");
			helper.setFrom(environment.getProperty("algafood.email.remetente"));
			helper.setTo(mensagem.getDestinatarios().toArray(new String[0]));
			helper.setSubject(mensagem.getAssunto());
			helper.setText(corpo, true);
			
			mailSender.send(mimeMessage);
			
		} catch (Exception e) {
			throw new EmailException("Não foi possível enviar e-mail", e);
		}
	}

	private String processarTemplate(Mensagem mensagem) {
		try {
			Template template = freemarkerConfig.getTemplate(mensagem.getCorpo());
			
			
			return FreeMarkerTemplateUtils.processTemplateIntoString(
					template, mensagem.getVariaveis());
		} catch (Exception e) {
			throw new EmailException("Não foi possível montar o template do e-mail", e);
		} 
	}
}
