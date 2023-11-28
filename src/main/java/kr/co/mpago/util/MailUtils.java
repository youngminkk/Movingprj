package kr.co.mpago.util;

import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;



public class MailUtils {
	// 발송한 인증코드 
	public String codeVeri = null;
	/**
	 * 인증메일 발송
	 */
	public void sendEmail(String email) throws AddressException, MessagingException {
		codeVeri = null;
		// 랜덤코드 생성
		String code = codeCreate();
		codeVeri = code;
		// 이메일 설정
		Properties p = new Properties();
		p.put("mail.smtp.host", "smtp.gmail.com"); // SMTP 호스트
		p.put("mail.smtp.auth", "true"); // 인증 사용
		p.put("mail.smtp.port", "465"); // 포트 번호
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.ssl.enable", "true");
		p.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		p.put("mail.debug", "true");
		
		// 발송자 이메일, 비밀번호
		Session session = Session.getDefaultInstance(p, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("rlagmlxo812@gmail.com", "hduu yrlx vbzf eiii");
			}
		});
        // 메시지 생성
        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress("rlagmlxo812@gmail.com"));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
        message.setSubject("안녕하세요 moving입니다");
        message.setText("인증 코드입니다." + code);
        
        // 메일발송
        Transport.send(message);
	}
	/**
	 * 임시비밀번호 발송
	 */
	public void sendPwdEmail(String email) throws AddressException, MessagingException {
		codeVeri = null;
		// 랜덤코드 생성
		String code = codeCreate() + "!!";
		codeVeri = code;
		// 이메일 설정
		Properties p = new Properties();
		p.put("mail.smtp.host", "smtp.gmail.com"); // SMTP 호스트
		p.put("mail.smtp.auth", "true"); // 인증 사용
		p.put("mail.smtp.port", "465"); // 포트 번호
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.ssl.enable", "true");
		p.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		p.put("mail.debug", "true");
		
		// 발송자 이메일, 비밀번호
		Session session = Session.getDefaultInstance(p, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("rlagmlxo812@gmail.com", "hduu yrlx vbzf eiii");
			}
		});
		// 메시지 생성
		Message message = new MimeMessage(session);
		message.setFrom(new InternetAddress("rlagmlxo812@gmail.com"));
		message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
		message.setSubject("안녕하세요 moving입니다");
		message.setText("임시 비밀번호 입니다. /n" +code);
		
		// 메일발송
		Transport.send(message);
	}
	
	/*
	 * 랜덤코드 생성
	 */
	public String codeCreate() {
		StringBuilder code = new StringBuilder(); // 영어, 숫자 담을 객체
		Random random = new Random();
		String alp = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"; // 영문 대문자
		for (int i = 0; i < 3; i++) {
			char c = alp.charAt(random.nextInt(alp.length()));
			long a = Math.round(Math.random() * 9); // 0 ~ 9 랜덤 숫자
			code.append(a);
			code.append(c);
		}
		return code.toString();
	}
}
