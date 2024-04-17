<%@ page import="com.example.demo.model.Client" %>
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
</head>
<body>
<jsp:include page="header.jsp" />
    <main>
    <div class="container">
        <h2 class="center-align">Liste de Clients</h2>
        <div class="row">
            <table class="striped responsive-table">
                <thead>
                    <tr>
                        <th>Raison Social</th>
                        <th>Téléphone</th>
                        <th>Email</th>
                        <th>Numéro Rue</th>
                        <th>Nom rue</th>
                        <th>Ville</th>
                        <th>Code Postal</th>
                        <th>Chiffre d'Affaire</th>
                        <th>Nombre d'Employé</th>
                    </tr>
                </thead>
                <tbody>
                <% for (Client client : (List<Client>) request.getAttribute("clients")) { %>
                    <tr>
                        <td><%= client.getRaisonSociale() %></td>
                        <td><%= client.getTelephone() %></td>
                        <td><%= client.getCodePostal() %></td>
                        <td><%= client.getNumeroRue() %></td>
                        <td><%= client.getNomRue() %></td>
                        <td><%= client.getVille() %></td>
                        <td><%= client.getAdresseMail() %></td>
                        <td><%= client.getNbrEmploye() %></td>
                        <td><%= client.getChiffreAffaire() %></td>
                    </tr>
                <% }%>
                </tbody>
            </table>
        </div>
    </div>
    </main>
<jsp:include page="footer.jsp" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Importation de la bibliothèque Materialize JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <script src="public/script/Accueil.js"></script>
</body>
</html>
