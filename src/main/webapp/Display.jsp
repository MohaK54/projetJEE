<%@ page import="com.example.demo.model.Prospect" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Display</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link type="text/css" rel="stylesheet" href="./public/css/Accueil.css"  media="screen,projection"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <style>
      
    </style>
</head>
<body>
<jsp:include page="header.jsp" />
    <main>
    <div class="container">
        <h2 class="center-align">Liste de Prospect</h2>
        <div class="row">
            <table class="striped responsive-table">
                <thead>
                    <tr>
                        <th>Raison Social</th>
                        <th>Téléphone</th>
                        <th>Code Postal</th>
                        <th>Numéro Rue</th>
                        <th>Nom rue</th>
                        <th>Ville</th>
                        <th>Email</th>
                        <th>Date</th>
                        <th>Intérêt</th>
                    </tr>
                </thead>
                <tbody>
                <% for (Prospect prospect : (List<Prospect>) request.getAttribute("prospects")) { %>
                <tr>
                    <td><%= prospect.getRaisonSociale() %></td>
                    <td><%= prospect.getTelephone() %></td>
                    <td><%= prospect.getCodePostal() %></td>
                    <td><%= prospect.getNumeroRue() %></td>
                    <td><%= prospect.getNomRue() %></td>
                    <td><%= prospect.getVille() %></td>
                    <td><%= prospect.getAdresseMail() %></td>
                    <td><%= prospect.getDateProspection() %></td>
                    <td><%= prospect.getInteret() %></td>
                </tr>
                <% }%>
                </tbody>
            </table>
        </div>
    </div>
    </main>
    <jsp:include page="footer.jsp" />

</body>
</html>
