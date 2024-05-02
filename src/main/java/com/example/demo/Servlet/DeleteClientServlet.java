package com.example.demo.Servlet;

import com.example.demo.dao.DaoClient;
import com.example.demo.model.Client;
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


@WebServlet(name = "deleteClient", value = "/deleteClient")
public class DeleteClientServlet extends HttpServlet {
    private static Client client;
    private static Boolean test = false;


    @Override
    public void init()  {
        test=false;
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            if (!test) {
                HttpSession session = request.getSession();
                String rs = (String) session.getAttribute("raisonSocial");

                    client = DaoClient.findByName(rs);

                request.setAttribute("client", client);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/FormDelete.jsp");
                dispatcher.forward(request, response);
                test = true;
            } else {
                String csrfToken = request.getParameter("csrfToken");
                String sessionToken = Tokken.getToken();
                if (csrfToken != null && csrfToken.equals(sessionToken)) {
                    DaoClient.delete(client.getIdentifiant());
                    response.sendRedirect("displayC");
                    test = false;
                } else {
                    JOptionPane.showMessageDialog(null, "Warning user wuld lhram roh l'accueil");
                    response.sendRedirect("index.jsp");
                }
            }

        }catch (Exception de) {
            response.sendRedirect("Error.jsp");
        }

    }


    @Override
    public void destroy() {
    }
}

