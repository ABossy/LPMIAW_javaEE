<%@ page import="projet.data.Etudiant" %>
<%@ page import="projet.data.GestionFactory" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="etudiant" class="projet.data.Etudiant" scope="request"/>
<html>
<head>
    <title>Details</title>
</head>
<body>

<p>Prénom :  <jsp:getProperty name="etudiant" property="prenom" /></p>
<p>Nom : <jsp:getProperty name="etudiant" property="nom" /></p>
<p>ID : <jsp:getProperty name="etudiant" property="id" /></p>
<p>Nombre d'absence : <jsp:getProperty name="etudiant" property="nbAbscence" /></p>
    <a href="index.jsp">Retour à la liste des etudiants</a>
</p>

    </body>
</html>
