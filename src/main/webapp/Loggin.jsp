<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Loggin</title>
      <!--Import Google Icon Font-->
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <!--Import materialize.css-->
      <link type="text/css" rel="stylesheet" href="public/materialize/css/materialize.css"  media="screen,projection"/>
      <link type="text/css" rel="stylesheet" href="./public/css/Accueil.css"  media="screen,projection"/>
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
<jsp:include page="header.jsp" />
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
    <jsp:include page="footer.jsp" />


      <!-- Importation de jQuery -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
      <!-- Importation de la bibliothèque Materialize JavaScript -->
      <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
      <script src="public/script/Accueil.js"></script>
    </body>
    </html>