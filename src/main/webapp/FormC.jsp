<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Formulaire Materialize</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link type="text/css" rel="stylesheet" href="../vuCss/Accueil.css"  media="screen,projection"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
</head>
<body>
    <header>
        <nav>
            <div class="nav-wrapper">
              <a href="index.jsp"  class="brand-logo"><img class="responsive-img" style="height: 70px; width: 100px;" src="public/image/logo-png.png"> </a>
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
    <div class="container">
        <h2 class="center-align">Client</h2>
        <div class="row">
            <form class="col s12">
                <div class="row">
                    <div class="input-field col s12">
                        <label for="nom">Raison Social</label>
                        <input id="nom" type="text" class="validate">
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <label for="prenom">Téléphone</label>
                        <input id="prenom" type="text" class="validate">
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <label for="email">Email</label>
                        <input id="email" type="email" class="validate">
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <label for="telephone">Numéro Rue</label>
                        <input id="telephone" type="number" class="validate">
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <label for="adresse">Nom Rue</label>
                        <textarea id="adresse" class="materialize-textarea"></textarea>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <label for="ville">Ville</label>
                        <input id="ville" type="text" class="validate">
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <label for="codepostal">Code Postal</label>
                        <input id="codepostal" type="number" class="validate">
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <textarea id="commentaire" class="materialize-textarea" data-length="120"></textarea>
                        <label for="commentaire">Commentaire</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <label for="ca">Chiffre d'Affaire</label>
                        <input id="ca" type="number" class="validate">
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <label for="date">Nombre d'Employé</label>
                        <input id="date" type="number" class="validate">
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <button class="btn waves-effect waves-light" type="submit" name="action">Soumettre
                            <i class="material-icons right">send</i>
                        </button>
                    </div>
                </div>
            </form>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var elems = document.querySelectorAll('select');
            var instances = M.FormSelect.init(elems);
        });
        document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('.sidenav');
    var instances = M.Sidenav.init(elems);
   });
    </script>
</body>
</html>
