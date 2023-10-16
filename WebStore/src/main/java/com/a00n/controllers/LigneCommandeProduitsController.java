package com.a00n.controllers;

import com.a00n.entities.Categorie;
import com.a00n.entities.Commande;
import com.a00n.entities.Produit;
import com.a00n.entities.LigneCommandeProduit;
import com.a00n.entities.LigneCommandeProduitPK;
import com.a00n.service.CategorieService;
import com.a00n.service.CommandeService;
import com.a00n.service.LigneCommandeProduitService;
import com.a00n.service.ProduitService;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author Leeuw
 */
@WebServlet(name = "LigneCommandeProduit", urlPatterns = {"/ligneCommandeProduit"})
public class LigneCommandeProduitsController extends HttpServlet {

    ProduitService ps = new ProduitService();
    CommandeService cs = new CommandeService();
    LigneCommandeProduitService lcp = new LigneCommandeProduitService();

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException  {
        request.setAttribute("produits", ps.findAll());
        request.setAttribute("commandes", cs.findAll());
        request.setAttribute("ligneCommandeProduits", lcp.findAll());
        request.getRequestDispatcher("/ligneCommandeProduit.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String op = request.getParameter("op");
        HttpSession session = request.getSession();
        int produit_id, commande_id;
        int produitId, commandeId, quantity;
        LigneCommandeProduit ligneCommandeProduit;
        
        switch (op) {
            case "add":
                try {
                    quantity = Integer.parseInt(request.getParameter("quantity"));
                    produitId = Integer.parseInt(request.getParameter("produits_id"));
                    commandeId = Integer.parseInt(request.getParameter("commande_id"));
                    if (quantity <= 0) {
                        session.setAttribute("status", "danger");
                        session.setAttribute("message", "Quantity must be greater or equal to 1");
                        response.sendRedirect(request.getContextPath() + "/ligneCommandeProduit");
                    }
                     
                    ligneCommandeProduit = new LigneCommandeProduit(commandeId, produitId);
                    ligneCommandeProduit.setQuantity(quantity);
                    ligneCommandeProduit.setProduit(ps.findById(produitId));
                    ligneCommandeProduit.setCommande(cs.findById(commandeId));
                    lcp.create(ligneCommandeProduit);
                    ps.findById(produitId).getLigneCommandeProduitList().add(ligneCommandeProduit);
                    cs.findById(commandeId).getLigneCommandeProduitList().add(ligneCommandeProduit);

                    session.setAttribute("status", "success");
                    session.setAttribute("message", "Ligne Commande Produit Created Successfully");
                    response.sendRedirect(request.getContextPath() + "/ligneCommandeProduit");
                    break;
                } catch (Exception e) {
                    session.setAttribute("status", "danger");
                    session.setAttribute("message", "Error");
                    response.sendRedirect(request.getContextPath() + "/ligneCommandeProduit");
                    break;
            }

            case "delete":
                produit_id = Integer.parseInt(request.getParameter("produit_id"));
                commande_id = Integer.parseInt(request.getParameter("commande_id"));
                
                LigneCommandeProduit ligneCommandeToDelete = new LigneCommandeProduit(commande_id, produit_id);
                lcp.delete(ligneCommandeToDelete);
                
                session.setAttribute("status", "success");
                session.setAttribute("message", "Ligne Commande Produit Deleted Successfully");
                response.sendRedirect(request.getContextPath() + "/ligneCommandeProduit");
                break;

            case "update":
                quantity = Integer.parseInt(request.getParameter("up_quantity"));
                if (quantity <= 0) {
                        session.setAttribute("status", "danger");
                        session.setAttribute("message", "Quantity must be greater or equal to 1");
                        response.sendRedirect(request.getContextPath() + "/ligneCommandeProduit");
                } else {
                    produitId = Integer.parseInt(request.getParameter("up_produits_id"));
                    commandeId = Integer.parseInt(request.getParameter("up_commande_id"));
                    int prev_produitId = Integer.parseInt(request.getParameter("pre_produit_id"));
                    int prev_commandeId = Integer.parseInt(request.getParameter("pre_commande_id"));
                    
                    // Retrieve the existing LigneCommandeProduit from the database
                    LigneCommandeProduit existingLigneCommandeProduit = new LigneCommandeProduit(prev_commandeId, prev_produitId);
                       
                    if (existingLigneCommandeProduit != null){
                        LigneCommandeProduit newLigneCommandeProduit = new LigneCommandeProduit(commandeId, produitId);
                        newLigneCommandeProduit.setQuantity(quantity);
                        newLigneCommandeProduit.setProduit(ps.findById(produitId));
                        newLigneCommandeProduit.setCommande(cs.findById(commandeId));
                        
                        lcp.delete(existingLigneCommandeProduit);
                        lcp.create(newLigneCommandeProduit);
                        
                        session.setAttribute("status", "success");
                        session.setAttribute("message", "LigneCommandeProduit Updated Successfully");
                        response.sendRedirect(request.getContextPath() + "/ligneCommandeProduit");
                    }else {
                        session.setAttribute("status", "danger");
                        session.setAttribute("message", "LigneCommandeProduit not found");
                        response.sendRedirect(request.getContextPath() + "/ligneCommandeProduit");
                    }
                }
                break;
            default:
                throw new AssertionError();
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
