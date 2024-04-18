
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% String lien ="Login";
    if ( request.getSession().getAttribute("userName")==null)
{
    lien = "Login";
} else {
        lien = "Out";
    }
%>
<header>
    <nav>
        <div class="nav-wrapper">
            <a href="index"  class="brand-logo"><img class="responsive-img" style="height: 70px; width: 100px;" src="public/image/logo-png.png"> </a>
            <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="material-icons">menu</i></a>
            <ul style="width: 90%;" id="nav-mobile" class="right hide-on-med-and-down">
                <li class="navbar-link"><a href="index">Accueil</a></li>
                <li class="navbar-link"><a href="loggin"><%=lien%></a></li>
            </ul>
        </div>
    </nav>
    <ul class="sidenav" id="mobile-demo">
        <li class="navbar-link"><a href="index">Accueil</a></li>
        <li class="navbar-link"><a href="loggin">Login</a></li>
    </ul>
</header>
<% if (request.getSession().getAttribute("mail") != null) { %>
<h1><%= request.getSession().getAttribute("userName") %></h1>
<% } %>
