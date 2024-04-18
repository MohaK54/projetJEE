package com.example.demo.Servlet;

import com.example.demo.dao.DaoClient;
import com.example.demo.model.Client;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;


@WebServlet(name = "deleteClient", value = "/deleteClient")
public class DeleteClientServlet extends HttpServlet {
    private static Client client;
    private static Boolean test = false;

    public void init()  {
        test=false;
    }

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
                DaoClient.delete(client.getIdentifiant());
                response.sendRedirect("displayC");
                test = false;
            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    public void destroy() {
    }
}

