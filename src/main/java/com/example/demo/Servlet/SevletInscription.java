package com.example.demo.Servlet;

import com.example.demo.dao.DaoClient;
import com.example.demo.dao.DaoUser;
import com.example.demo.model.Client;
import com.example.demo.model.User;
import com.example.demo.model.modelException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "inscription", value = "/inscription")
public class SevletInscription extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupération des paramètres du formulaire
        String userName = request.getParameter("userName");
        String eMail = request.getParameter("email");
        String passWord = request.getParameter("password");
        String passWordConfirm = request.getParameter("confirmPassword");
        if(userName != null || eMail != null || passWordConfirm.equals(passWord)) {
            try {
                // Création de l'objet Client
                User nouveauUser = new User(userName,eMail,passWord);

                // Appel de la méthode create de votre DAO pour insérer le nouveau client dans la base de données
                DaoUser.create(nouveauUser); // Initialisez votre DAO comme vous le faites habituellement
                response.sendRedirect("Loggin.jsp");
            } catch (modelException e) {
                throw new RuntimeException(e);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }



    }
}
