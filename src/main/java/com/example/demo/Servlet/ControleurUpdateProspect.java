package com.example.demo.Servlet;

import com.example.demo.dao.DaoProspect;
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


@WebServlet(name = "updateProspect", value = "/updateProspect")
public class ControleurUpdateProspect extends HttpServlet {
    private static Prospect prospect;
    private static Boolean test = false;


    @Override
    public void init()  {
        test=false;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/FormUpdateProspect.jsp");
        dispatcher.forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            if (!test) {
                HttpSession session = request.getSession();
                String rs = (String) session.getAttribute("raisonSocial");
                prospect = DaoProspect.findByName(rs);
                request.setAttribute("prospect", prospect);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/FormUpdateProspect.jsp");
                dispatcher.forward(request, response);
                test = true;
            } else {
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
                    String date = request.getParameter("date");
                    LocalDate localDate = LocalDate.parse(date);
                    String interet = request.getParameter("interet");

// Vérification du chiffre d'affaire
                    // Mettre à jour les données du client existant
                    prospect.setRaisonSociale(raisonSocial);
                    prospect.setTelephone(telephone);
                    prospect.setAdresseMail(email);
                    prospect.setNumeroRue(numeroRue);
                    prospect.setNomRue(nomRue);
                    prospect.setVille(ville);
                    prospect.setCodePostal(codePostal);
                    prospect.setCommentaire(commentaire);
                    prospect.setDateProspection(localDate);
                    prospect.setInteret(interet);
                    DaoProspect.update(prospect);

                    response.sendRedirect("display");
                    test = false;
                } else {
                    JOptionPane.showMessageDialog(null, "Warning user wuld lhram roh l'accueil");
                    response.sendRedirect("index.jsp");
                }
            }

        } catch (Exception de) {
            response.sendRedirect("Error.jsp");
        }

    }


    @Override
    public void destroy() {
    }
}

