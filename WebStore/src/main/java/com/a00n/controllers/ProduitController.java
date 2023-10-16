package com.a00n.controllers;

import com.a00n.entities.Categorie;
import com.a00n.entities.Produit;
import com.a00n.service.CategorieService;
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
 * @author ay0ub
 */
@WebServlet(name = "ProduitController", urlPatterns = {"/produits"})
public class ProduitController extends HttpServlet {

    ProduitService ps = new ProduitService();
    CategorieService cs = new CategorieService();

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
            throws ServletException, IOException {
        request.setAttribute("produits", ps.findAll());
        request.setAttribute("categories", cs.findAll());
        request.getRequestDispatcher("/produits.jsp").forward(request, response);
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
        List<Produit> produits = ps.findAll();
        HttpSession session = request.getSession();
        int id;
        String reference;
        Double prix;
        int categorieId;
        Produit produit;
        switch (op) {
            case "add":
                try {
                reference = request.getParameter("reference");
                prix = Double.valueOf(request.getParameter("prix"));
                categorieId = Integer.parseInt(request.getParameter("categorie_id"));
                if (reference.isEmpty()) {
                    session.setAttribute("status", "danger");
                    session.setAttribute("message", "Please fill all fields");
                    response.sendRedirect(request.getContextPath() + "/produits");
                }
                Categorie categorie = cs.findById(categorieId);
                produit = new Produit(reference, prix, categorie);
                ps.create(produit);
                session.setAttribute("status", "success");
                session.setAttribute("message", "Produit Created Successfully");
                response.sendRedirect(request.getContextPath() + "/produits");
                break;
            } catch (Exception e) {
                session.setAttribute("status", "danger");
                session.setAttribute("message", "Error");
                response.sendRedirect(request.getContextPath() + "/produits");
                break;
            }

            case "delete":
                id = Integer.parseInt(request.getParameter("id"));
                ps.delete(ps.findById(id));
                session.setAttribute("status", "success");
                session.setAttribute("message", "Produit Deleted Successfully");
                response.sendRedirect(request.getContextPath() + "/produits");
                break;

            case "update":
                id = Integer.parseInt(request.getParameter("id"));
                produit = ps.findById(id);
                if (produit == null) {
                    session.setAttribute("status", "danger");
                    session.setAttribute("message", "Produit Not Found");
                    response.sendRedirect(request.getContextPath() + "/produits");
                } else {
                    reference = request.getParameter("reference");
                    prix = Double.valueOf(request.getParameter("prix"));
                    categorieId = Integer.parseInt(request.getParameter("categorie_id"));
                    Categorie cat = cs.findById(categorieId);
                    Produit newProduit = new Produit(reference, prix, cat);
                    newProduit.setId(produit.getId());
                    session.setAttribute("status", "success");
                    session.setAttribute("message", "Produit Updated Successfully");
                    ps.update(newProduit);
                    response.sendRedirect(request.getContextPath() + "/produits");
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
