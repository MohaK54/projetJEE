package com.example.demo.Servlet;

import com.example.demo.dao.DaoClient;
import com.example.demo.model.Client;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "displayClient", value = "/displayC")
public class ControleurDisplay extends HttpServlet {




    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Pour supprimer un cookie
            Cookie cookieToDelete = new Cookie("nomCookie", "");
            cookieToDelete.setMaxAge(0); // Définir le temps d'expiration à 0 pour supprimer le cookie
            response.addCookie(cookieToDelete);
            // Appel de la méthode de votre DAO pour récupérer tous les clients
            List<Client> clients = DaoClient.findAll();

            // Stockez les données récupérées dans la requête pour les transmettre à la vue (HTML)
            request.setAttribute("clients", clients);

            // Transfert de la requête à la vue (votre page JSP)
            RequestDispatcher dispatcher = request.getRequestDispatcher("/DisplayC.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            throw new ServletException("Erreur lors de la récupération des clients", e);
        }
    }
    public void destroy() {
    }
}
