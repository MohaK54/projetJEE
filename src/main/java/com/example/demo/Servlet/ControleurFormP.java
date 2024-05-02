package com.example.demo.Servlet;

import com.example.demo.dao.DaoProspect;
import com.example.demo.dao.daoException;
import com.example.demo.model.Prospect;
import com.example.demo.model.modelException;
import com.example.demo.utilities.Tokken;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import javax.swing.*;
import java.io.IOException;
import java.time.LocalDate;
import java.util.logging.Level;

@WebServlet(name = "formulaireProspect", value = "/formulaireProspect")
public class ControleurFormP extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("FormP.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String csrfToken = request.getParameter("csrfToken");
        String sessionToken = Tokken.getToken();
        if (csrfToken != null && csrfToken.equals(sessionToken)) {
            // Récupération des paramètres du formulaire
            String raisonSocial = request.getParameter("raisonSocial");
            String telephone = request.getParameter("telephone");
            String email = request.getParameter("email");
            String numeroRue = request.getParameter("numeroRue");
            String nomRue = request.getParameter("nomRue");
            String ville = request.getParameter("ville");
            String codePostal = request.getParameter("codePostal");
            String commentaire = request.getParameter("commentaire");
            String date = request.getParameter("date");
            LocalDate localDate = LocalDate.parse(date);
            String interet = request.getParameter("interet");

            // Création de l'objet Client
            Prospect nouveauProspect = null;
            try {
                nouveauProspect = new Prospect(1, raisonSocial, numeroRue, nomRue, codePostal, ville, telephone, email, commentaire, localDate, interet);

                // Appel de la méthode create de votre DAO pour insérer le nouveau client dans la base de données
                DaoProspect.create(nouveauProspect); // Initialisez votre DAO comme vous le faites habituellement
            } catch (Exception de) {
                response.sendRedirect("Error.jsp");
            }


            // Redirection vers une autre page par exemple
            response.sendRedirect("display");
        } else {
            JOptionPane.showMessageDialog(null, "Warning user wuld lhram roh l'accueil");
            response.sendRedirect("index.jsp");
        }
    }
}
