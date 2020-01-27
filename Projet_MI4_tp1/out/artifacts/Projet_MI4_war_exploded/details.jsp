<%@ page import="projet.data.Etudiant" %>
<%@ page import="projet.data.GestionFactory" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Details</title>
</head>
<body>
<% int id= Integer.valueOf(request.getParameter("id"));
    Etudiant etudiant = GestionFactory.getEtudiantById(id);
%>
<p> Prenom: <%= etudiant.getPrenom()%></p>
<p> Nom: <%= etudiant.getNom()%></p>
<p> Nombre d'absence: <%= GestionFactory.getAbsencesByEtudiantId(id)%></p>
<p>
    <a href="index.jsp">Retour à la liste des etudiants</a>
</p>

    </body>
</html>
