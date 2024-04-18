package com.example.demo.Servlet;

import com.example.demo.dao.DaoClient;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "choiceClient", value = {"/choiceClient","/choiceClientD"})
public class ChoiceClientServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String path = request.getServletPath();

            List<String> raisonSocials = DaoClient.findAllRS();
            request.setAttribute("raisonSocials", raisonSocials);

            String action ="choiceClient" ;

            // Modifiez l'action si nécessaire en fonction de votre logique
            // Par exemple, si vous souhaitez rediriger vers la suppression
            if (path.equals("/choiceClient")) {
                action = "choiceClient";
            }
            else if (path.equals("/choiceClientD")) {
                action = "choiceClientD";
            }

            // Ajoutez l'action à la requête pour la récupérer dans la page JSP
            request.setAttribute("action", action);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/ChoiceClient.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            throw new ServletException("Erreur lors de la récupération des clients", e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String raisonSocial = request.getParameter("client");
        HttpSession session = request.getSession();
        session.setAttribute("raisonSocial", raisonSocial);


        String path = request.getServletPath();
        if (path.equals("/choiceClient")) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("updateClient");
            dispatcher.forward(request, response);
        }else if (path.equals("/choiceClientD")) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("deleteClient");
            dispatcher.forward(request, response);
        }

    }
}
