package com.example.demo.Servlet;

import com.example.demo.dao.DaoProspect;
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
import java.util.List;

@WebServlet(name = "choiceProspect", value = {"/choiceProspect","/choiceProspectD"})
public class ChoiceProspectServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String path = request.getServletPath();

            List<String> raisonSocials = DaoProspect.findAllRS();
            request.setAttribute("raisonSocials", raisonSocials);

            String action ="choiceProspect" ;

            // Modifiez l'action si nécessaire en fonction de votre logique
            // Par exemple, si vous souhaitez rediriger vers la suppression
            if (path.equals("/choiceProspect")) {
                action = "choiceProspect";
            }
            else if (path.equals("/choiceProspectD")) {
                action = "choiceProspectD";
            }
            if (ServletLoggin.session == null || ServletLoggin.session.getAttribute("userName") == null){
                response.sendRedirect("ChoiceProspect.jsp");
            }
            else {
                // Ajoutez l'action à la requête pour la récupérer dans la page JSP
                request.setAttribute("action", action);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/ChoiceProspect.jsp");
                dispatcher.forward(request, response);
            }
        } catch (Exception e) {
            throw new ServletException("Erreur lors de la récupération des prospects", e);
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String csrfToken = request.getParameter("csrfToken");
        String sessionToken = Tokken.getToken();
        if (csrfToken != null && csrfToken.equals(sessionToken)) {
            String raisonSocial = request.getParameter("prospect");
            HttpSession session = request.getSession();
            session.setAttribute("raisonSocial", raisonSocial);


            String path = request.getServletPath();
            if (path.equals("/choiceProspect")) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("updateProspect");
                dispatcher.forward(request, response);
            } else if (path.equals("/choiceProspectD")) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("deleteProspect");
                dispatcher.forward(request, response);
            }
        }else
        {
            JOptionPane.showMessageDialog(null, "Warning user wuld lhram roh l'accueil");
            response.sendRedirect("index.jsp");
        }


    }
}
