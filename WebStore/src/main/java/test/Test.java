/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package test;

import com.a00n.entities.LigneCommandeProduit;
import com.a00n.entities.LigneCommandeProduitPK;
import com.a00n.service.CommandeService;
import com.a00n.service.LigneCommandeProduitService;
import com.a00n.service.ProduitService;

/**
 *
 * @author Leeuw
 */
public class Test {
    public static void main(String[] args) {
        ProduitService ps = new ProduitService();
        CommandeService cs = new CommandeService();
        LigneCommandeProduitService lcp = new LigneCommandeProduitService();
        
//        LigneCommandeProduit ligneCommandeProduit = new LigneCommandeProduit(cs.findById(4).getId(), ps.findById(7).getId());
//        ligneCommandeProduit.setQuantity(3);
//        ligneCommandeProduit.setProduit(ps.findById(7));
//        ligneCommandeProduit.setCommande(cs.findById(4));
//        lcp.create(ligneCommandeProduit);
//        ps.findById(7).getLigneCommandeProduitList().add(ligneCommandeProduit);
//        cs.findById(4).getLigneCommandeProduitList().add(ligneCommandeProduit);


        LigneCommandeProduit existingLigneCommandeProduit = lcp.findByIdKey(new LigneCommandeProduitPK(4, 8));
          
        existingLigneCommandeProduit.setQuantity(15);
        existingLigneCommandeProduit.getLigneCommandeProduitPK().setProduitId(7);
        existingLigneCommandeProduit.getLigneCommandeProduitPK().setCommandeId(4);
        
        if(lcp.update(existingLigneCommandeProduit)){
            System.out.println("good");
        }else{
            System.out.println("bad");
        }
        


    }
}
