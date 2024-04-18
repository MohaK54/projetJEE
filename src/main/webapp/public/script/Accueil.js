function afficherClients() {
    document.getElementById("clientsSection").style.display = "flex";
    document.getElementById("prospectsSection").style.display = "none";
    document.getElementById("choice").style.display = "none";
}

function afficherProspects() {
    document.getElementById("clientsSection").style.display = "none";
    document.getElementById("prospectsSection").style.display = "flex";
    document.getElementById("choice").style.display = "none";
}

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
function copierNom(nomClient) {
    var champSaisie = document.getElementById('client');
    champSaisie.value = nomClient;
    console.log('Nom inséré dans le champ de saisie :', nomClient);
}

document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('.sidenav');
    var instances = M.Sidenav.init(elems, options);
});



