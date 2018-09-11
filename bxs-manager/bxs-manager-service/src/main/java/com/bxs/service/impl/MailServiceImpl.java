package com.bxs.service.impl;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;

import com.bxs.service.MailService;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

@Service
public class MailServiceImpl implements MailService {
	
	
	@Autowired
	private JavaMailSender mailSender;
	
	
	private Template template;
	
	@Value("${mail.smtp.from}")   
    private String mailSmtpFrom; 
	
	
	private static final String ENCODING = "utf-8";
	
	@Autowired
	public void setConfiguration(Configuration configuration)throws IOException {
		template = configuration.getTemplate("mailTemplate.ftl", ENCODING);
	}

	@Override
	public void sendMail(String email, String mailTitle, String mailContent) {
		try {
			MimeMessage msg = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(msg, true,ENCODING);
			helper.setTo(email);
			helper.setFrom(mailSmtpFrom);
			helper.setSubject(mailTitle);

			//通过模板构造邮件内容
			Map<String, String> param = new HashMap<String, String>();
			param.put("content", mailContent);
			String resultContent = FreeMarkerTemplateUtils.processTemplateIntoString(template, param);
			helper.setText(resultContent, true);				
			//发送
			mailSender.send(msg);
		} catch (MailException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (TemplateException e) {
			e.printStackTrace();
		}
		
	}

}
