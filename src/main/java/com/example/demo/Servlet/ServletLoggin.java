package com.example.demo.Servlet;

import com.example.demo.dao.DaoUser;
import com.example.demo.model.User;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "loggin", value = "/loggin")
public class ServletLoggin extends HttpServlet {
    public HttpSession session;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (session != null){
            request.getSession().invalidate();
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("/Loggin.jsp");
        dispatcher.forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String eMail = request.getParameter("email");
        String passWord = request.getParameter("password");

        try {
            User user = DaoUser.findByMail(eMail);
            if (user.getPassword().equals(passWord)) {
                session = request.getSession();
                session.setAttribute("userName", user.getUser());
                session.setAttribute("mail", user.getMail());
                response.sendRedirect("index.jsp");
            }
            else {
                response.sendRedirect("login.jsp");
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
