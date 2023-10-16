package com.a00n.controllers;

import com.a00n.entities.Categorie;
import com.a00n.service.CategorieService;
import java.io.IOException;
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
@WebServlet(name = "CategorieController", urlPatterns = {"/categories"})
public class CategorieController extends HttpServlet {

    private CategorieService cs = new CategorieService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("categories", cs.findAll());
        request.getRequestDispatcher("/categories.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String op = request.getParameter("op");
        List<Categorie> categories = cs.findAll();
        HttpSession session = request.getSession();
        int id;
        String libelle;
        String code;
        switch (op) {
            case "add":
                code = request.getParameter("code");
                libelle = request.getParameter("libelle");
                if (code.isEmpty() || libelle.isEmpty()) {
                    session.setAttribute("status", "danger");
                    session.setAttribute("message", "Please fill all fields");
                    response.sendRedirect(request.getContextPath() + "/categories");
//                    request.setAttribute("categories", categories);
//                    request.getRequestDispatcher("/categories.jsp").forward(request, response);
                }
                Categorie categorie = new Categorie(code, libelle);
                cs.create(categorie);
                session.setAttribute("status", "success");
                session.setAttribute("message", "Categorie Created Successfully");
                response.sendRedirect(request.getContextPath() + "/categories");
//                request.getRequestDispatcher("/categories.jsp").forward(request, response);
                break;
            case "delete":
                id = Integer.parseInt(request.getParameter("id"));
                cs.delete(cs.findById(id));
                session.setAttribute("status", "success");
                session.setAttribute("message", "Categorie Deleted Successfully");
                response.sendRedirect(request.getContextPath() + "/categories");
                break;
            case "update":
                id = Integer.parseInt(request.getParameter("id"));
                categorie = cs.findById(id);
                if (categorie == null) {
                    session.setAttribute("status", "danger");
                    session.setAttribute("message", "Categorie Not Found");
                    response.sendRedirect(request.getContextPath() + "/categories");
                } else {
                    code = request.getParameter("code");
                    libelle = request.getParameter("libelle");
                    Categorie newCat = new Categorie(code, libelle);
                    newCat.setId(id);
                    newCat.setProduitList(categorie.getProduitList());
                    session.setAttribute("status", "success");
                    session.setAttribute("message", "Categorie Updated Successfully");
                    cs.update(newCat);
                    response.sendRedirect(request.getContextPath() + "/categories");
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
