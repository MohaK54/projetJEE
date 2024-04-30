package com.example.demo.filtre;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(urlPatterns = {"/FormC.jsp","/FormP.jsp","/ChoiceClient.jsp","/ChoiceProspect.jsp"}, description = "loggin")
public class AuthenticationFilter implements Filter {

    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialization code, if needed
        Filter.super.init(filterConfig);
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        HttpSession session = httpRequest.getSession(false);

        boolean logged = session != null && session.getAttribute("userName") != null;


        if (logged) {
            // Utilisateur connecté,laissez la requête passer
            chain.doFilter(request, response);
        } else if (httpRequest.getSession().getAttribute("userName")==null){
            // Utilisateur non connecté, rediriger vers la page de connexion
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/loggin");
        }
    }

    public void destroy() {
        // Cleanup code, if needed
    }
}
