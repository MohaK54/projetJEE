<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Loggin</title>
      <!--Import Google Icon Font-->
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <!--Import materialize.css-->
      <link type="text/css" rel="stylesheet" href="public/materialize/css/materialize.css"  media="screen,projection"/>
      <link type="text/css" rel="stylesheet" href="public/css/Accueil.css"  media="screen,projection"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <style>
      /* Style additionnel */
      body {
        display: flex;
        min-height: 100vh;
        flex-direction: column;
      }
      main {
        margin-top: 5%;
        flex: 1 0 auto;
      }
      .input-field input[type=email]:focus + label,
      .input-field input[type=password]:focus + label {
        color: #1e88e5 !important;
      }
      /* Autres styles personnalisés */
    </style>

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
          <div class="row">
            <div class="col s12 m8 offset-m2 l6 offset-l3">
              <div class="card">
                <div class="card-content">
                  <span class="card-title center-align">Connexion</span>
                  <div class="row">
                    <form class="col s12">
                      <div class="row">
                        <div class="input-field col s12">
                          <input id="email" type="email" class="validate">
                          <label for="email">Email</label>
                        </div>
                      </div>
                      <div class="row">
                        <div class="input-field col s12">
                          <input id="password" type="password" class="validate">
                          <label for="password">Mot de passe</label>
                        </div>
                      </div>
                      <div class="row">
                        <div class="input-field col s12">
                          <button class="btn waves-effect waves-light" type="submit" name="action">Connexion
                            <i class="material-icons right">send</i>
                          </button>
                        </div>
                      </div>
                    </form>
                  </div>
                </div>
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


      <!-- Importation de jQuery -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
      <!-- Importation de la bibliothèque Materialize JavaScript -->
      <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
      <script>
        // Initialisation des composants Materialize
        $(document).ready(function(){
          $('.sidenav').sidenav();
          $('select').formSelect();
          $('.datepicker').datepicker();
          $('.timepicker').timepicker();
          $('.tooltipped').tooltip();
          $('.modal').modal();
          $('.dropdown-trigger').dropdown();
        });

        document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('.sidenav');
    var instances = M.Sidenav.init(elems, options);
  });
    </script>
    </body>
    </html>