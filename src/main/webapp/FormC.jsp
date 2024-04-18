<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Formulaire Materialize</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link type="text/css" rel="stylesheet" href="./public/css/Accueil.css"  media="screen,projection"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
</head>
<body>
<jsp:include page="header.jsp" />
    <main>
    <div class="container">
        <h2 class="center-align">Client</h2>
        <div class="row">
            <form class="col s12" action="formulaireClient" method="post">
                <div class="row">
                    <div class="input-field col s12">
                        <label for="nom">Raison Social</label>
                        <input id="nom" name="raisonSocial" type="text" class="validate">
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <label for="prenom">Téléphone</label>
                        <input id="prenom" name="telephone" type="text" class="validate">
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <label for="email">Email</label>
                        <input id="email" name="email" type="email" class="validate">
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <label for="telephone">Numéro Rue</label>
                        <input id="telephone" name="numeroRue" type="number" class="validate">
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <label for="adresse">Nom Rue</label>
                        <textarea id="adresse" name="nomRue" class="materialize-textarea"></textarea>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <label for="ville">Ville</label>
                        <input id="ville" name="ville" type="text" class="validate">
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <label for="codepostal">Code Postal</label>
                        <input id="codepostal" name="codePostal" type="number" class="validate">
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <textarea id="commentaire" name="commentaire" class="materialize-textarea" data-length="120"></textarea>
                        <label for="commentaire">Commentaire</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <label for="ca">Chiffre d'Affaire</label>
                        <input id="ca" name="chiffreAffaire" type="number" class="validate">
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <label for="date">Nombre d'Employé</label>
                        <input id="date" name="nombreEmploye" type="number" class="validate">
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <button class="btn waves-effect waves-light" type="submit" name="action">Créer
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
