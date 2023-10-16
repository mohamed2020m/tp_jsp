/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ma.projet.util;

import javax.mail.PasswordAuthentication;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author HP
 */


public class SendMailTLS {
 
    static final String username = "medessar20@gmail.com";
    static final String password = "kydgcvafidgvjlwl";
    
//    static final String username = "sender_email";
//    static final String password = "sender_password";
//    
    public static void send(String s, String recpients) {
        Properties props = new Properties();

        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");
        props.put("mail.smtp.starttls.enable", "true");
   
        Session session = Session.getInstance(props,
            new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(username, password);
                }
            }
        );
        
        session.setDebug(true);
        
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recpients));
            message.setSubject("Password recovery");
            message.setText(s);
  
            Transport.send(message);
 
            System.out.println("Done");
 
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
 
}
