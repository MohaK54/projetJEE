package com.example.demo.Servlet;

import java.io.*;
import java.util.UUID;

import com.example.demo.utilities.Tokken;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import javax.net.ssl.HandshakeCompletedEvent;

@WebServlet(name = "index", value = "/index")
public class ServletIndex extends HttpServlet {

    @Override
    public void init() throws ServletException {

    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

            Cookie cookie = new Cookie("nomCookie", "Jesuisuncookiequesmêmepasaccepte");
            cookie.setMaxAge(3600); // Durée de vie en secondes
            response.addCookie(cookie);


        RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
        dispatcher.forward(request, response);
    }



    @Override
    public void destroy() {

    }
}