package com.entity;

import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Mailer {

	public String generateOTP() {
		// Generate a 6-digit OTP
		Random random = new Random();
		int otpNumber = 100000 + random.nextInt(900000);
		return String.valueOf(otpNumber);
	}

	public void sendOTPEmail(String toEmail, String otp) {

		final String fromEmail = "dhruvingadhiya49@gmail.com";
		final String password = "bsve kmcj zbwn jcbv";

		// Setup properties for the SMTP server
		Properties properties = new Properties();

	    properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.port", "587"); // Use port 587 with TLS
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

		// Anonymous class

		Session session = Session.getInstance(properties, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(fromEmail, password);
			}
		});

		session.setDebug(true);

		try {
			// Create a MimeMessage object
			MimeMessage message = new MimeMessage(session);

			// Set From:sender
			message.setFrom(new InternetAddress(fromEmail));

			// Set To:receiver
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));

			// Set the email subject and content
			message.setSubject("OTP Verification");
			message.setText("Your OTP for verification is: " + otp);

			// Send the email
			Transport.send(message);

			System.out.println("Email sent successfully!");
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

}
