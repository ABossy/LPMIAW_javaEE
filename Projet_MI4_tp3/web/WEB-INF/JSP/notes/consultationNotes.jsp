<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- IMPORT --%>
<%@ page import="java.util.*"%>
<%@ page import="java.lang.Integer"%>
<%@ page import="projet.data.*"%>

<%-- USEBEAN --%>
<jsp:useBean id="listeNotesEtudiants" type="java.util.Map<projet.data.Etudiant,java.lang.Float>" scope="request"/>


<!--% ou en JAVA
Map<Etudiant,Integer> listeNotesEtudiants = (Map<Etudiant,Integer>)request.getAttribute("listeNotesEtudiants");
%-->
<div class="container">
<!-- AFFICHAGE d'un titre  -->
<h3>Moyennes générales</h3>

<!-- AFFICHAGE des notes des étudiants  -->
<% if (listeNotesEtudiants.size() != 0) {%>

<!-- tableau de notes  -->
<table class="table table-striped">
	<tr>
		<th>Etudiant</th>
		<th>Groupe</th>
		<th>Note</th>
	</tr>
<%
float sommeMoyenneGenerale = 0;
for (Map.Entry<Etudiant, Float> entry : listeNotesEtudiants.entrySet()) {
	Etudiant etudiant = entry.getKey();
	float note = entry.getValue();
%>
	<tr>
		<td><a href="<%= application.getContextPath()%>/do/etudiant?id=<%=etudiant.getId()%>"><%=etudiant.getPrenom()%> <%=etudiant.getNom()%></a></td>
<%--		<td><%=etudiant.getGroupe().getNom()%></td>--%>
		<td><% if (etudiant.getGroupe() != null) {%>
			<%=etudiant.getGroupe().getNom()%>
			<% } else {%>
			Aucun groupe
			<%}%></td>
		<td><%=note%></td>
	</tr>
<%

	// Calcul de la somme totale des notes pour calcul de la moyenne
	sommeMoyenneGenerale = sommeMoyenneGenerale + note;
}
%>
</table>

<p>Moyenne des étudiants : <%= sommeMoyenneGenerale/listeNotesEtudiants.size()%></p>

<% } else {%>

	<p>Aucun étudiant</p>
<%}%>

</div>
