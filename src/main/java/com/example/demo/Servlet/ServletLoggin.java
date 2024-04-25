package com.example.demo.Servlet;

import com.example.demo.dao.DaoUser;
import com.example.demo.model.User;
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

@WebServlet(name = "loggin", value = "/loggin")
public class ServletLoggin extends HttpServlet {
    public static HttpSession session;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (session != null){
            session.invalidate();
            session = null;
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Loggin.jsp");
        dispatcher.forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String csrfToken = request.getParameter("csrfToken");
        String sessionToken = Tokken.getToken();
        if (csrfToken != null && csrfToken.equals(sessionToken)) {
            String eMail = request.getParameter("email");
            String passWord = request.getParameter("password");

            try {
                User user = DaoUser.findByMail(eMail);
                if (DaoUser.authenticate(eMail, passWord)) {
                    session = request.getSession();
                    session.setAttribute("userName", user.getUser());
                    session.setAttribute("mail", user.getMail());
                    response.sendRedirect("index");
                } else {
                    System.out.println(DaoUser.authenticate(eMail, passWord));
                    response.sendRedirect("loggin");
                }
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        } else {
            JOptionPane.showMessageDialog(null, "Warning user wuld lhram roh l'accueil");
            response.sendRedirect("index.jsp");
        }
    }
}
