<%@ page import="com.example.demo.utilities.Tokken" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% Tokken.generateTokken(); %>
<!DOCTYPE html>
<html>
<head>
    <title>Accueil</title>
    <link type="text/css" rel="stylesheet" href="public/materialize/css/materialize.css"  media="screen,projection"/>
    <link type="text/css" rel="stylesheet" href="./public/css/Accueil.css"  media="screen,projection"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
</head>

<body>
<jsp:include page="header.jsp" />

<main>
    <h1 class="center">QUE SOUHAITEZ-VOUS MANIPULER</h1>
    <div id="choice" class="row">
        <div class="col m6 s12 button-container">
            <button class="crud center"  onclick="afficherClients()"><h2 class="center">Clients</h2></button>
        </div>

        <div class="col m6 s12 button-container">
            <button class="crud center" onclick="afficherProspects()"><h2 class="center" >Prospects</h2></button>
        </div>
    </div>

    <div class="container">
        <div id="clientsSection">
            <div class="row">
                <div class="col m6 s12">
                    <button class="crud"><a href="formulaireClient"><h2>Create Client</h2></a></button>
                </div>
                <div class="col m6 s12">
                    <button class="crud"><a href="choiceClient"><h2>Update Client</h2></a></button>
                </div>
                <div class="col m6 s12">
                    <button class="crud"><a href="displayC"><h2>Display Client</h2></a></button>
                </div>
                <div class="col m6 s12">
                    <button class="crud"><a href="choiceClientD"><h2>Delete Client</h2></a></button>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div id="prospectsSection">
            <div class="row" >
                <div class="col m6 s12">
                    <button class="crud"><a href="formulaireProspect"> <h2>Create Prospect</h2></a></button>
                </div>
                <div class="col m6 s12" >
                    <button class="crud"><a href="choiceProspect"><h2>Update Prospect</h2></a></button>
                </div>
                <div class="col m6 s12">
                    <button class="crud"><a href="display"><h2>Display Prospect</h2></a></button>
                </div>
                <div class="col m6 s12">
                    <button class="crud"><a href="choiceProspectD"><h2>Delete Prospect</h2></a></button>
                </div>
            </div>
        </div>
    </div>
</main>
<jsp:include page="footer.jsp" />

</body>
</html>