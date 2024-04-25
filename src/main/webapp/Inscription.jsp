<%@ page import="com.example.demo.utilities.Tokken" %><%--
  Created by IntelliJ IDEA.
  User: CDA01
  Date: 18/04/2024
  Time: 13:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Inscription</title>
    <!--Import Google Icon Font-->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <!--Import materialize.css-->
    <link type="text/css" rel="stylesheet" href="public/materialize/css/materialize.css"  media="screen,projection"/>
    <link type="text/css" rel="stylesheet" href="./public/css/Accueil.css"  media="screen,projection"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
</head>
<body>
<jsp:include page="header.jsp"/>
<main>
<form style="margin-top: 5px" class="col s12" method="post" action="inscription">
    <div class="row">
        <div class="input-field col s12">
            <input id="userName" type="text" name="userName" class="validate" required>
            <label for="userName">Nom d'utilisateur</label>
        </div>
    </div>
    <div class="row">
        <div class="input-field col s12">
            <input id="email" type="email" name="email" class="validate" required>
            <label for="email">Adresse email</label>
        </div>
    </div>
    <div class="row">
        <div class="input-field col s12">
            <input id="password" type="password" name="password" class="validate" required>
            <label for="password">Mot de passe</label>
        </div>
    </div>
    <div class="row">
        <div class="input-field col s12">
            <input id="confirmPassword" type="password" name="confirmPassword" class="validate" required>
            <label for="confirmPassword">Confirmer le mot de passe</label>
        </div>
    </div>
    <input type="hidden" name="csrfToken" value="<%= Tokken.getToken() %>">
    <div class="row">
        <div class="input-field col s12">
            <button class="btn waves-effect waves-light" type="submit" name="action">S'inscrire
                <i class="material-icons right">send</i>
            </button>
        </div>
    </div>
</form>
</main>
<jsp:include page="footer.jsp"/>
</body>
</html>
