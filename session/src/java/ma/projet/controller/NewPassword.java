/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ma.projet.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import ma.projet.entity.Client;
import ma.projet.service.ClientService;

/**
 *
 * @author HP
 */
@WebServlet(name = "NewPassword", urlPatterns = {"/new_password"})
public class NewPassword extends HttpServlet {

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
        request.getRequestDispatcher("newPassword.jsp").forward(request, response);
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
        // get the new password and the confirmation
        String new_password = request.getParameter("new_password");
        String confirme_new_password = request.getParameter("confirme_new_password");
      
        HttpSession session = request.getSession();
        String user_email = (String) session.getAttribute("user_email");
        
        System.out.println("email: " + user_email);
        
        // getting the user by email
        ClientService cs = new ClientService();
        Client clt = cs.getByEmail(user_email);
        clt.setPassword(new_password);
        
        if(new_password.equals(confirme_new_password)){
            // update password
            cs.update(clt);
            System.out.println("password: " + clt.getPassword());
            session.removeAttribute("user_email");
            session.removeAttribute("code");
            session.setAttribute("password_changed", "changed");
            response.sendRedirect("auth.jsp");
        }else{
            request.setAttribute("msg", "password doesn't match!");
            response.sendRedirect("newPassword.jsp");
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
