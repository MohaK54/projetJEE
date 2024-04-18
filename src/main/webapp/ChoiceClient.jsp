<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: CDA01
  Date: 16/04/2024
  Time: 13:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Choisir un client</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link type="text/css" rel="stylesheet" href="./public/css/Accueil.css"  media="screen,projection"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
</head>
<body>
<jsp:include page="header.jsp" />
<main>
<table>
    <thead>
    <tr>
        <th class="center" colspan="2"> <h5>Clients </h5></th>
    </tr>
    </thead>
    <tbody>
    <% for (String rs : (List<String>) request.getAttribute("raisonSocials")) { %>
    <tr>
        <td style="border-right: unset; border-radius: unset">
            <%= rs %>
        </td>
        <td style="border-left: unset; border-radius: unset">
            <button onclick="copierNom('<%=(rs) %>')">Séléctionner</button>
        </td>
    </tr>
    <% } %>
    </tbody>
</table>
<% String action;
    if (request.getAttribute("action").equals("choiceClient")){
     action = "choiceClient";
} else {
     action = "choiceClientD";
} %>
<form method="post" action=<%=action%>>
    <label for="client">Quel Client voulez-Vous modifier ?</label>
    <input id="client" name="client" type="text" class="validate">
    <button class="btn waves-effect waves-light" type="submit" name="action">choisir
        <i class="material-icons right">send</i>
    </button>
</form>
</main>
<jsp:include page="footer.jsp" />
</body>
</html>
