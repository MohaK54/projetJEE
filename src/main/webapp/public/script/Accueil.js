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

document.addEventListener('DOMContentLoaded', function() {
    var element = document.querySelectorAll('.sidenav');
    var instances = M.Sidenav.init(element);
});