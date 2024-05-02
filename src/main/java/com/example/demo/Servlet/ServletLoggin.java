package com.example.demo.Servlet;

import com.example.demo.dao.DaoUser;
import com.example.demo.model.User;
import com.example.demo.utilities.Tokken;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import javax.swing.*;
import java.io.IOException;

@WebServlet(name = "loggin", value = "/loggin")
public class ServletLoggin extends HttpServlet {
    public static HttpSession session;


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (session != null){
            session = request.getSession();
            session.invalidate();
            session = null;

        }
            RequestDispatcher dispatcher = request.getRequestDispatcher("/Loggin.jsp");
            dispatcher.forward(request, response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String csrfToken = request.getParameter("csrfToken");
        String sessionToken = Tokken.getToken();
        boolean garderSessionOuverte = request.getParameter("garderSessionOuverte") != null;
        if (csrfToken != null && csrfToken.equals(sessionToken)) {
            String eMail = request.getParameter("email");
            String passWord = request.getParameter("password");

            try {
                User user = DaoUser.findByMail(eMail);
                if (DaoUser.authenticate(eMail, passWord)) {
                    session = request.getSession();
                    session.setAttribute("userName", user.getUser());
                    session.setAttribute("mail", user.getMail());
                    if (garderSessionOuverte) {
                        // Définir une durée de session très longue ou aucune limite
                        session.setMaxInactiveInterval(-1); // Session indéfinie
                        System.out.println("vous resterez connecté");
                    } else {
                        session.setMaxInactiveInterval(30); // 30 minutes (durée par défaut)
                        System.out.println("connexion de 30 secondes");
                    }
                    response.sendRedirect("index");
                } else {
                    System.out.println(DaoUser.authenticate(eMail, passWord));
                    response.sendRedirect("loggin");
                }
            } catch (Exception de) {
                response.sendRedirect("Error.jsp");
            }
        } else {
            JOptionPane.showMessageDialog(null, "Warning user wuld lhram roh l'accueil");
            response.sendRedirect("index.jsp");
        }
    }
}
