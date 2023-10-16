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

/**
 *
 * @author HP
 */
@WebServlet(name = "Validation", urlPatterns = {"/validation"})
public class Validation extends HttpServlet {

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
        request.getRequestDispatcher("validation.jsp").forward(request, response);
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
        
        // getting the code form the user
        String code_digit_1 = request.getParameter("code_digit_1");
        String code_digit_2 = request.getParameter("code_digit_2");
        String code_digit_3 = request.getParameter("code_digit_3");
        String code_digit_4 = request.getParameter("code_digit_4");
        
        String userCodeString = code_digit_1 + code_digit_2 + code_digit_3 + code_digit_4; 
        
        // Convert the user-entered code to an integer
        int userCode = Integer.parseInt(userCodeString);
        
        // Retrieve the stored random code from the session
        HttpSession session = request.getSession();
        int code = (int) session.getAttribute("code");
        
        // check if the code was right
        if(userCode == code){
            System.out.println("email from session: " + (String) session.getAttribute("user_email"));
            response.sendRedirect("newPassword.jsp");
        }else{
            // set code invalid
            session.setAttribute("error", true);
            session.setAttribute("message", "invalid code!");
            response.sendRedirect("validation.jsp");
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
