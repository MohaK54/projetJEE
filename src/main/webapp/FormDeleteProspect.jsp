<%@ page import="com.example.demo.model.Client" %>
<%@ page import="com.example.demo.dao.DaoClient" %>
<%@ page import="com.example.demo.model.Prospect" %>
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
            <% Prospect prospect = (Prospect) request.getAttribute("prospect");
                String rs = prospect.getRaisonSociale();
                String tel = prospect.getTelephone();
                String mail = prospect.getAdresseMail();
                String numrue = prospect.getNumeroRue();
                String nomrue = prospect.getNomRue();
                String ville = prospect.getVille();
                String cp = prospect.getCodePostal();
                String comm = prospect.getCommentaire();
                String date = String.valueOf(prospect.getDateProspection());
                String interet = String.valueOf(prospect.getInteret());
            %>
            <form class="col s12" action="deleteProspect" method="post">
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
                        <label for="date">Date</label>
                        <input id="date" name="date" type="date" class="validate" value="<%=date%>">
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <select name="interet">
                            <option value=<%=interet%> selected ><%=interet%></option>
                            <option value="oui">OUI</option>
                            <option value="non">NON</option>
                        </select>
                        <label>Interessé</label>
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
</body>
</html>

