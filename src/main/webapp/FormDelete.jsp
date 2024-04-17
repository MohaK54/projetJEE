<%@ page import="com.example.demo.model.Client" %>
<%@ page import="com.example.demo.dao.DaoClient" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Update Client</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link type="text/css" rel="stylesheet" href="./public/css/Accueil.css"  media="screen,projection"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
</head>
<body>
<jsp:include page="header.jsp" />
<main>

    <div class="container">
        <h2 class="center-align">Delete Client</h2>
        <div class="row">
            <% Client client = (Client) request.getAttribute("client");
                String rs = client.getRaisonSociale();
                String tel = client.getTelephone();
                String mail = client.getAdresseMail();
                String numrue = client.getNumeroRue();
                String nomrue = client.getNomRue();
                String ville = client.getVille();
                String cp = client.getCodePostal();
                String comm = client.getCommentaire();
                String ca = String.valueOf(client.getChiffreAffaire());
                String nbre = String.valueOf(client.getNbrEmploye());
            %>
            <form class="col s12" action="deleteClient" method="post">
                <div class="row">
                    <div class="input-field col s12">
                        <label for="raisonSocial">Raison Social</label>
                        <input id="raisonSocial" name="raisonSocial" type="text" class="validate" value=<%= rs  %>>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <label for="prenom">Téléphone</label>
                        <input id="prenom" name="telephone" type="text" class="validate" value=<%= tel %>>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <label for="email">Email</label>
                        <input id="email" name="email" type="email" class="validate" value=<%= mail %>>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <label for="telephone">Numéro Rue</label>
                        <input id="telephone" name="numeroRue" type="number" class="validate" value=<%= numrue %>>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <label for="adresse">Nom Rue</label>
                        <input id="adresse" name="nomRue" type="text" class="validate" value=<%= nomrue %>>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <label for="ville">Ville</label>
                        <input id="ville" name="ville" type="text" class="validate" value=<%= ville %>>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <label for="codepostal">Code Postal</label>
                        <input id="codepostal" name="codePostal" type="number" class="validate" value=<%=cp %>>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <textarea id="commentaire" name="commentaire" class="materialize-textarea" data-length="120" ><%= comm %></textarea>
                        <label for="commentaire">Commentaire</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <label for="ca">Chiffre d'Affaire</label>
                        <input id="ca" name="chiffreAffaire" type="number" class="validate" value=<%= ca %>>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <label for="date">Nombre d'Employé</label>
                        <input id="date" name="nombreEmploye" type="number" class="validate" value=<%= nbre%>>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <button class="btn waves-effect waves-light" type="submit" name="action">Supprimer
                            <i class="material-icons right">send</i>
                        </button>
                    </div>
                </div>
            </form>

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

