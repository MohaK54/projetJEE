package com.example.demo.Servlet;

import com.example.demo.dao.DaoProspect;
import com.example.demo.model.Prospect;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "displayProspect", value = "/display")
public class ControleurDisplayProspect extends HttpServlet {




    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Appel de la méthode de votre DAO pour récupérer tous les clients
            List<Prospect> prospects = DaoProspect.findAll();

            // Stockez les données récupérées dans la requête pour les transmettre à la vue (HTML)
            request.setAttribute("prospects", prospects);

            // Transfert de la requête à la vue (votre page JSP)
            RequestDispatcher dispatcher = request.getRequestDispatcher("/Display.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            throw new ServletException("Erreur lors de la récupération des clients", e);
        }
    }
    public void destroy() {
    }
}
