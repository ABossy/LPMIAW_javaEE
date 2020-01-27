<%@ page import="projet.data.Etudiant" %>
<%@ page import="projet.data.GestionFactory" %><%--
  Created by IntelliJ IDEA.
  User: astrid
  Date: 03/12/2019
  Time: 16:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Etudiants</title>
  </head>
  <body>
  <h1>Liste des étudiants inscrits, cliquez pour obtenir les details</h1>
  <%for (Etudiant etudiant : GestionFactory.getEtudiants()) {%>
  <div><a href="details.jsp?id=<%=etudiant.getId()%>"><%=etudiant.getNom()%>
    <%=etudiant.getPrenom()%>
  </a></div>
  <%}%>
  </body>
</html>
