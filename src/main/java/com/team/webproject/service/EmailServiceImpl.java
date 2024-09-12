package com.team.webproject.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@PropertySource("classpath:/protected/email.properties")
public class EmailServiceImpl implements EmailService {
	
	private final JavaMailSender emailSender;
	
	@Value("${spring.mail.username}")
	private String emailAddress;
	
	@Override
	public String sendCodeToEmail(String email) {
		SimpleMailMessage message = new SimpleMailMessage();
		
		String code ="";
		
		for (int i = 0; i < 6; ++i) {
			code += (int)(Math.random() * 10);
		}
		
		message.setFrom(emailAddress);
		message.setTo(email);
		message.setSubject("티켓킹 이메일 인증코드");
		message.setText("인증코드: " + code);
		emailSender.send(message);
		
		return code;
	}

}
