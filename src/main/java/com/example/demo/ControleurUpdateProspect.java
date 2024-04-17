package com.example.demo;

import com.example.demo.dao.DaoClient;
import com.example.demo.dao.DaoProspect;
import com.example.demo.dao.daoException;
import com.example.demo.model.Client;
import com.example.demo.model.Prospect;
import com.example.demo.model.modelException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDate;


@WebServlet(name = "updateProspect", value = "/updateProspect")
public class ControleurUpdateProspect extends HttpServlet {
    private static Prospect prospect;
    private static Boolean test = false;

    public void init()  {
        test=false;
    }

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
            }
            response.sendRedirect("display");
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

