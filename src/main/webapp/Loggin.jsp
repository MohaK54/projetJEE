<%@ page import="com.example.demo.utilities.Tokken" %>
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
                    <form action="loggin" method="post" class="col s12">
                      <div class="row">
                        <div class="input-field col s12">
                          <input name="email" id="email" type="email" class="validate">
                          <label for="email">Email</label>
                        </div>
                      </div>
                      <div class="row">
                        <div class="input-field col s12">
                          <input name="password" id="password" type="password" class="validate">
                          <label for="password">Mot de passe</label>
                        </div>
                      </div>
                        <input type="hidden" name="csrfToken" value="<%= Tokken.getToken() %>">
                      <div class="row">
                        <div class="input-field col s12 center">
                          <button class="btn waves-effect waves-light" type="submit" name="action">Connexion
                            <i class="material-icons right">send</i>
                          </button>
                        </div>
                      </div>
                        <div class="row">
                            <div class="col s12">
                                <p class="center-align">
                                    <!-- Assurez-vous que la checkbox est à l'intérieur de la balise form -->
                                    <label>
                                        <input type="checkbox" id="garderSessionOuverte" name="garderSessionOuverte" />
                                        <span>Garder ma session ouverte</span>
                                    </label>
                                </p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col s12">
                                <p class="center-align">Vous n'avez pas de compte ? <a href="Inscription.jsp">Inscrivez-vous</a></p>
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

    </body>
    </html>