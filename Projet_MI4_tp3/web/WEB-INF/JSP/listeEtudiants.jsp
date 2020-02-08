<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- IMPORT --%>
<%@ page import="java.util.*"%>
<%@ page import="java.lang.Integer"%>
<%@ page import="projet.data.*"%>

<%-- USEBEAN --%>
<jsp:useBean id="listeEtudiants" type="java.util.Collection<projet.data.Etudiant>" scope="request"/>

<div class="container">
<div class="row">
<!-- AFFICHAGE d'un titre  -->
<h3>Liste des Etudiants</h3>
	<a href="<%=application.getContextPath()%>/do/creationEtudiant" class="btn btn-info ml-4">Créer un etudiant</a></div>
<!-- AFFICHAGE des notes des étudiants  -->
<% if (listeEtudiants.size() != 0) {%>

<!-- tableau de notes  -->
<table class="table table-striped">
	<tr>
		<th>Etudiant</th>
		<th>Groupe</th>
		<th>Edition</th>
	</tr>
<%
int sommeMoyenneGenerale = 0;
for (Etudiant etudiant : listeEtudiants) {
%>
	<tr>
		<td><a href="<%= application.getContextPath()%>/do/etudiant?id=<%=etudiant.getId()%>"><%=etudiant.getPrenom()%> <%=etudiant.getNom()%></a></td>
		<td><%=etudiant.getGroupe().getNom()%></td>
		<td><a href="<%=application.getContextPath()%>/do/supprimerEtudiant?id=<%=etudiant.getId()%>" class="btn btn-danger ml-4">Delete</a></td>
	</tr>
<%
}
%>
</table><hr>

<% } else {%>

	<p>Aucun étudiant</p>
<%}%>

</div>
