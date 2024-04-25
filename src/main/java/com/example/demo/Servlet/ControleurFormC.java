package com.example.demo.Servlet;

import com.example.demo.utilities.Tokken;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import com.example.demo.model.Client;
import com.example.demo.dao.DaoClient;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import javax.swing.*;
import java.io.IOException;

@WebServlet(name = "formulaireClient", value = "/formulaireClient")
public class ControleurFormC extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("FormC.jsp");
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Récupération des paramètres du formulaire
        String csrfToken = request.getParameter("csrfToken");
        String sessionToken = Tokken.getToken();

        if (csrfToken != null && csrfToken.equals(sessionToken)) {
            String raisonSocial = request.getParameter("raisonSocial");
            String telephone = request.getParameter("telephone");
            String email = request.getParameter("email");
            String numeroRue = request.getParameter("numeroRue");
            String nomRue = request.getParameter("nomRue");
            String ville = request.getParameter("ville");
            String codePostal = request.getParameter("codePostal");
            String commentaire = request.getParameter("commentaire");
            double chiffreAffaire = Double.parseDouble(request.getParameter("chiffreAffaire"));
            int nombreEmploye = Integer.parseInt(request.getParameter("nombreEmploye"));
            try {
                // Création de l'objet Client
                Client nouveauClient = new Client(1, raisonSocial, numeroRue, nomRue, codePostal, ville, telephone, email, commentaire, chiffreAffaire, nombreEmploye);

                // Appel de la méthode create de votre DAO pour insérer le nouveau client dans la base de données
                DaoClient.create(nouveauClient); // Initialisez votre DAO comme vous le faites habituellement
            } catch (Exception e) {
                throw new RuntimeException(e);
            }


            // Redirection vers une autre page par exemple
            response.sendRedirect("displayC");
        } else {
        JOptionPane.showMessageDialog(null, "Warning user wuld lhram roh l'accueil");
        response.sendRedirect("index.jsp");
    }
    }

}


