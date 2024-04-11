<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link type="text/css" rel="stylesheet" href="public/materialize/css/materialize.css"  media="screen,projection"/>
    <link type="text/css" rel="stylesheet" href="public/materialize/css/materialize.min.css"  media="screen,projection"/>
    <link type="text/css" href="public/css/Accueil.css" media="screen,projection" >

</head>
<body>
<header>
    <nav>
        <div class="nav-wrapper">
            <a href="index.jsp" class="brand-logo"><img class="responsive-img" style="height: 70px; width: 100px;" src="public/image/logo-png.png"> </a>
            <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="material-icons">menu</i></a>
            <ul style="width: 90%;" id="nav-mobile" class="right hide-on-med-and-down">
                <li class="navbar-link"><a href="index.jsp">Accueil</a></li>
                <li class="navbar-link"><a href="Loggin.jsp">Login</a></li>
            </ul>
        </div>
    </nav>
    <ul class="sidenav" id="mobile-demo">
        <li class="navbar-link"><a href="index.jsp">Accueil</a></li>
        <li class="navbar-link"><a href="Loggin.jsp">Login</a></li>
    </ul>
</header>
<main>
    <h1 class="center">QUE SOUHAITEZ-VOUS MANIPULER</h1>
    <div id="choice" class="row">
        <div class="col m6 s12 button-container">
            <button class="crud center"  onclick="afficherClients()"><h2 class="center">Clients</h2></button>
        </div>

        <div class="col m6 s12 button-container">
            <button class="crud center" onclick="afficherProspects()"><h2 class="center" >Prospects</h2></button>
        </div>
    </div>

    <div class="container">
        <div id="clientsSection">
            <div class="row">
                <div class="col m6 s12">
                    <button class="crud"><a href="FormC.jsp"><h2>Create Client</h2></a></button>
                </div>
                <div class="col m6 s12">
                    <button class="crud"><a href="FormC.jsp"><h2>Update Client</h2></a></button>
                </div>
                <div class="col m6 s12">
                    <button class="crud"><a href="displayC"><h2>Display Client</h2></a></button>
                </div>
                <div class="col m6 s12">
                    <button class="crud"><a href="FormC.jsp"><h2>Delete Client</h2></a></button>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div style="display: none" id="prospectsSection">
            <div class="row" >
                <div class="col m6 s12">
                    <button class="crud"><a href="FormP.jsp"> <h2>Create Prospect</h2></a></button>
                </div>
                <div class="col m6 s12" >
                    <button class="crud"><a href="FormP.jsp"><h2>Update Prospect</h2></a></button>
                </div>
                <div class="col m6 s12">
                    <button class="crud"><a href="Display.jsp"><h2>Display Prospect</h2></a></button>
                </div>
                <div class="col m6 s12">
                    <button class="crud"><a href="FormP.jsp"><h2>Delete Prospect</h2></a></button>
                </div>
            </div>
        </div>
    </div>
</main>
<footer class="page-footer">
    <div class="container">
        <div class="row">
            <div class="col l6 s12">
                <h5 class="white-text">Reverso</h5>
                <p class="grey-text text-lighten-4">En cas de besoin vous pouvez nous joindre 1h/24 1j/7 </p>
            </div>
            <div class="col l4 offset-l2 s12">
                <h5 class="white-text">Contacts</h5>
                <ul>
                    <li><a class="grey-text text-lighten-3" href="#!">Facebook</a></li>
                    <li><a class="grey-text text-lighten-3" href="#!">Instagram</a></li>
                    <li><a class="grey-text text-lighten-3" href="#!">Mail</a></li>
                    <li><a class="grey-text text-lighten-3" href="#!">Telephone</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="footer-copyright">
        <div class="container">
            © 2014 Copyright KEHLI Mohamed
            <a class="grey-text text-lighten-4 right" href="#!">More Links</a>
        </div>
    </div>
</footer>
<script src="public/script/Accueil.js"></script>
</body>
</html>