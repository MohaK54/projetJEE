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


@WebServlet(name = "deleteProspect", value = "/deleteProspect")
public class DeleteProspectServlet extends HttpServlet {
    private static Prospect prospect;
    private static Boolean test = false;

    public void init()  {
        test=false;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            if (!test) {
                HttpSession session = request.getSession();
                String rs = (String) session.getAttribute("raisonSocial");

                prospect = DaoProspect.findByName(rs);

                request.setAttribute("prospect", prospect);
                RequestDispatcher dispatcher = request.getRequestDispatcher("/FormDeleteProspect.jsp");
                dispatcher.forward(request, response);
                test = true;
            } else {
                DaoProspect.delete(prospect.getIdentifiant());
                response.sendRedirect("display");
                test = false;
            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    public void destroy() {
    }
}

