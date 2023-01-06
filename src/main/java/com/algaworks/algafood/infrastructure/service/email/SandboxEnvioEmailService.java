package com.algaworks.algafood.infrastructure.service.email;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.mail.javamail.MimeMessageHelper;

import freemarker.template.Configuration;

public class SandboxEnvioEmailService extends SmtpEnvioEmailService {

	@Autowired
	private Environment environment;

	@Autowired
	protected Configuration freemarkerConfig;

	@Override
	protected MimeMessage criarMimeMessage(Mensagem mensagem) throws MessagingException {
		MimeMessage mimeMessage = super.criarMimeMessage(mensagem);

		MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, "UTF-8");
		helper.setTo(environment.getProperty("algafood.email.sandbox.destinatario"));

		return mimeMessage;
	}
}
