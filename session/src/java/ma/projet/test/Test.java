/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ma.projet.test;

import java.time.LocalDate;
import java.util.Date;
import java.util.Random;
import ma.projet.entity.Client;
import ma.projet.entity.Employe;
import ma.projet.service.ClientService;
import ma.projet.service.EmployeService;
import ma.projet.util.HibernateUtil;
import ma.projet.util.SendMailTLS;
import ma.projet.util.Utils;
import org.hibernate.Hibernate;


/**
 *
 * @author Lachgar
 */
public class Test {

    public static void main(String[] args) {
//        ClientService cs = new ClientService();
//        cs.create(new Client("bennane", "ilyass", new Date(2022,03, 15), "bennane.i@gmail.com", "azer1234"));
//        EmployeService es = new EmployeService();
//        es.create(new Employe("admin@admin.com", "azerty"));
//        
//        System.out.println("sending..");
//        SendMailTLS.send("code est 123", "shopcov20@gmail.com");
        
//        Random random = new Random();
//        int code = 1000 + random.nextInt(9000);
//        System.out.println(code);
        
        System.out.println(Utils.MD5("123"));
    }
}
