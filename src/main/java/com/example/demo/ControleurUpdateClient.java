package com.example.demo;

import com.example.demo.dao.DaoClient;
import com.example.demo.dao.daoException;
import com.example.demo.model.Client;
import com.example.demo.model.modelException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;


@WebServlet(name = "updateClient", value = "/updateClient")
public class ControleurUpdateClient extends HttpServlet {
    private static Client client;
    private static Boolean test = false;

    public void init()  {
        test=false;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            if (!test) {
                HttpSession session = request.getSession();
                String rs = (String) session.getAttribute("raisonSocial");
                client = DaoClient.findByName(rs);
                request.setAttribute("client", client);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/FormUpdateClient.jsp");
                dispatcher.forward(request, response);
                test = true;
            } else {

            String raisonSocial = request.getParameter("raisonSocial");
            String telephone = request.getParameter("telephone");
            String email = request.getParameter("email");
            String numeroRue = request.getParameter("numeroRue");
            String nomRue = request.getParameter("nomRue");
            String ville = request.getParameter("ville");
            String codePostal = request.getParameter("codePostal");
            String commentaire = request.getParameter("commentaire");
            String chiffreAffaireParam = request.getParameter("chiffreAffaire");
            String nombreEmployeParam = request.getParameter("nombreEmploye");

// Vérification du chiffre d'affaire
            double chiffreAffaire = 0.0; // Valeur par défaut
            if (chiffreAffaireParam != null && !chiffreAffaireParam.isEmpty()) {
                try {
                    chiffreAffaire = Double.parseDouble(chiffreAffaireParam);
                } catch (NumberFormatException e) {
                    // Gérer l'erreur de conversion
                    e.printStackTrace(); // ou une autre action appropriée
                }
            }

// Vérification du nombre d'employés
            int nombreEmploye = 0; // Valeur par défaut
            if (nombreEmployeParam != null && !nombreEmployeParam.isEmpty()) {
                try {
                    nombreEmploye = Integer.parseInt(nombreEmployeParam);
                } catch (NumberFormatException e) {
                    // Gérer l'erreur de conversion
                    e.printStackTrace(); // ou une autre action appropriée
                }
            }
            // Mettre à jour les données du client existant
            client.setRaisonSociale(raisonSocial);
            client.setTelephone(telephone);
            client.setAdresseMail(email);
            client.setNumeroRue(numeroRue);
            client.setNomRue(nomRue);
            client.setVille(ville);
            client.setCodePostal(codePostal);
            client.setCommentaire(commentaire);
            client.setChiffreDaffaire(chiffreAffaire);
            client.setNombreEmployer(nombreEmploye);
            DaoClient.update(client);
            }
            response.sendRedirect("displayC");
            test = false;


        } catch (ServletException | modelException e) {
            throw new RuntimeException(e);
        } catch (NumberFormatException e) {
            // Gérer l'erreur de conversion des nombres
            response.sendRedirect("errorPage.jsp");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    public void destroy() {
    }
}

