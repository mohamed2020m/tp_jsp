/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.a00n.controllers;

import com.a00n.entities.Commande;
import com.a00n.service.CommandeService;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

/**
 *
 * @author Leeuw
 */
@WebServlet(name = "CommandeController", urlPatterns = {"/commandes"})
public class CommandeController extends HttpServlet {
    
    CommandeService cos = new CommandeService();
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    //    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    //            throws ServletException, IOException {
    //        
    //    }

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
        request.setAttribute("commandes", cos.findAll());
        request.getRequestDispatcher("/commandes.jsp").forward(request, response);
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
        List<Commande> commandes = cos.findAll();
        HttpSession session = request.getSession();
        int id;
        Commande commande;
        
        switch (op) {
            case "add":
                try {
                    String dateString = request.getParameter("date_de_commande");
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                    LocalDate dateDeCommande = LocalDate.parse(dateString, formatter);
                    
                    if (dateString.isEmpty()) {
                        session.setAttribute("status", "danger");
                        session.setAttribute("message", "Please fill date of commande");
                        response.sendRedirect(request.getContextPath() + "/commandes");
                    }
                    
                    cos.create(new Commande(dateDeCommande));
                    session.setAttribute("status", "success");
                    session.setAttribute("message", "Commande Created Successfully");
                    response.sendRedirect(request.getContextPath() + "/commandes");
                    break;
                } catch (Exception e) {
                    session.setAttribute("status", "danger");
                    session.setAttribute("message", "Error");
                    response.sendRedirect(request.getContextPath() + "/commandes");
                    break;
            }

            case "delete":
                id = Integer.parseInt(request.getParameter("id"));
                cos.delete(cos.findById(id));
                session.setAttribute("status", "success");
                session.setAttribute("message", "Commande Deleted Successfully");
                response.sendRedirect(request.getContextPath() + "/commandes");
                break;

            case "update":
                id = Integer.parseInt(request.getParameter("id"));
                commande = cos.findById(id);
                if (commande == null) {
                    session.setAttribute("status", "danger");
                    session.setAttribute("message", "Commande Not Found");
                    response.sendRedirect(request.getContextPath() + "/commandes");
                } else {
                    String dateString = request.getParameter("update_date_commande");
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                    LocalDate dateDeCommande = LocalDate.parse(dateString, formatter);
                    commande.setDateCommande(dateDeCommande);
                    cos.update(commande);
                    session.setAttribute("status", "success");
                    session.setAttribute("message", "Commande Updated Successfully");
                    response.sendRedirect(request.getContextPath() + "/commandes");
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
